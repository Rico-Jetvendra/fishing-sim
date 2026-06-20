<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Services\FishingService;

class FishingCommand extends Command{
    protected $signature = 'app:fishing {chat} {param?} {page?}';
    protected $description = 'Command description';

    private const HELP = [
        'equip'     => "equip rod=name: For changing your rod\nequip bait=name: For changing your bait",
        'inv'       => "inv fish: Check how many fish you have\ninv bait: Check how many bait you have\ninv rod: Check how many rod you have\ninv {fish} 2: Check the second page of your fish inventory",
        'default'   => "fish: Start to fish\nequip: Change rod and bait\nstate: Check the current weather, location and season\ninv: Check inventory"
    ];

    public function __construct(private FishingService $fishService){
        parent::__construct();
    }

    public function handle(): void{
        $chat        = $this->argument('chat');
        $param       = $this->argument('param');
        $page        = $this->argument('page');
        $username    = 'shurui21';
        $twitchId    = 1234567890;

        switch($chat){
            case '!fish':
                $fishList = $this->fishService->catchFish($twitchId, $username);
                $message  = $fishList['status'] == 'success' ? "{$username} caught a " . $fishList['data']->fish_name . "! Weighing {$fishList['weight']} kg!" : $fishList['message'];

                $this->info($message);
                break;
            case '!equip':
                $equipment = $this->fishService->equipment($twitchId, $param);

                $this->info($equipment['message']);
                break;
            case '!state':
                $gameState = $this->fishService->gameState();

                $this->info("Location: {$gameState['location']} \nSeason: {$gameState['season']} \nWeather: {$gameState['weather']}");
                break;
            case '!change':
                if($twitchId != 1234567890){
                    $this->info("You don't have access for this command!");
                    break;
                }

                $changed = $this->fishService->changeState($param);
                $this->info($changed['message']);
                break;
            case '!inv':
                $inventory = $this->fishService->checkInventory($twitchId, $param, $page);

                $this->info($inventory['message']);
                break;
            case '!help':
                $this->info(self::HELP[$param] ?? self::HELP['default']);

                break;
            case '!desc':
                $desc = $this->fishService->checkDescription($param);

                $this->info($desc['message']);
                break;
            case '!list':
                $desc = $this->fishService->itemList($param);

                $this->info($desc['message']);
                break;
            default:
                $this->error('Invalid chat argument. Use "!help".');
                return;
        }
    }
}
