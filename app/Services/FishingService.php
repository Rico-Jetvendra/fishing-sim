<?php

namespace App\Services;

use App\Models\{
    Fish,
    Bait,
    CatchLog,
    FishBait,
    FishRod,
    FishLocation,
    FishRarity,
    FishSeason,
    FishType,
    FishWeather,
    GameState,
    Inventory,
    Location,
    Rod,
    Season,
    User,
    Weather
};
use Illuminate\Support\Facades\DB;

class FishingService{
    public $weather;
    public $weather_name;
    public $season;
    public $season_name;
    public $location;
    public $location_name;

    public function __construct(){
        $game                   = GameState::latest()->first();
        $sql                    = $this->getState()->first();

        $this->weather          = $game->current_weather;
        $this->weather_name     = $sql->weather_name;
        $this->season           = $game->current_season;
        $this->season_name      = $sql->season_name;
        $this->location         = $game->current_location;
        $this->location_name    = $sql->location_name;
    }

    public function fishList() {
        $sql = Fish::all();

        return $sql;
    }

    public function catchFish($twitchId, $username){
        $equipped    = User::where('twitch_user_id', '=', $twitchId)->first();
        $bait        = Inventory::where('item_type', '=', 'BAIT')->where('item_id', '=', $equipped->user_bait)->first();
        $bait_amount = !$bait ? 0: $bait->item_amount;
        if($bait_amount <= 0){
            return ["status" => "error", "message" => "You running out of bait."];
        }

        $fish        = $this->getSql()->get();
        if(!$fish){
            return ["status" => "error", "message" => "There's no fish today."];
        }

        $catch       = $this->getFish($twitchId, $fish);
        if(!$catch){
            return ["status" => "error", "message" => "There's no catch today."];
        }

        $catchWeight = mt_rand($catch->fish_min_weight * 10, $catch->fish_max_weight * 10) / 10;
        $item_amount = Inventory::where('item_id', $catch->fish_id)->where('item_type', '=', 'FISH')->first()?->item_amount ?? 0;

        CatchLog::create([
            'user_id'       => $twitchId,
            'fish_id'       => $catch->fish_id,
            'fish_weight'   => $catchWeight,
        ]);

        Inventory::updateOrCreate([
            'user_id'       => $twitchId,
            'item_id'       => $catch->fish_id,
            'item_type'     => "FISH",
        ], [
            'item_amount'   => $item_amount + 1,
        ]);

        return ["status" => "success", "message" => "", "data" => $catch, "weight" => $catchWeight];
    }

    public function equipment($twitchId, $param){
        $user   = User::where('twitch_user_id', '=', $twitchId)->first();
        if (!$user) {
            return [
                'status' => 'error',
                'message' => 'User not found'
            ];
        }

        $fields = explode('=', $param, 2);

        if (count($fields) < 2) {
            return [
                'status'  => 'error',
                'message' => 'Invalid equipment format. Use bait=name or rod=name'
            ];
        }

        switch ($fields[0]) {
            case 'bait':
                $bait = Bait::where('bait_name', 'LIKE', '%'.$fields[1].'%')->first();

                if(!$bait){
                    return ['status' => 'error', "message" => "There's no bait with that name!"];
                }

                $inv  = Inventory::where('item_id', '=', $bait->bait_id)->where('item_type', '=', 'BAIT')->first();

                if(!$inv || $inv->item_amount <= 0){
                    return ['status' => 'error', "message" => "You don't have {$bait->bait_name} in your inventory!"];
                }

                $user->update([
                    'user_bait'     => $bait->bait_id,
                    'updated_date'  => now()
                ]);

                return ['status' => 'success', "message" => "Bait successfully changed into {$bait->bait_name}!"];
            case 'rod':
                $rod = Rod::where('rod_name', 'LIKE', '%'.$fields[1].'%')->first();

                if(!$rod){
                    return ['status' => 'error', "message" => "There's no rod with that name!"];
                }

                $inv = Inventory::where('item_id', '=', $rod->rod_id)->where('item_type', '=', 'ROD')->first();

                if(!$inv || $inv->item_amount <= 0){
                    return ['status' => 'error', "message" => "You don't have {$rod->rod_name} in your inventory!"];
                }

                $user->update([
                    'user_rod'     => $rod->rod_id,
                    'updated_date' => now()
                ]);

                return ['status' => 'success', "message" => "Rod successfully changed changed into {$rod->rod_name}!"];
            default:
                return ['status' => 'error', "message" => "There's no equipment with that name!"];
        }
    }

