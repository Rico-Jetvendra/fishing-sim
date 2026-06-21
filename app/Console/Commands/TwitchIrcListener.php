<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Services\FishingService;

class TwitchIrcListener extends Command{
    protected $signature    = 'twitch:listen';
    protected $description  = 'Listen to Twitch Chat';
    protected $username     = '';
    protected $display_name = '';
    protected $twitchId     = '';

    private const HELP = [
        'equip'     => "equip rod={name}: For changing your rod\nequip bait={name}: For changing your bait",
        'inv'       => "inv fish: Check how many fish you have\ninv bait: Check how many bait you have\ninv rod: Check how many rod you have\ninv {type} {page}: Check the designated page of your inventory",
        'desc'      => "desc {type}={name}: Check the description of an item that you've selected",
        'list'      => "list {type}: Check all the list of that item",
        'default'   => "fish: Start to fish\nequip: Change rod and bait\nstate: Check the current weather, location and season\ninv: Check inventory\ndesc: Check the description of an item\nlist: Check all the list\nrecord: Check your personal record for fish"
    ];

    public function __construct(private FishingService $fishService){
        parent::__construct();
    }

    public function handle(){
        $channel = env('TWITCH_CHANNEL');

        $socket = fsockopen('irc.chat.twitch.tv', 6667);

        if (!$socket) {
            $this->error('Cannot connect');
            return self::FAILURE;
        }

        $guestName = 'justinfan' . rand(10000, 99999);

        fwrite($socket, "NICK {$guestName}\r\n");
        fwrite($socket, "CAP REQ :twitch.tv/tags\r\n");
        fwrite($socket, "JOIN #{$channel}\r\n");

        $this->info("Connected as {$guestName}");
        $this->info("Listening to #{$channel}");

        while (!feof($socket)) {
            $line = trim(fgets($socket));

            if (!$line) {
                continue;
            }

            $this->line($line);

            if (str_starts_with($line, 'PING')) {
                fwrite($socket, "PONG :tmi.twitch.tv\r\n");
                continue;
            }

            $parts = explode(' ', $line);
            $tags  = [];

            if (str_starts_with($parts[0], '@')) {
                $tagString = substr($parts[0], 1);

                foreach (explode(';', $tagString) as $tag) {
                    [$key, $value] = array_pad(explode('=', $tag, 2), 2, null);

                    $tags[$key] = $value;
                }
            }

            $this->twitchId     = $tags['user-id'] ?? null;
            $this->display_name = $tags['display-name'] ?? null;

            $message = null;

            if (preg_match('/PRIVMSG #[^ ]+ :(.*)$/', $line, $matches)) {
                $message = trim($matches[1]);
            }

            if(preg_match('/:([^!]+)!/', $line, $matches)){
                $this->username = $matches[1] ?? null;
            }

            $this->startGame($message);
        }

        fclose($socket);

        return self::SUCCESS;
    }

    private function startGame($message){
        $commands = explode(" ", $message);
        $chat     = $commands[0];
        $param    = $commands[1] ?? null;
        $page     = $commands[2] ?? null;

        switch($chat){
            case '!fish':
                $this->fish();
                break;
            case '!equip':
                $this->equip($param);
                break;
            case '!state':
                $this->state();
                break;
            case '!change':
                $this->change($param);
                break;
            case '!inv':
                $this->inv($param, $page);
                break;
            case '!help':
                $this->info(self::HELP[$param] ?? self::HELP['default']);

                break;
            case '!desc':
                $this->desc($param);
                break;
            case '!list':
                $this->list($param, $page);
                break;
            case '!record':
                $this->record($param);
                break;
            default:
                $this->error('Invalid chat argument. Use "!help".');
                return;
        }
    }

    private function fish(){
        $fishList = $this->fishService->catchFish($this->twitchId, $this->username, $this->display_name);
        $message  = $fishList['status'] == 'success' ? "{$this->username} caught a " . $fishList['data']->fish_name . "! Weighing {$fishList['weight']} kg!" : $fishList['message'];

        $this->info($message);
    }

    private function equip($param){
        $equipment = $this->fishService->equipment($this->twitchId, $param);

        $this->info($equipment['message']);
    }

    private function state(){
        $gameState = $this->fishService->gameState();

        $this->info("Location: {$gameState['location']} \nSeason: {$gameState['season']} \nWeather: {$gameState['weather']}");
    }

    private function change($param){
        if($this->twitchId != 1234567890){
            $this->info("You don't have access for this command!");
            return false;
        }

        $changed = $this->fishService->changeState($param);
        $this->info($changed['message']);
    }

    private function inv($param, $page){
        $inventory = $this->fishService->checkInventory($this->twitchId, $param, $page);

        $this->info($inventory['message']);
    }

    private function desc($param){
        $desc = $this->fishService->checkDescription($param);

        $this->info($desc['message']);
    }

    private function list($param, $page){
        $desc = $this->fishService->itemList($param, $page);

        $this->info($desc['message']);
    }

    private function record($page){
        $fish = $this->fishService->userRecord($this->twitchId, $page);

        $this->info($fish['message']);
    }
}
