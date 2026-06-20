<?php

namespace App\Services;

use App\Models\Fish;
use App\Models\Bait;
use App\Models\CatchLog;
use App\Models\FishBait;
use App\Models\GameState;
use App\Models\Inventory;

class FishingService{
    public $weather;
    public $season;
    public $location;

    public function __construct(){
        $this->weather  = GameState::latest()->first()->current_weather;
        $this->season   = GameState::latest()->first()->current_season;
        $this->location = GameState::latest()->first()->current_location;
    }

    public function fishList() {
        $sql = Fish::all();

        return $sql;
    }

    public function catchFish($twitchId, $username){
        $fish        = $this->getSql()->get();
        $catch       = $this->getFish($fish);
        $item_amount = Inventory::where('item_id', "FISH_".$catch->fish_id)->first()->item_amount ?? 0;

        CatchLog::create([
            'user_id'       => $twitchId,
            'fish_id'       => $catch->fish_id,
            'fish_weight'   => mt_rand($catch->fish_min_weight * 10, $catch->fish_max_weight * 10) / 10,
        ]);

        Inventory::updateOrCreate([
            'user_id'       => $twitchId,
            'item_id'       => "FISH_".$catch->fish_id,
        ], [
            'item_amount'   => $item_amount + 1,
        ]);

        return $catch;
    }

    private function getFish($fishList){
        $maxWeight  = $fishList->sum('fish_base_weight');
        $roll       = $this->rollDice($maxWeight);
        $current    = 0;

        foreach($fishList as $fish){
            $current += $fish->fish_base_weight;

            if($roll <= $current){
                return $fish;
            }
        }

        return null;

    }

    private function rollDice($weight){
        return rand(1, $weight);
    }

    private function getSql(){
        $sql = Fish::join('t_fish_location as fl', 'fl.fish_id', '=', 't_fish.fish_id')
                    ->join('t_fish_season as fs', 'fs.fish_id', '=', 't_fish.fish_id')
                    ->join('t_fish_weather as fw', 'fw.fish_id', '=', 't_fish.fish_id')
                    ->where('fl.location_id', $this->location)
                    ->where('fs.season_id', $this->season)
                    ->where('fw.weather_id', $this->weather);

        return $sql;
    }
}
