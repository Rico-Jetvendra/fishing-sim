<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\FishingService;
use App\Models\{
    Bait,
    GameState,
    Inventory,
    Location,
    Rod,
    Season,
    User,
    Weather
};
use Illuminate\Support\Facades\{
    Validator
};

class EventController extends Controller{
    public int $weather;
    public int $season;
    public int $location;
    public FishingService $fishService;

    public function __construct(){
        $sql                    = $this->getState()->first();

        $this->weather          = $sql->current_weather;
        $this->season           = $sql->current_season;
        $this->location         = $sql->current_location;

        $this->fishService      = new FishingService();
    }

    public function location(Request $request){
        $location = Location::where('location_id', '!=', $this->location)->inRandomOrder()->first();
        $season   = $location->city_id == 3 ? collect([5, 6])->random() : collect([1, 2, 3, 4])->random();
        $weather  = Weather::inRandomOrder()->value('weather_id');

        GameState::first()->update([
            'current_location'  => $location->location_id,
            'current_season'    => $season,
            'current_weather'   => $weather,
        ]);

        return ['status' => 'success', 'message' => "The party traveled to {$location->location_name}."];
    }

    public function season(Request $request){
        $season  = Season::where('season_id', '!=', $this->season)->inRandomOrder()->first();
        $weather = Weather::where('weather_id', '!=', $this->weather)->inRandomOrder()->value('weather_id');

        GameState::first()->update(['current_season' => $season->season_id, 'current_weather' => $weather]);

        return ['status' => 'success', 'message' => "The season changed to {$season->weather_name}."];
    }

    public function weather(Request $request){
        $weather = Weather::where('weather_id', '!=', $this->weather)->inRandomOrder()->first();

        GameState::first()->update(['current_weather' => $weather->weather_id]);

        return ['status' => 'success', 'message' => "The weather changed to {$weather->weather_name}."];
    }

    public function subscriber(Request $request){
        $validator = Validator::make($request->all(), [
            'twitchId'      => 'required|numeric',
            'username'      => 'required|string',
            'display_name'  => 'required|string',
            'tier'          => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', "message" => "Validator error!", "errors" => $validator->errors()]);
        }

        $validated = $validator->validated();
        $user = User::where('twitch_user_id', $validated['twitchId'])->first();
        if(!$user){
            $user = $this->fishService->firstTimer($validated['twitchId'], $validated['username'], $validated['display_name']);
        }

        $bonus = $this->getBonus($validated['tier'], $user->twitch_user_id);
        $this->addBait($user->twitch_user_id, $bonus[0]);
        if(!empty($bonus[1])){
            $this->addRod($user->twitch_user_id, $bonus[1]->rod_id);
        }

        return ['status' => 'success', 'message' => "Successfully added bonus for tier {$validated['tier']}."];
    }

    public function currentState(){
        $state = $this->getState()->first();

        return ['status' => 'success', 'message' => "Successfully get current state.", 'data' => $state];
    }

    private function getBonus($tier, $user_id){
        $baitAdd        = 10;
        $multiplier     = 2;
        $bait           = Bait::all()->pluck('bait_name', 'bait_id');
        $item_amount    = [];
        foreach ($bait as $key => $value) {
            $inv    = Inventory::where('item_type', 'BAIT')->where('item_id', $key)->where('user_id', $user_id)->first();
            $amount = !$inv ? 0 : $inv->item_amount;

            $item_amount[$key] = $amount;
        }

        $ownedRodIds = Inventory::where('item_type', 'ROD')->where('user_id', $user_id)->pluck('item_id');
        switch ($tier) {
            case '1000':
                $rodRarity  = 2;
                $multiplier = 2;
                $baitAdd    = 10;
                break;
            case '2000':
                $rodRarity  = 3;
                $multiplier = 3;
                $baitAdd    = 20;
                break;
            case '3000':
                $rodRarity  = 4;
                $multiplier = 4;
                $baitAdd    = 40;
                break;
            default:
                $rodRarity  = 2;
                $multiplier = 2;
                $baitAdd    = 10;
                break;
        }

        $rod = Rod::where('rod_rarity', $rodRarity)->whereNotIn('rod_id', $ownedRodIds)->inRandomOrder()->first();
        if(!$rod){
            $baitAdd = $baitAdd * $multiplier;
            $rod = [];
        }

        $item_amount = array_map(function ($value) use ($baitAdd) {
            return $value + $baitAdd;
        }, $item_amount);

        return [$item_amount, $rod];
    }

    private function addBait($user_id, $bait){
        foreach ($bait as $key => $value) {
            Inventory::updateOrCreate([
                'user_id'   => $user_id,
                'item_id'   => $key,
                'item_type' => "BAIT",
            ], [
                'user_id'       => $user_id,
                'item_id'       => $key,
                'item_type'     => "BAIT",
                'item_amount'   => $value,
            ]);
        }
    }

    private function addRod($user_id, $rod){
        Inventory::create([
            'user_id'       => $user_id,
            'item_id'       => $rod,
            'item_type'     => "ROD",
            'item_amount'   => 1,
        ]);
    }

    private function getState(){
        $sql = GameState::join('t_location as l', 'l.location_id', '=', 't_game_state.current_location')
                        ->join('t_season as s', 's.season_id', '=', 't_game_state.current_season')
                        ->join('t_weather as w', 'w.weather_id', '=', 't_game_state.current_weather')
                        ->join('t_city as c', 'c.city_id', '=', 'l.city_id')
                        ->select(
                            'l.location_id as current_location',
                            'l.location_name',
                            's.season_id as current_season',
                            's.season_name',
                            'w.weather_id as current_weather',
                            'w.weather_name',
                            'c.city_name',
                        );

        return $sql;
    }
}