    public function gameState(){
        $sql = $this->getState()->first();

        return ['location' => $sql->location_name, 'season' => $sql->season_name, 'weather' => $sql->weather_name];
    }

    public function changeState($param){
        $fields = explode("=", $param);
        $value  = count($fields) > 1 ? $fields[1]: false;

        switch($fields[0]){
            case 'location':
                if(!$value){
                    $rand_loc = Location::where('location_id', '!=', $this->location)->inRandomOrder()->first();

                    if(!$rand_loc){
                        return ['status' => 'error', 'message' => "Unknown location. The party remains at {$this->location_name}."];
                    }

                    GameState::first()->update(['current_location' => $rand_loc->location_id]);

                    return ['status' => 'success', 'message' => "The party traveled to {$rand_loc->location_name}."];
                }
                $location = Location::where('location_name', 'LIKE', '%'.$value.'%')->first();

                if(!$location){
                    return ['status' => 'error', 'message' => "Unknown location. The party remains at {$this->location_name}."];
                }

                GameState::first()->update(['current_location' => $location->location_id]);

                return ['status' => 'success', 'message' => "The party traveled to {$location->location_name}."];
            case 'season':
                if(!$value){
                    $rand_sea = Season::where('season_id', '!=', $this->season)->inRandomOrder()->first();

                    if(!$rand_sea){
                        return ['status' => 'error', 'message' => "Unknown season. The world remains in {$this->season_name}."];
                    }

                    GameState::first()->update(['current_season' => $rand_sea->season_id]);

                    return ['status' => 'success', 'message' => "The season changed into {$rand_sea->season_name}."];
                }
                $season = Season::where('season_name', 'LIKE', '%'.$value.'%')->first();

                if(!$season){
                        return ['status' => 'error', 'message' => "Unknown season. The world remains in {$this->season_name}."];
                }

                GameState::first()->update(['current_season' => $season->season_id]);

                return ['status' => 'success', 'message' => "The season changed into {$season->season_name}."];
            case 'weather':
                if(!$value){
                    $rand_wea = Weather::where('weather_id', '!=', $this->weather)->inRandomOrder()->first();

                    if(!$rand_wea){
                        return ['status' => 'error', 'message' => "The weather refuse to change, it revert back to {$this->weather_name}."];
                    }

                    GameState::first()->update(['current_weather' => $rand_wea->weather_id]);

                    return ['status' => 'success', 'message' => "The weather changed to {$rand_wea->weather_name}."];
                }
                $weather = Weather::where('weather_name', 'LIKE', '%'.$value.'%')->first();

                if(!$weather){
                    return ['status' => 'error', 'message' => "The weather refuse to change, it revert back to {$this->weather_name}."];
                }

                GameState::first()->update(['current_weather' => $weather->weather_id]);

                return ['status' => 'success', 'message' => "The weather changed to {$weather->weather_name}."];
            default:
                return ['status' => 'error', 'message' => "There's no command for that."];
        }
    }

