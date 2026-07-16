<?php

namespace App\Services;

use App\Models\{
    Fish,
    Bait,
    CatchLogs,
    City,
    FishBait,
    FishRod,
    FishLocation,
    FishSeason,
    FishWeather,
    GameState,
    Inventory,
    Location,
    Mutation,
    Rod,
    Season,
    User,
    Weather
};
use Illuminate\Support\Facades\DB;

class FishingService{
    public int $weather;
    public string $weather_name;
    public int $season;
    public string $season_name;
    public int $location;
    public string $location_name;
    public $limit = 5;

    public function __construct(){
        $sql                    = $this->getState()->first();

        $this->weather          = $sql->current_weather;
        $this->weather_name     = $sql->weather_name;
        $this->season           = $sql->current_season;
        $this->season_name      = $sql->season_name;
        $this->location         = $sql->current_location;
        $this->location_name    = $sql->location_name;
    }

    public function catchFish($twitchId, $username, $display_name){
        $equipped = User::where('twitch_user_id', '=', intval($twitchId))->first();
        if(!$equipped){
            $equipped = $this->firstTimer($twitchId, $username, $display_name);
        }

        $bait = Inventory::where('item_type', '=', 'BAIT')->where('item_id', '=', $equipped->user_bait)->where('user_id', '=', $twitchId)->first();
        $bait_amount = !$bait ? 0: $bait->item_amount;
        if($bait_amount <= 0){
            return ["status" => "error", "message" => "You are running out of bait."];
        }

        $fish = $this->getSql()->get();
        if(!$fish){
            return ["status" => "error", "message" => "There's no fish today."];
        }

        $catch = $this->getFish($twitchId, $fish);

        $catch['equipped'] = $equipped;
        return $catch;
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

        $text = $this->combineString($fields[1]);
        switch ($fields[0]) {
            case 'bait':
                $bait = Bait::where('bait_name', 'LIKE', '%'.$text.'%')->first();

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
                $rod = Rod::where('rod_name', 'LIKE', '%'.$text.'%')->first();

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

        $message = "Location: {$sql->location_name} | Season: {$sql->season_name} | Weather: {$sql->weather_name}";
        return ["status" => "success", "message" => $message];
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
                    $season  = $rand_loc->city_id == 3 ? collect([5, 6])->random() : collect([1, 2, 3, 4])->random();
                    $weather = Weather::inRandomOrder()->value('weather_id');
                    GameState::first()->update([
                        'current_location'  => $rand_loc->location_id,
                        'current_season'    => $season,
                        'current_weather'   => $weather,
                    ]);

                    return ['status' => 'success', 'message' => "The party traveled to {$rand_loc->location_name}."];
                }
                $location = Location::where('location_name', 'LIKE', '%'.$value.'%')->first();
                if(!$location){
                    return ['status' => 'error', 'message' => "Unknown location. The party remains at {$this->location_name}."];
                }

                $season  = $location->city_id == 3 ? collect([5, 6])->random() : collect([1, 2, 3, 4])->random();
                $weather = Weather::where('weather_id', '!=', $this->weather)->inRandomOrder()->value('weather_id');

                GameState::first()->update([
                    'current_location'  => $location->location_id,
                    'current_season'    => $season,
                    'current_weather'   => $weather,
                ]);

                return ['status' => 'success', 'message' => "The party traveled to {$location->location_name}."];
            case 'season':
                if(!$value){
                    $rand_sea = Season::where('season_id', '!=', $this->season)->inRandomOrder()->first();

                    if(!$rand_sea){
                        return ['status' => 'error', 'message' => "Unknown season. The world remains in {$this->season_name}."];
                    }

                    $weather = Weather::where('weather_id', '!=', $this->weather)->inRandomOrder()->value('weather_id');
                    GameState::first()->update(['current_season' => $rand_sea->season_id, 'current_weather' => $weather]);

                    return ['status' => 'success', 'message' => "The season changed into {$rand_sea->season_name}."];
                }
                $season = Season::where('season_name', 'LIKE', '%'.$value.'%')->first();

                if(!$season){
                    return ['status' => 'error', 'message' => "Unknown season. The world remains in {$this->season_name}."];
                }

                $weather = Weather::inRandomOrder()->value('weather_id');
                GameState::first()->update(['current_season' => $season->season_id, 'current_weather' => $weather]);

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
                $messages = "[".($page ?? 1)."/".ceil($fishCount / $this->limit)."]: ";

                foreach ($fish as $key => $value) {
                    $messages .= $value->fish_name.': '.$value->item_amount." | ";
                }

                return ['status' => 'success', "message" => $messages."Total: ".$fishCount.' types of fishes'];
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
                $messages = "[".($page ?? 1)."/".ceil($baitCount / $this->limit)."]: ";

                foreach ($bait as $key => $value) {
                    $messages .= $value->bait_name.': '.$value->item_amount." | ";
                }

                return ['status' => 'success', "message" => $messages."Total: ".$baitCount.' types of baits'];
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
                $messages = "[".($page ?? 1)."/".ceil($rodCount / $this->limit)."]: ";

                foreach ($rod as $key => $value) {
                    $messages .= $value->rod_name." | ";
                }

                return ['status' => 'success', "message" => $messages."Total: ".$rodCount.' types of rods'];
            case 'mutation':
                $sql        = $inv->where('item_type', '=', 'TERAS')->join('t_mutation as f', 't_inventory.item_id', '=', 'f.mutation_id')->select('f.mutation_name', 't_inventory.item_amount');
                $fishCount  = $sql->count();
                if($fishCount == 0){
                    return ["status" => "error", "message" => "You don't have any mutated fish in your possesion."];
                }

                $fish       = $sql->offset($offset)->limit($this->limit)->get();
                if($fish->isEmpty()){
                    return ["status" => "error", "message" => "There's nothing on page {$page}"];
                }
                $messages = "[".($page ?? 1)."/".ceil($fishCount / $this->limit)."]: ";

                foreach ($fish as $key => $value) {
                    $messages .= $value->mutation_name.': '.$value->item_amount." | ";
                }

                return ['status' => 'success', "message" => $messages."Total: ".$fishCount.' types of mutated fishes'];
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
        $value   = count($fields) > 1 ? $this->combineString($fields[1]): null;

        switch ($fields[0]) {
            case 'fish':
                if($value){
                    $fish = Fish::where('fish_name', 'LIKE', '%'.$value.'%')->first();
                    if(!$fish){
                        $message = "There's no fish with that name!";
                        break;
                    }

                    $message = $fish->fish_name.": ".$fish->fish_description;
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

                    $message = $bait->bait_name.": ".$bait->bait_description;
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

                    $message = $rod->rod_name.": ".$rod->rod_description;
                    break;
                }
                $message = "desc rod={rod_name}: Check the desciption of that rod.";

                break;
            case 'location':
                if($value){
                    $location = Location::where('location_name', 'LIKE', '%'.$value.'%')->first();
                    if(!$location){
                        $message = "There's no location with that name!";
                        break;
                    }

                    $message = $location->location_name.": ".$location->location_description;
                    break;
                }
                $message = "desc location={location_name}: Check the desciption of that location.";

                break;
            case 'mutation':
                if($value){
                    $mutation = Mutation::where('mutation_name', 'LIKE', '%'.$value.'%')->first();
                    if(!$mutation){
                        $message = "There's no mutation with that name!";
                        break;
                    }

                    $message = $mutation->mutation_name.": ".$mutation->mutation_description;
                    break;
                }
                $message = "desc mutation={mutation_name}: Check the desciption of that mutation.";

                break;
            case 'city':
                if($value){
                    $city = City::where('city_name', 'LIKE', '%'.$value.'%')->first();
                    if(!$city){
                        $message = "There's no city with that name!";
                        break;
                    }

                    $message = $city->city_name.": ".$city->city_description;
                    break;
                }
                $message = "desc city={city_name}: Check the desciption of that city.";

                break;
            default:
                $message = "desc {type}={item}: Check the desciption of that item";
                break;
        }

        return ["status" => "success", "message" => $message];
    }

