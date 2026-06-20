<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Services\FishingService;

class FishingCommand extends Command{
    protected $signature = 'app:fishing {chat}';
    protected $description = 'Command description';

    public function handle(): void{
        $chat        = $this->argument('chat');
        $FishService = new FishingService();
        $username    = 'shurui21';
        $twitchId    = 1234567890;

        switch($chat){
            case '!fish':
                $fishList = $FishService->catchFish($twitchId, $username);

                $this->info("{$username} caught a " . $fishList->fish_name . "!");
                break;
            default:
                $this->error('Invalid chat argument. Use "!fish".');
                return;
        }
    }
}