    public function checkInventory($twitchId, $param){
        $inv = Inventory::where('user_id', '=', $twitchId);

        switch ($param) {
            case 'fish':
                $fish       = $inv->where('item_type', '=', 'FISH')->join('t_fish as f', 't_inventory.item_id', '=', 'f.fish_id')->select('f.fish_name', 't_inventory.item_amount')->get();
                $fishCount  = $fish->count();
                $messages   = "";

                foreach ($fish as $key => $value) {
                    $messages .= $value->fish_name.': '.$value->item_amount."\n";
                }

                return ['status' => 'success', "message" => $messages."\nTotal: ".$fishCount.' types of fishes'];
            case 'bait':
                $bait       = $inv->where('item_type', '=', 'BAIT')->join('t_bait as b', 't_inventory.item_id', '=', 'b.bait_id')->select('b.bait_name', 't_inventory.item_amount')->get();
                $baitCount  = $bait->count();
                $messages   = "";

                foreach ($bait as $key => $value) {
                    $messages .= $value->bait_name.': '.$value->item_amount."\n";
                }

                return ['status' => 'success', "message" => $messages."\nTotal: ".$baitCount.' types of baits'];
            case 'rod':
                $rod       = $inv->where('item_type', '=', 'ROD')->join('t_rod as r', 't_inventory.item_id', '=', 'r.rod_id')->select('r.rod_name')->get();
                $rodCount  = $rod->count();
                $messages  = "";

                foreach ($rod as $key => $value) {
                    $messages .= $value->rod_name."\n";
                }

                return ['status' => 'success', "message" => $messages."\nTotal: ".$rodCount.' types of rods'];
            default:
                $inventory = $inv->select('t_inventory.item_type', DB::raw('COUNT(item_id) as total'))->groupBy('item_type')->get();
                $messages  = "";

                foreach ($inventory as $key => $value) {
                    $messages .= ucfirst(strtolower($value->item_type)).": {$value->total} types\n";
                }

                return ['status' => 'success', "message" => $messages];
                break;
        }
    }

    public function checkDescription($param){
        $message = "";
        $fields  = explode("=", $param);

        switch ($fields[0]) {
            case 'fish':
                $fish = Fish::where('fish_name', 'LIKE', '%'.$fields[1].'%')->first();

                $message = $fish->fish_description;
                break;
            case 'bait':
                $bait = Bait::where('bait_name', 'LIKE', '%'.$fields[1].'%')->first();

                $message = $bait->bait_description;
                break;
            case 'rod':
                $rod = Rod::where('rod_name', 'LIKE', '%'.$fields[1].'%')->first();

                $message = $rod->rod_description;
                break;
            default:
                $message = "desc {type}={item}: Check the desciption of that item";
                break;
        }

        return ["status" => "success", "message" => $message];
    }

