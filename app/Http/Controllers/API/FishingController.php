<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Inventory;
use App\Models\User;
use Illuminate\Http\Request;
use App\Services\FishingService;

use Illuminate\Support\Facades\{
    Validator
};

class FishingController extends Controller{
    public FishingService $fishService;

    public function __construct(){
        $this->fishService = new FishingService();
    }

    public function list(Request $request){
        $validator = Validator::make($request->all(), [
            'message' => 'required|string',
            'page'    => 'nullable|numeric',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', "message" => "list {type}: Check all the list of that item", "errors" => $validator->errors()]);
        }

        $validated = $validator->validated();

        $msg = $this->fishService->itemList($validated['message'], $validated['page']);

        return response()->json($msg);
    }

    public function desc(Request $request){
        $validator = Validator::make($request->all(), [
            'message' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', "message" => "desc {type}={item}: Check the desciption of that item", "errors" => $validator->errors()]);
        }

        $validated = $validator->validated();

        $msg = $this->fishService->checkDescription($validated['message']);

        return response()->json($msg);
    }

    public function inv(Request $request){
        $validator = Validator::make($request->all(), [
            'twitchId' => 'required|numeric',
            'message' => 'required|string',
            'page' => 'nullable|numeric',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', "message" => "inv {type}: Check your inventory", "errors" => $validator->errors()]);
        }

        $validated = $validator->validated();

        $msg = $this->fishService->checkInventory($validated['twitchId'], $validated['message'], $validated['page']);

        return response()->json($msg);
    }

    public function record(Request $request){
        $validator = Validator::make($request->all(), [
            'twitchId' => 'required|numeric',
            'page' => 'nullable|numeric',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', "message" => "Twitch ID is required!", "errors" => $validator->errors()]);
        }

        $validated = $validator->validated();

        $msg = $this->fishService->userRecord($validated['twitchId'], $validated['page']);

        return response()->json($msg);
    }

    public function change(Request $request){
        $validator = Validator::make($request->all(), [
            'message' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', "message" => "change {type}: Change the game state", "errors" => $validator->errors()]);
        }

        $validated = $validator->validated();

        $msg = $this->fishService->changeState($validated['message']);

        return response()->json($msg);
    }

    public function equip(Request $request){
        $validator = Validator::make($request->all(), [
            'twitchId' => 'required|numeric',
            'message'  => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', "message" => "equip {type}={name}: Change current bait or rod", "errors" => $validator->errors()]);
        }

        $validated = $validator->validated();

        $msg = $this->fishService->equipment($validated['twitchId'], $validated['message']);

        return response()->json($msg);
    }

    public function phase1(Request $request){
        $validator = Validator::make($request->all(), [
            'twitchId'      => 'required|numeric',
            'username'      => 'nullable|string',
            'display_name'  => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', "message" => "Twitch ID is required!", "errors" => $validator->errors()]);
        }

        $validated = $validator->validated();

        $user = User::where('twitch_user_id', $validated['twitchId'])->first();
        if(!$user){
            $user = $this->fishService->firstTimer($validated['twitchId'], $validated['username'], $validated['display_name']);
        }

        if ($user->last_fish_at && $user->last_fish_at->greaterThan(now()->subMinute())) {
            return response()->json(['status' => 'error', 'message' => 'Fishing is on cooldown.']);
        }

        $user->update(['last_fish_at' => now()]);
        $msg = $this->fishService->catchFish($validated['twitchId'], $user['username'], $user['display_name']);

        return response()->json($msg);
    }

    public function phase2(Request $request){
        $validator = Validator::make($request->all(), [
            'twitchId' => 'required|numeric',
            'catch'    => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', "message" => "Twitch ID or Fish is required!", "errors" => $validator->errors()]);
        }

        $validated = $validator->validated();

        $msg = $this->fishService->phase2($validated['twitchId'], $validated['catch']);

        return response()->json($msg);
    }

    public function phase3(Request $request){
        $validator = Validator::make($request->all(), [
            'twitchId' => 'required|numeric',
            'catch'    => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', "message" => "Twitch ID or Fish is required!", "errors" => $validator->errors()]);
        }

        $validated = $validator->validated();

        $msg = $this->fishService->phase3($validated['twitchId'], $validated['catch']);

        return response()->json($msg);
    }

    public function finish(Request $request){
        $validator = Validator::make($request->all(), [
            'twitchId' => 'required|numeric',
            'catch'    => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', "message" => "Twitch ID or Fish is required!", "errors" => $validator->errors()]);
        }

        $validated = $validator->validated();

        $user = User::where('twitch_user_id', $validated['twitchId'])->first();

        $msg = $this->fishService->finishCatch($validated['twitchId'], $user['username'], $validated['catch']);

        return response()->json($msg);
    }

    public function state(){
        $msg = $this->fishService->gameState();

        return response()->json($msg);
    }

    public function reduceBaitAmount($id){
        $user = User::where('twitch_user_id', $id)->first();
        if(!$user){
            return response()->json(['status' => 'error', "message" => "User not found!"]);
        }

        $inventory = Inventory::where('user_id', $id)->where('item_id', $user->user_bait)->where('item_type', 'BAIT')->first();
        $inventory->update([
            "item_amount" => $inventory->item_amount - 1
        ]);

        return response()->json(['status' => 'success', 'message' => 'Successfully reduce thr bait amount!']);
    }
}
