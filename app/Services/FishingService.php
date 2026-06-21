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
    public $limit = 5;

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

    public function catchFish($twitchId, $username, $display_name){
        $equipped    = User::where('twitch_user_id', '=', intval($twitchId))->first();
        if(!$equipped){
            $equipped = $this->firstTimer($twitchId, $username, $display_name);
        }

        $bait        = Inventory::where('item_type', '=', 'BAIT')->where('item_id', '=', $equipped->user_bait)->where('user_id', '=', $twitchId)->first();
        $bait_amount = !$bait ? 0: $bait->item_amount;
        if($bait_amount <= 0){
            return ["status" => "error", "message" => "You are running out of bait."];
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
        $item_amount = Inventory::where('item_id', $catch->fish_id)->where('item_type', '=', 'FISH')->where('user_id', '=', $twitchId)->first()?->item_amount ?? 0;

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
                'message' => 'User not found, please chat !fish to get your own Rod and Bait!'
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

                $inv  = Inventory::where('item_id', '=', $bait->bait_id)->where('item_type', '=', 'BAIT')->where('user_id', '=', $twitchId)->first();

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

                $inv = Inventory::where('item_id', '=', $rod->rod_id)->where('item_type', '=', 'ROD')->where('user_id', '=', $twitchId)->first();

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

    public function checkInventory($twitchId, $param, $page){
        $inv    = Inventory::where('user_id', '=', $twitchId);
        $offset = ($page - 1) * $this->limit;

        switch ($param) {
            case 'fish':
                $sql        = $inv->where('item_type', '=', 'FISH')->join('t_fish as f', 't_inventory.item_id', '=', 'f.fish_id')->select('f.fish_name', 't_inventory.item_amount');
                $fishCount  = $sql->count();
                if($fishCount == 0){
                    return ["status" => "error", "message" => "You don't have any fish in your possesion."];
                }

                $fish       = $sql->offset($offset)->limit($this->limit)->get();
                if($fish->isEmpty()){
                    return ["status" => "error", "message" => "There's nothing on page {$page}"];
                }
                $messages   = "";

                foreach ($fish as $key => $value) {
                    $messages .= $value->fish_name.': '.$value->item_amount."\n";
                }

                return ['status' => 'success', "message" => $messages."\nTotal: ".$fishCount.' types of fishes'];
            case 'bait':
                $sql        = $inv->where('item_type', '=', 'BAIT')->join('t_bait as b', 't_inventory.item_id', '=', 'b.bait_id')->select('b.bait_name', 't_inventory.item_amount');
                $baitCount  = $sql->count();
                if($baitCount == 0){
                    return ["status" => "error", "message" => "You don't have any bait in your possesion."];
                }

                $bait       = $sql->offset($offset)->limit($this->limit)->get();
                if($bait->isEmpty()){
                    return ["status" => "error", "message" => "There's nothing on page {$page}"];
                }
                $messages   = "";

                foreach ($bait as $key => $value) {
                    $messages .= $value->bait_name.': '.$value->item_amount."\n";
                }

                return ['status' => 'success', "message" => $messages."\nTotal: ".$baitCount.' types of baits'];
            case 'rod':
                $sql        = $inv->where('item_type', '=', 'ROD')->join('t_rod as r', 't_inventory.item_id', '=', 'r.rod_id')->select('r.rod_name');
                $rodCount  = $sql->count();
                if($rodCount == 0){
                    return ["status" => "error", "message" => "You don't have any rod in your possesion."];
                }

                $rod       = $sql->offset($offset)->limit($this->limit)->get();
                if($rod->isEmpty()){
                    return ["status" => "error", "message" => "There's nothing on page {$page}"];
                }
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
        $value   = count($fields) > 1 ? $fields[1]: null;

        switch ($fields[0]) {
            case 'fish':
                if($value){
                    $fish = Fish::where('fish_name', 'LIKE', '%'.$value.'%')->first();
                    if(!$fish){
                        $message = "There's no fish with that name!";
                        break;
                    }

                    $message = $fish->fish_description;
                    break;
                }
                $message = "desc fish={fish_name}: Check the desciption of that fish.";

                break;
            case 'bait':
                if($value){
                    $bait = Bait::where('bait_name', 'LIKE', '%'.$value.'%')->first();
                    if(!$bait){
                        $message = "There's no bait with that name!";
                        break;
                    }

                    $message = $bait->bait_description;
                    break;
                }
                $message = "desc bait={bait_name}: Check the desciption of that bait.";

                break;
            case 'rod':
                if($value){
                    $rod = Rod::where('rod_name', 'LIKE', '%'.$value.'%')->first();
                    if(!$rod){
                        $message = "There's no rod with that name!";
                        break;
                    }

                    $message = $rod->rod_description;
                    break;
                }
                $message = "desc rod={rod_name}: Check the desciption of that rod.";

                break;
            default:
                $message = "desc {type}={item}: Check the desciption of that item";
                break;
        }

        return ["status" => "success", "message" => $message];
    }

    public function itemList($param, $page){
        $message = "";
        $fields  = explode("=", $param);
        $val     = count($fields) <= 1 ? "": $fields[1];
        $offset  = ($page - 1) * $this->limit;

        switch ($fields[0]) {
            case 'fish':
                if($val){
                    $sql  = Fish::join('t_fish_bait as fb', 'fb.fish_id', '=', 't_fish.fish_id')
                                ->join('t_bait as b', 'b.bait_id', '=', 'fb.bait_id')
                                ->select(
                                    'b.bait_name',
                                    't_fish.fish_name',
                                )
                                ->where('t_fish.fish_name', 'LIKE', '%'.$val.'%');
                    if($sql->count() == 0){
                        return ["status" => "error", "message" => "There's no fish by that name!"];
                    }

                    $fish = $sql->offset($offset)->limit($this->limit)->get();

                    if($fish->isEmpty()){
                        return ["status" => "error", "message" => "There's nothing on page {$page}"];
                    }

                    $message .= $fish[0]->fish_name."\n\n";

                    $message .= $fish->pluck('bait_name')->implode("\n");
                }else{
                    $fish    = Fish::offset($offset)->limit($this->limit)->get();
                    if($fish->isEmpty()){
                        return ["status" => "error", "message" => "There's nothing on page {$page}"];
                    }

                    $message = $fish->pluck('fish_name')->implode("\n");
                }

                break;
            case 'bait':
                if($val){
                    $sql  = Bait::join('t_fish_bait as fb', 'fb.bait_id', '=', 't_bait.bait_id')
                                ->join('t_fish as f', 'f.fish_id', '=', 'fb.fish_id')
                                ->select(
                                    'f.fish_name',
                                    't_bait.bait_name',
                                )
                                ->where('t_bait.bait_name', 'LIKE', '%'.$val.'%');
                    if($sql->count() == 0){
                        return ["status" => "error", "message" => "There's no bait by that name!"];
                    }

                    $bait = $sql->offset($offset)->limit($this->limit)->get();

                    if($bait->isEmpty()){
                        return ["status" => "error", "message" => "There's nothing on page {$page}"];
                    }

                    $message .= $bait[0]->bait_name."\n\n";

                    $message .= $bait->pluck('fish_name')->implode("\n");
                }else{
                    $bait = Bait::offset($offset)->limit($this->limit)->get();
                    if($bait->isEmpty()){
                        return ["status" => "error", "message" => "There's nothing on page {$page}"];
                    }

                    $message  = $bait->pluck('bait_name')->implode("\n");
                }

                break;
            case 'rod':
                if($val){
                    $sql  = Rod::join('t_fish_rod as fr', 'fr.rod_id', '=', 't_rod.rod_id')
                                ->join('t_fish as f', 'f.fish_id', '=', 'fr.fish_id')
                                ->select(
                                    'f.fish_name',
                                    't_rod.rod_name',
                                )
                                ->where('t_rod.rod_name', 'LIKE', '%'.$val.'%');
                    if($sql->count() == 0){
                        return ["status" => "error", "message" => "There's no rod by that name!"];
                    }

                    $rod = $sql->offset($offset)->limit($this->limit)->get();

                    if($rod->isEmpty()){
                        return ["status" => "error", "message" => "There's nothing on page {$page}"];
                    }

                    $message .= $rod[0]->rod_name."\n\n";

                    $message .= $rod->pluck('fish_name')->implode("\n");
                }else{
                    $rod = Rod::offset($offset)->limit($this->limit)->get();
                    if($rod->isEmpty()){
                        return ["status" => "error", "message" => "There's nothing on page {$page}"];
                    }

                    $message  = $rod->pluck('rod_name')->implode("\n");
                }

                break;
            case 'location':
                if($val){
                    $sql  = Location::join('t_fish_location as fl', 'fl.location_id', '=', 't_location.location_id')
                                    ->join('t_fish as f', 'f.fish_id', '=', 'fl.fish_id')
                                    ->select(
                                        't_location.location_name',
                                        'f.fish_name',
                                    )
                                    ->where('t_location.location_name', 'LIKE', '%'.$val.'%');
                    if($sql->count() == 0){
                        return ["status" => "error", "message" => "There's no location by that name!"];
                    }

                    $location = $sql->offset($offset)->limit($this->limit)->get();

                    if($location->isEmpty()){
                        return ["status" => "error", "message" => "There's nothing on page {$page}"];
                    }

                    $message .= $location[0]->location_name."\n\n";

                    $message .= $location->pluck('fish_name')->implode("\n");
                }else{
                    $location = Location::offset($offset)->limit($this->limit)->get();
                    if($location->isEmpty()){
                        return ["status" => "error", "message" => "There's nothing on page {$page}"];
                    }

                    $message  = $location->pluck('location_name')->implode("\n");
                }

                break;
            case 'season':
                if($val){
                    $sql  = Season::join('t_fish_season as fs', 'fs.season_id', '=', 't_season.season_id')
                                    ->join('t_fish as f', 'f.fish_id', '=', 'fs.fish_id')
                                    ->select(
                                        't_season.season_name',
                                        'f.fish_name',
                                    )
                                    ->where('t_season.season_name', 'LIKE', '%'.$val.'%');
                    if($sql->count() == 0){
                        return ["status" => "error", "message" => "There's no season by that name!"];
                    }

                    $season = $sql->offset($offset)->limit($this->limit)->get();

                    if($season->isEmpty()){
                        return ["status" => "error", "message" => "There's nothing on page {$page}"];
                    }

                    $message .= $season[0]->season_name."\n\n";

                    $message .= $season->pluck('fish_name')->implode("\n");
                }else{
                    $season = Season::offset($offset)->limit($this->limit)->get();
                    if($season->isEmpty()){
                        return ["status" => "error", "message" => "There's nothing on page {$page}"];
                    }

                    $message  = $season->pluck('season_name')->implode("\n");
                }

                break;
            case 'weather':
                if($val){
                    $sql  = Weather::join('t_fish_weather as fw', 'fw.weather_id', '=', 't_weather.weather_id')
                                    ->join('t_fish as f', 'f.fish_id', '=', 'fw.fish_id')
                                    ->select(
                                        't_weather.weather_name',
                                        'f.fish_name',
                                    )
                                    ->where('t_weather.weather_name', 'LIKE', '%'.$val.'%');
                    if($sql->count() == 0){
                        return ["status" => "error", "message" => "There's no weather by that name!"];
                    }

                    $weather = $sql->offset($offset)->limit($this->limit)->get();

                    if($weather->isEmpty()){
                        return ["status" => "error", "message" => "There's nothing on page {$page}"];
                    }

                    $message .= $weather[0]->weather_name."\n\n";

                    $message .= $weather->pluck('fish_name')->implode("\n");
                }else{
                    $weather = Weather::offset($offset)->limit($this->limit)->get();
                    if($weather->isEmpty()){
                        return ["status" => "error", "message" => "There's nothing on page {$page}"];
                    }

                    $message  = $weather->pluck('weather_name')->implode("\n");
                }

                break;
            default:
                $message = "list {type}: Check all the list of that item";
                break;
        }

        return ["status" => "success", "message" => $message];
    }

    public function userRecord($twitchId, $page){
        $offset  = ($page - 1) * $this->limit;
        $message = "";
        $sql     = CatchLog::join('t_fish as f', 'f.fish_id', '=', 't_catch_log.fish_id')
                            ->select(
                                't_catch_log.fish_id',
                                'f.fish_name',
                                DB::raw('MIN(t_catch_log.fish_weight) as smallest'),
                                DB::raw('MAX(t_catch_log.fish_weight) as biggest'),
                            )
                            ->where('t_catch_log.user_id', '=', $twitchId);

        if($sql->count() == 0){
            return ['status' => 'error', 'message' => "You don't have any record."];
        }

        $logs   = $sql->groupBy('t_catch_log.fish_id', 'f.fish_name')
                      ->offset($offset)
                      ->limit($this->limit)
                      ->get();

        if($logs->isEmpty()){
            return ['status' => 'error', 'message' => "There's nothing on page {$page}"];
        }

        foreach ($logs as $value) {
            $message .= $value->fish_name."\nSmallest: {$value->smallest} kg\nBiggest: {$value->biggest} kg\n\n";
        }

        return ['status' => 'success', 'message' => $message];
    }

    private function getFish($twitchId, $fishList){
        $equipped    = User::where('twitch_user_id', '=', $twitchId)->first();
        $fishBait    = FishBait::where('bait_id', '=', $equipped->user_bait)->pluck('bait_modifier', 'fish_id');
        $fishRod     = FishRod::where('rod_id', '=', $equipped->user_rod) ->pluck('rod_modifier', 'fish_id');
        $bait        = Inventory::where('item_type', '=', 'BAIT')->where('item_id', '=', $equipped->user_bait)->where('user_id', '=', $twitchId)->first();
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

    private function firstTimer($twitchId, $username, $display_name){
        $id = User::insertGetId([
            'twitch_user_id' => $twitchId,
            'username'       => $username,
            'display_name'   => $display_name,
        ]);

        Inventory::fillAndInsert([
            [
                'user_id'       => $twitchId,
                'item_id'       => 1,
                'item_type'     => 'BAIT',
                'item_amount'   => 10,
            ],
            [
                'user_id'       => $twitchId,
                'item_id'       => 1,
                'item_type'     => 'ROD',
                'item_amount'   => 1,
            ],
        ]);

        $user = User::find($id);

        return $user;
    }
}