    public function itemList($param){
        $message = "";
        $fields  = explode("=", $param);
        $val     = count($fields) <= 1 ? "": $fields[1];
        $config  = [
            'fish' => [
                'model'  => Fish::class,
                'main' => 'fish_name',
                'desc' => 'bait_name',
            ],
            'bait' => [
                'model'  => Bait::class,
                'main' => 'bait_name',
                'desc' => 'fish_name'
            ],
            'rod' => [
                'model'  => Rod::class,
                'main' => 'rod_name',
                'desc' => 'fish_name'
            ],
            'location' => [
                'model'  => Location::class,
                'main' => 'location_name',
                'desc' => 'fish_name',
            ],
            'season' => [
                'model'  => Season::class,
                'main' => 'season_name',
                'desc' => 'fish_name'
            ],
            'weather' => [
                'model'  => Weather::class,
                'main' => 'weather_name',
                'desc' => 'fish_name'
            ],
        ];

        if (!isset($config[$fields[0]])) {
            return [
                'status' => 'error',
                'message' => 'Unknown list type.'
            ];
        }

        $model      = $config[$fields[0]]['model'];
        $nameColumn = $config[$fields[0]]['main'];

        switch ($fields[0]) {
            case 'fish':
                if($val){
                    $fish = Fish::join('t_fish_bait as fb', 'fb.fish_id', '=', 't_fish.fish_id')
                                        ->join('t_bait as b', 'b.bait_id', '=', 'fb.bait_id')
                                        ->select(
                                            'b.bait_name',
                                            't_fish.fish_name',
                                        )
                                        ->where('t_fish.fish_name', 'LIKE', '%'.$val.'%')
                                        ->get();

                    if($fish->isEmpty()){
                        $message = "There's no fish by that name!";

                        return ["status" => "error", "message" => $message];
                    }

                    $message .= $fish[0]->fish_name."\n\n";

                    $message .= $fish->pluck('bait_name')->implode("\n");
                }else{
                    $message    = $model::pluck($nameColumn)->implode("\n");
                }

                break;
            case 'bait':
                if($val){
                    $bait = Bait::join('t_fish_bait as fb', 'fb.bait_id', '=', 't_bait.bait_id')
                                        ->join('t_fish as f', 'f.fish_id', '=', 'fb.fish_id')
                                        ->select(
                                            'f.fish_name',
                                            't_bait.bait_name',
                                        )
                                        ->where('t_bait.bait_name', 'LIKE', '%'.$val.'%')
                                        ->get();

                    if($bait->isEmpty()){
                        $message = "There's no bait by that name!";

                        return ["status" => "error", "message" => $message];
                    }

                    $message .= $bait[0]->bait_name."\n\n";

                    $message .= $bait->pluck('fish_name')->implode("\n");
                }else{
                    $message    = $model::pluck($nameColumn)->implode("\n");
                }

                break;
            case 'rod':
                if($val){
                    $rod = Rod::join('t_fish_rod as fr', 'fr.rod_id', '=', 't_rod.rod_id')
                                        ->join('t_fish as f', 'f.fish_id', '=', 'fr.fish_id')
                                        ->select(
                                            'f.fish_name',
                                            't_rod.rod_name',
                                        )
                                        ->where('t_rod.rod_name', 'LIKE', '%'.$val.'%')
                                        ->get();

                    if($rod->isEmpty()){
                        $message = "There's no rod by that name!";

                        return ["status" => "error", "message" => $message];
                    }

                    $message .= $rod[0]->rod_name."\n\n";

                    $message .= $rod->pluck('fish_name')->implode("\n");
                }else{
                    $message    = $model::pluck($nameColumn)->implode("\n");
                }

                break;
            case 'location':
                if($val){
                    $location = Location::join('t_fish_location as fl', 'fl.location_id', '=', 't_location.location_id')
                                        ->join('t_fish as f', 'f.fish_id', '=', 'fl.fish_id')
                                        ->select(
                                            't_location.location_name',
                                            'f.fish_name',
                                        )
                                        ->where('t_location.location_name', 'LIKE', '%'.$val.'%')
                                        ->get();

                    if($location->isEmpty()){
                        $message = "There's no location by that name!";

                        return ["status" => "error", "message" => $message];
                    }

                    $message .= $location[0]->location_name."\n\n";

                    $message .= $location->pluck('fish_name')->implode("\n");
                }else{
                    $message    = $model::pluck($nameColumn)->implode("\n");
                }

                break;
            case 'season':
                if($val){
                    $season = Season::join('t_fish_season as fs', 'fs.season_id', '=', 't_season.season_id')
                                        ->join('t_fish as f', 'f.fish_id', '=', 'fs.fish_id')
                                        ->select(
                                            't_season.season_name',
                                            'f.fish_name',
                                        )
                                        ->where('t_season.season_name', 'LIKE', '%'.$val.'%')
                                        ->get();

                    if($season->isEmpty()){
                        $message = "There's no season by that name!";

                        return ["status" => "error", "message" => $message];
                    }

                    $message .= $season[0]->season_name."\n\n";

                    $message .= $season->pluck('fish_name')->implode("\n");
                }else{
                    $message    = $model::pluck($nameColumn)->implode("\n");
                }

                break;
            case 'weather':
                if($val){
                    $weather = Weather::join('t_fish_weather as fw', 'fw.weather_id', '=', 't_weather.weather_id')
                                        ->join('t_fish as f', 'f.fish_id', '=', 'fw.fish_id')
                                        ->select(
                                            't_weather.weather_name',
                                            'f.fish_name',
                                        )
                                        ->where('t_weather.weather_name', 'LIKE', '%'.$val.'%')
                                        ->get();

                    if($weather->isEmpty()){
                        $message = "There's no weather by that name!";

                        return ["status" => "error", "message" => $message];
                    }

                    $message .= $weather[0]->weather_name."\n\n";

                    $message .= $weather->pluck('fish_name')->implode("\n");
                }else{
                    $message    = $model::pluck($nameColumn)->implode("\n");
                }

                break;
            default:
                $message = "list {type}: Check all the list of that item";
                break;
        }

        return ["status" => "success", "message" => $message];
    }