    public function itemList($param, $page = 1){
        $message = "";
        $fields  = explode("=", $param);
        $val     = count($fields) <= 1 ? "": $this->combineString($fields[1]);
        $offset  = ($page - 1) * $this->limit;

        switch ($fields[0]) {
            case 'fish':
                if($val){
                    $total  = Fish::join('t_fish_bait as fb', 'fb.fish_id', '=', 't_fish.fish_id')
                                ->join('t_bait as b', 'b.bait_id', '=', 'fb.bait_id')
                                ->select(
                                    'b.bait_name',
                                    't_fish.fish_name',
                                )
                                ->where('t_fish.fish_name', 'LIKE', '%'.$val.'%')->get()->count();
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

                    $message .= $fish[0]->fish_name." [".($page ?? 1)."/".ceil($total / $this->limit)."] : ";

                    $message .= $fish->pluck('bait_name')->implode(" | ");
                }else{
                    $total   = Fish::get()->count();
                    $fish    = Fish::offset($offset)->limit($this->limit)->get();
                    if($fish->isEmpty()){
                        return ["status" => "error", "message" => "There's nothing on page {$page}"];
                    }

                    $message = "Fish [".($page ?? 1)."/".ceil($total / $this->limit)."] : ";

                    $message .= $fish->pluck('fish_name')->implode(" | ");
                }

                break;
            case 'bait':
                if($val){
                    $total  = Bait::join('t_fish_bait as fb', 'fb.bait_id', '=', 't_bait.bait_id')
                                ->join('t_fish as f', 'f.fish_id', '=', 'fb.fish_id')
                                ->select(
                                    'f.fish_name',
                                    't_bait.bait_name',
                                )
                                ->where('t_bait.bait_name', 'LIKE', '%'.$val.'%')->get()->count();
                    $sql    = Bait::join('t_fish_bait as fb', 'fb.bait_id', '=', 't_bait.bait_id')
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

                    $message .= $bait[0]->bait_name." [".($page ?? 1)."/".ceil($total / $this->limit)."] : ";

                    $message .= $bait->pluck('fish_name')->implode(" | ");
                }else{
                    $total = Bait::get()->count();
                    $bait  = Bait::offset($offset)->limit($this->limit)->get();
                    if($bait->isEmpty()){
                        return ["status" => "error", "message" => "There's nothing on page {$page}"];
                    }
                    $message = "Bait [".($page ?? 1)."/".ceil($total / $this->limit)."] : ";

                    $message .= $bait->pluck('bait_name')->implode(" | ");
                }

                break;
            case 'rod':
                if($val){
                    $total  = Rod::join('t_fish_rod as fr', 'fr.rod_id', '=', 't_rod.rod_id')
                                ->join('t_fish as f', 'f.fish_id', '=', 'fr.fish_id')
                                ->select(
                                    'f.fish_name',
                                    't_rod.rod_name',
                                )
                                ->where('t_rod.rod_name', 'LIKE', '%'.$val.'%')->get()->count();
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
                    $message .= $rod[0]->rod_name." [".($page ?? 1)."/".ceil($total / $this->limit)."] : ";

                    $message .= $rod->pluck('fish_name')->implode(" | ");
                }else{
                    $total = Rod::get()->count();
                    $rod = Rod::offset($offset)->limit($this->limit)->get();
                    if($rod->isEmpty()){
                        return ["status" => "error", "message" => "There's nothing on page {$page}"];
                    }
                    $message = "Rod [".($page ?? 1)."/".ceil($total / $this->limit)."] : ";

                    $message .= $rod->pluck('rod_name')->implode(" | ");
                }

                break;
            case 'location':
                if($val){
                    $total  = Location::join('t_fish_location as fl', 'fl.location_id', '=', 't_location.location_id')
                                    ->join('t_fish as f', 'f.fish_id', '=', 'fl.fish_id')
                                    ->select(
                                        't_location.location_name',
                                        'f.fish_name',
                                    )
                                    ->where('t_location.location_name', 'LIKE', '%'.$val.'%')->get()->count();
                    $sql    = Location::join('t_fish_location as fl', 'fl.location_id', '=', 't_location.location_id')
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
                    $message .= $location[0]->location_name." [".($page ?? 1)."/".ceil($total / $this->limit)."] : ";

                    $message .= $location->pluck('fish_name')->implode(" | ");
                }else{
                    $total    = Location::get()->count();
                    $location = Location::offset($offset)->limit($this->limit)->get();
                    if($location->isEmpty()){
                        return ["status" => "error", "message" => "There's nothing on page {$page}"];
                    }
                    $message = "Location [".($page ?? 1)."/".ceil($total / $this->limit)."] : ";

                    $message .= $location->pluck('location_name')->implode(" | ");
                }

                break;
            case 'mutation':
                if($val){
                    $sql    = Mutation::join('t_fish as f', 'f.fish_id', '=', 't_mutation.fish_id')
                                    ->select(
                                        't_mutation.mutation_name',
                                        'f.fish_name',
                                    )
                                    ->where('t_mutation.mutation_name', 'LIKE', '%'.$val.'%');
                    if($sql->count() == 0){
                        return ["status" => "error", "message" => "There's no mutation by that name!"];
                    }

                    $mutation = $sql->first();

                    $message .= $mutation->mutation_name." mutated from ".$mutation->fish_name;
                }else{
                    $total    = Mutation::get()->count();
                    $mutation = Mutation::offset($offset)->limit($this->limit)->get();
                    if($mutation->isEmpty()){
                        return ["status" => "error", "message" => "There's nothing on page {$page}"];
                    }
                    $message = "Mutation [".($page ?? 1)."/".ceil($total / $this->limit)."] : ";

                    $message .= $mutation->pluck('mutation_name')->implode(" | ");
                }

                break;
            case 'season':
                if($val){
                    $total  = Season::join('t_fish_season as fs', 'fs.season_id', '=', 't_season.season_id')
                                    ->join('t_fish as f', 'f.fish_id', '=', 'fs.fish_id')
                                    ->select(
                                        't_season.season_name',
                                        'f.fish_name',
                                    )
                                    ->where('t_season.season_name', 'LIKE', '%'.$val.'%')->get()->count();
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
                    $message .= $season[0]->season_name." [".($page ?? 1)."/".ceil($total / $this->limit)."] : ";

                    $message .= $season->pluck('fish_name')->implode(" | ");
                }else{
                    $total = Season::get()->count();
                    $season = Season::offset($offset)->limit($this->limit)->get();
                    if($season->isEmpty()){
                        return ["status" => "error", "message" => "There's nothing on page {$page}"];
                    }
                    $message = "Season [".($page ?? 1)."/".ceil($total / $this->limit)."] : ";

                    $message .= $season->pluck('season_name')->implode(" | ");
                }

                break;
            case 'weather':
                if($val){
                    $total  = Weather::join('t_fish_weather as fw', 'fw.weather_id', '=', 't_weather.weather_id')
                                    ->join('t_fish as f', 'f.fish_id', '=', 'fw.fish_id')
                                    ->select(
                                        't_weather.weather_name',
                                        'f.fish_name',
                                    )
                                    ->where('t_weather.weather_name', 'LIKE', '%'.$val.'%')->get()->count();
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
                    $message .= $weather[0]->weather_name." [".($page ?? 1)."/".ceil($total / $this->limit)."] : ";

                    $message .= $weather->pluck('fish_name')->implode(" | ");
                }else{
                    $total = Weather::get()->count();
                    $weather = Weather::offset($offset)->limit($this->limit)->get();
                    if($weather->isEmpty()){
                        return ["status" => "error", "message" => "There's nothing on page {$page}"];
                    }
                    $message = "Weather [".($page ?? 1)."/".ceil($total / $this->limit)."] : ";

                    $message .= $weather->pluck('weather_name')->implode(" | ");
                }

                break;
            default:
                $message = "list {type}: Check all the list of that item";
                break;
        }

        return ["status" => "success", "message" => $message];
    }

