<?php

namespace App\Http\Controllers\API;

use App\Models\Bait;
use App\Models\Redeem;
use App\Http\Controllers\Controller;
use App\Models\Inventory;
use App\Models\Rod;
use Illuminate\Http\Request;

class RedeemController extends Controller{
    public function index(Request $request){
        $user_id = $request->input('user_id');
        $reward  = $request->input('reward');

        $redeem  = Redeem::where('twitch_redeem_id', $reward['id'])->first();
        if(!$redeem){
            $types = explode(" ", $reward['title']);
            $type  = end($types);

            $redeem = Redeem::create([
                'twitch_redeem_id'   => $reward['id'],
                'redeem_name'        => $reward['title'],
                'redeem_type'        => strtoupper($type),
                'redeem_description' => $reward['prompt'],
                'redeem_cost'        => $reward['cost'],
            ]);
        }

        $result = $this->redeem($user_id, $redeem->redeem_type, $redeem);
        if(!$result['status']){
            return response()->json(["status" => "error", "message" => "Failed to redeem {$reward['title']}"]);
        }
        return response()->json(["status" => "success", "message" => $result['message']]);
    }

    private function redeem(int $user_id, string $type, $redeem){
        $description = explode("-", $redeem->redeem_description);
        array_shift($description);

        if($type == 'BAIT'){
            $this->redeemBait($user_id, $description);
            return ["status" => true, "message" => "Your redemption for {$redeem->redeem_name} is completed!"];
        }else{
            $status = $this->redeemRod($user_id, $description);
            if(!$status['status']){
                return ["status" => false];
            }else{
                return $status;
            }
        }
    }

    private function redeemBait(int $user_id, $description){
        foreach ($description as $value) {
            $item = Bait::where('bait_name', trim($value))->select('t_bait.bait_id as item_id')->first();
            $inv  = Inventory::where('item_type', 'BAIT')->where('item_id', $item->item_id)->where('user_id', $user_id)->first();
            if(!$inv){
                Inventory::create([
                    "user_id"       => $user_id,
                    "item_id"       => $item->item_id,
                    "item_type"     => 'BAIT',
                    "item_amount"   => 5,
                ]);
            }else{
                $inv->update([
                    "item_amount" => $inv->item_amount + 5
                ]);
            }
        }
    }

    private function redeemRod(int $user_id, $description){
        $rodNames       = array_map('trim', $description);
        $rodIds         = Rod::whereIn('rod_name', $rodNames)->pluck('rod_id');
        $ownedRodIds    = Inventory::where('user_id', $user_id)->where('item_type', 'ROD')->whereIn('item_id', $rodIds)->pluck('item_id');
        $available      = $rodIds->diff($ownedRodIds);

        if ($available->isEmpty()) {
            return ["status" => false];
        }

        $randomRodId = $available->random();

        Inventory::create([
            "user_id"       => $user_id,
            "item_id"       => $randomRodId,
            "item_type"     => 'ROD',
            "item_amount"   => 1
        ]);

        $addedRod = Rod::where('rod_id', $randomRodId)->first();

        return ["status" => true, "message" => "You got {$addedRod->rod_name}!"];
    }
}