    private function getFish($twitchId, $fishList){
        $equipped    = User::where('twitch_user_id', '=', $twitchId)->first();
        $fishBait    = FishBait::where('bait_id', '=', $equipped->user_bait)->pluck('bait_modifier', 'fish_id');
        $fishRod     = FishRod::where('rod_id', '=', $equipped->user_rod) ->pluck('rod_modifier', 'fish_id');
        $bait        = Inventory::where('item_type', '=', 'BAIT')->where('item_id', '=', $equipped->user_bait)->first();
        $bait_amount = !$bait ? 0: $bait->item_amount;
        $current     = 0;
        $weights     = [];
        $maxWeight   = 0;

        foreach ($fishList as $fish) {
            $weight = $fish->fish_base_weight + ($fishBait[$fish->fish_id] ?? 0) + ($fishRod[$fish->fish_id] ?? 0);

            $weights[$fish->fish_id] = $weight;
            $maxWeight += $weight;
        }

        $roll = rand(1, $maxWeight);

        foreach($fishList as $fish){
            $current += $weights[$fish->fish_id];

            if($roll <= $current){
                $bait->update([
                    'item_amount' => $bait_amount - 1,
                    'updated_date' => now()
                ]);

                return $fish;
            }
        }

        return null;
    }

    private function getSql(){
        $sql = Fish::join('t_fish_location as fl', 'fl.fish_id', '=', 't_fish.fish_id')
                    ->join('t_fish_season as fs', 'fs.fish_id', '=', 't_fish.fish_id')
                    ->join('t_fish_weather as fw', 'fw.fish_id', '=', 't_fish.fish_id')
                    ->join('t_fish_type as ft', 'ft.fish_type_id', '=', 't_fish.fish_type')
                    ->join('t_fish_rarity as fr', 'fr.fish_rarity_id', '=', 't_fish.fish_rarity')
                    ->select(
                        't_fish.fish_id',
                        't_fish.fish_name',
                        't_fish.fish_type',
                        't_fish.fish_rarity',
                        't_fish.fish_base_weight',
                        't_fish.fish_min_weight',
                        't_fish.fish_max_weight',
                        't_fish.fish_description',
                        'fl.location_modifier',
                        'fs.season_modifier',
                        'fw.weather_modifier',
                        'ft.fish_type',
                        'fr.fish_rarity',
                        'fr.fish_initial',
                    )
                    ->where('fl.location_id', $this->location)
                    ->where('fs.season_id', $this->season)
                    ->where('fw.weather_id', $this->weather);

        return $sql;
    }

    private function getState(){
        $sql = GameState::join('t_location as l', 'l.location_id', '=', 't_game_state.current_location')
                        ->join('t_season as s', 's.season_id', '=', 't_game_state.current_season')
                        ->join('t_weather as w', 'w.weather_id', '=', 't_game_state.current_weather')
                        ->select(
                            'l.location_name',
                            's.season_name',
                            'w.weather_name',
                        );

        return $sql;
    }
}