    public function userRecord($twitchId, $page){
        $limit   = 2;
        $offset  = ($page - 1) * $limit;
        $sql     = CatchLogs::leftJoin('t_fish as f', 'f.fish_id', '=', 't_catch_log.fish_id')
                            ->leftJoin('t_mutation as m', 'm.mutation_id', '=', 't_catch_log.fish_id')
                            ->select(
                                DB::raw('
                                    CASE
                                        WHEN t_catch_log.is_teras = 1 THEN m.mutation_id
                                        ELSE f.fish_id
                                    END as fish_id
                                '),
                                DB::raw('
                                    CASE
                                        WHEN t_catch_log.is_teras = 1 THEN m.mutation_name
                                        ELSE f.fish_name
                                    END as fish_name
                                '),
                                DB::raw('MIN(t_catch_log.fish_weight) as lightest'),
                                DB::raw('MAX(t_catch_log.fish_weight) as heaviest'),
                                DB::raw('MIN(t_catch_log.fish_length) as shortest'),
                                DB::raw('MAX(t_catch_log.fish_length) as longest'),
                            )
                            ->where('t_catch_log.user_id', '=', $twitchId);

        $catch_count = $sql->count();
        if($catch_count == 0){
            return ['status' => 'error', 'message' => "You don't have any record."];
        }

        $logs = $sql->groupBy('t_catch_log.fish_id', 'f.fish_name', 't_catch_log.is_teras', 'm.mutation_id', 'f.fish_id', 'm.mutation_name')
                      ->offset($offset)
                      ->limit($limit)
                      ->get();

        if($logs->isEmpty()){
            return ['status' => 'error', 'message' => "There's nothing on page {$page}"];
        }

        $message = "[".($page ?? 1)."/".ceil($catch_count / $limit)."]: ";
        foreach ($logs as $value) {
            $message .= $value->fish_name." [Biggest: {$value->heaviest} kg | Longest: {$value->longest} cm] ";
        }

        return ['status' => 'success', 'message' => $message];
    }

    public function finishCatch($twitchId, $username, $catch){
        $equipped    = $catch['equipped'];

        $catchWeight = round($this->randomFloat($catch['fish']['fish_min_weight'], $catch['fish']['fish_max_weight']), 2);
        $ratio       = ($catchWeight - $catch['fish']['fish_min_weight']) / ($catch['fish']['fish_max_weight'] - $catch['fish']['fish_min_weight']) ?? 0.1;
        $catchLength = round($catch['fish']['fish_min_length'] + ($ratio * ($catch['fish']['fish_max_length'] - $catch['fish']['fish_min_length'])), 2);
        $inventory   = Inventory::where('item_id', $catch['fish']['fish_id'])->where('item_type', '=', 'FISH')->where('user_id', '=', $twitchId)->first();
        $item_amount = $inventory ? $inventory->item_amount ?? 0 : 0;

        CatchLogs::create([
            'user_id'       => $twitchId,
            'fish_id'       => $catch['fish']['fish_id'],
            'fish_weight'   => $catchWeight,
            'fish_length'   => $catchLength,
            'bait_id'       => $equipped['user_bait'],
            'rod_id'        => $equipped['user_rod'],
            'location_id'   => $this->location,
            'season_id'     => $this->season,
            'weather_id'    => $this->weather,
            'is_teras'      => $catch['fish']['is_teras'],
        ]);

        Inventory::updateOrCreate([
            'user_id'       => $twitchId,
            'item_id'       => $catch['fish']['fish_id'],
            'item_type'     => $catch['fish']['is_teras'] ? "TERAS": "FISH",
        ], [
            'item_amount'   => $item_amount + 1,
        ]);

        $message = " caught a " . $catch['fish']['fish_name'] . "! Weighing {$catchWeight} kg and {$catchLength} cm long!";
        if($catch['fish']['is_teras']){
            $message = " caught a mutated ".$catch['fish']['mutated_from']." named {$catch['fish']['fish_name']}! Weighing {$catchWeight} kg and {$catchLength} cm long!";
        }
        return ["status" => "success", "message" => $message, "overlays" => $this->recordLog()];
    }

    public function phase2($twitchId, $catch){
        $equipped       = $catch['equipped'];
        $fish           = $catch['fish'];

        $fishBite       = FishBait::where('bait_id', '=', $equipped['user_bait'])->where('fish_id', '=', $fish['fish_id'])->pluck('bait_bite', 'fish_id');
        $bite           = $fish['base_bite'] + ($fishBite[$fish['fish_id']] ?? 0);

        $bait           = Inventory::where('item_type', '=', 'BAIT')->where('item_id', '=', $equipped['user_bait'])->where('user_id', '=', $twitchId)->first();
        $bait_amount    = !$bait ? 0: $bait->item_amount;

        $isBiting  = mt_rand(1, 100) <= $bite;
        if(!$isBiting){
            return ["status" => "error", "message" => "The {$fish['fish_name']} is not biting."];
        }

        $bait->update([
            'item_amount'  => $bait_amount - 1,
            'updated_date' => now()
        ]);

        return ["status" => "success", "message" => "The {$fish['fish_name']} is biting!", "fish" => $catch];
    }

    public function phase3($twitchId, $catch){
        $equipped   = $catch['equipped'];
        $fish       = $catch['fish'];

        $fishEscape = FishRod::where('rod_id', '=', $equipped['user_rod'])->where('fish_id', '=', $fish['fish_id'])->pluck('rod_escape', 'fish_id');
        $escape     = $fish['base_escape'] - ($fishEscape[$fish['fish_id']] ?? 0);

        $isEscape   = mt_rand(1, 100) <= $escape;
        if(!$isEscape){
            return ["status" => "error", "message" => "The {$fish['fish_name']} is escape."];
        }

        $user = User::where('twitch_user_id', $twitchId)->first();

        return $this->finishCatch($twitchId, $user->username, $catch);
    }

    public function firstTimer(int $twitchId, string $username, string $display_name){
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

    private function getFish($twitchId, $fishList){
        $equipped       = User::where('twitch_user_id', '=', $twitchId)->first();

        $fishBait       = FishBait::where('bait_id', '=', $equipped->user_bait)->pluck('bait_modifier', 'fish_id');
        $fishRod        = FishRod::where('rod_id', '=', $equipped->user_rod) ->pluck('rod_modifier', 'fish_id');
        $fishLocation   = FishLocation::where('location_id', '=', $this->location) ->pluck('location_modifier', 'fish_id');
        $fishMutation   = FishLocation::where('location_id', '=', $this->location) ->pluck('location_mutation', 'fish_id');
        $fishSeason     = FishSeason::where('season_id', '=', $this->season) ->pluck('season_modifier', 'fish_id');
        $fishWeather    = FishWeather::where('weather_id', '=', $this->weather) ->pluck('weather_modifier', 'fish_id');
        $fishWutation   = FishWeather::where('weather_id', '=', $this->weather) ->pluck('weather_mutation', 'fish_id');

        $current        = 0;
        $maxWeight      = 0;

        $mutations      = [];
        $weights        = [];

        foreach ($fishList as $fish) {
            $weight     = $fish->fish_base_weight + ($fishBait[$fish->fish_id] ?? 0) + ($fishRod[$fish->fish_id] ?? 0) + ($fishLocation[$fish->fish_id] ?? 0) + ($fishSeason[$fish->fish_id] ?? 0) + ($fishWeather[$fish->fish_id] ?? 0);
            $mutation   = $fish->base_mutation + ($fishMutation[$fish->fish_id] ?? 0) + ($fishWutation[$fish->fish_id] ?? 0);

            $mutations[$fish->fish_id]  = $mutation;
            $weights[$fish->fish_id]    = $weight;

            $maxWeight += $weight;
        }

        $roll = rand(1, $maxWeight);

        foreach($fishList as $fish){
            $current += $weights[$fish->fish_id];

            if($roll <= $current){
                $isMutated = mt_rand(1, 100) <= $mutations[$fish->fish_id];
                if($isMutated){
                    return ["status" => "success","fish" => $this->mutationFish($fish->fish_id)];
                }

                $fish['is_teras'] = false;
                return ["status" => "success","fish" => $fish];
            }
        }

        return ["status" => "error", "message" => "There's no catch today."];
    }

    private function getState(){
        $sql = GameState::join('t_location as l', 'l.location_id', '=', 't_game_state.current_location')
                        ->join('t_season as s', 's.season_id', '=', 't_game_state.current_season')
                        ->join('t_weather as w', 'w.weather_id', '=', 't_game_state.current_weather')
                        ->select(
                            'l.location_id as current_location',
                            'l.location_name',
                            's.season_id as current_season',
                            's.season_name',
                            'w.weather_id as current_weather',
                            'w.weather_name',
                        );

        return $sql;
    }

    private function combineString($string){
        return implode(" ", explode("_", $string));
    }

    private function randomFloat($min, $max, $decimals = 2) {
        $scale = pow(10, $decimals);
        return mt_rand($min * $scale, $max * $scale) / $scale;
    }

    private function getSql(){
        $sql = Fish::join('t_fish_location as fl', 'fl.fish_id', '=', 't_fish.fish_id')
                    ->join('t_location as l', 'fl.location_id', '=', 'l.location_id')
                    ->join('t_fish_type as ft', 'ft.fish_type_id', '=', 't_fish.fish_type')
                    ->join('t_fish_rarity as fr', 'fr.fish_rarity_id', '=', 't_fish.fish_rarity')
                    ->select(
                        'l.location_name',
                        't_fish.fish_id',
                        DB::raw('CONCAT(t_fish.fish_name, " (", fr.fish_rarity, ")") as fish_name'),
                        't_fish.fish_type',
                        't_fish.fish_rarity',
                        't_fish.fish_base_weight',
                        't_fish.fish_min_weight',
                        't_fish.fish_max_weight',
                        't_fish.fish_min_length',
                        't_fish.fish_max_length',
                        't_fish.fish_description',
                        'fl.location_modifier',
                        'ft.fish_type',
                        'fr.fish_rarity_id',
                        'fr.fish_rarity',
                        'fr.fish_initial',
                        'fr.base_bite',
                        'fr.base_escape',
                        'fr.base_mutation',
                    )
                    ->where('fl.location_id', $this->location);

        return $sql;
    }

    private function mutationFish(int $fish_id){
        $mutations = Mutation::join('t_fish as f', 'f.fish_id', '=', 't_mutation.fish_id')
                            ->join('t_fish_rarity as fr', 'fr.fish_rarity_id', '=', 'f.fish_rarity')
                            ->select(
                                'mutation_id as fish_id',
                                DB::raw('CONCAT(f.fish_name, " (", fr.fish_rarity, ")") as mutated_from'),
                                'fr.base_bite',
                                'fr.base_escape',
                                'f.fish_rarity as fish_rarity_id',
                                'mutation_name as fish_name',
                                'mutation_description as fish_description',
                                'mutation_min_weight as fish_min_weight',
                                'mutation_max_weight as fish_max_weight',
                                'mutation_min_length as fish_min_length',
                                'mutation_max_length as fish_max_length',
                                'mutation_chance',
                            )->where('t_mutation.fish_id', $fish_id)->get();

        $totalChance = $mutations->sum('mutation_chance');

        $roll = mt_rand(1, $totalChance * 100); // 100 = 2 decimal places

        $current = 0;
        $selectedMutation = null;

        foreach ($mutations as $mutation) {
            $current += $mutation->mutation_chance * 100;

            if ($roll <= $current) {
                $selectedMutation = $mutation;
                $selectedMutation['is_teras'] = true;
                break;
            }
        }

        return $selectedMutation;
    }

    private function recordLog(){
        $heaviest = $this->getRecord()->orderBy('fish_weight', 'DESC')->first() ?? [];
        $lightest = $this->getRecord()->orderBy('fish_weight', 'ASC')->first() ?? [];
        $longest  = $this->getRecord()->orderBy('fish_length', 'DESC')->first() ?? [];
        $shortest = $this->getRecord()->orderBy('fish_length', 'ASC')->first() ?? [];

        return [
            "heaviest" => $heaviest,
            "lightest" => $lightest,
            "shortest" => $shortest,
            "longest"  => $longest,
        ];
    }

    private function getRecord(){
        $sql = CatchLogs::join('t_user as u', 'u.twitch_user_id', '=', 't_catch_log.user_id')
                        ->leftJoin('t_fish as f', 'f.fish_id', '=', 't_catch_log.fish_id')
                        ->leftJoin('t_mutation as m', 'm.mutation_id', '=', 't_catch_log.fish_id')
                        ->select(
                            'u.display_name',
                            DB::raw('
                                CASE
                                    WHEN t_catch_log.is_teras = 1 THEN m.mutation_name
                                    ELSE f.fish_name
                                END as fish_name
                            '),
                            't_catch_log.fish_weight',
                            't_catch_log.fish_length',
                        )->whereDate('t_catch_log.created_date', today());

        return $sql;
    }
}
