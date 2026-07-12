<?php

namespace App\Console\Commands;

use App\Jobs\FishingPhase;
use Illuminate\Console\Command;
use App\Services\FishingService;

class FishingCommand extends Command{
    protected $signature    = 'app:fishing {chat} {param?} {page?}';
    protected $description  = 'Gameplay functions for the fishing simulator';
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

        $this->username     = 'shurui21';
        $this->display_name = 'Shurui21';
        $this->twitchId     = '1234567890';
    }

    public function handle(): void{
        $chat        = $this->argument('chat');
        $param       = $this->argument('param');
        $page        = $this->argument('page');

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
        // Determined the fish
        $catch = $this->fishService->catchFish($this->twitchId, $this->username, $this->display_name);
        if($catch['status'] == 'error'){
            $this->info($catch['message']);
        }

        // Check the rarity
        if(in_array($catch['fish']->fish_rarity_id, [1,2])){
            // Finish the catch
            $status = $this->fishService->finishCatch($this->twitchId, $this->username, $catch);
            if($status['status'] == 'success'){
                $this->info($status['message']);
            }
        }else{
            // Info of fish approaching
            $this->info("A large shadow approaching your bait.");
        }
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
