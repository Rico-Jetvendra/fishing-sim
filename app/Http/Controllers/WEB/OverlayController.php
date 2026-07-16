<?php

namespace App\Http\Controllers\WEB;

use App\Http\Controllers\Controller;
use App\Models\CatchLogs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class OverlayController extends Controller{
    public function background(){
        $heaviest = $this->getData()->orderBy('fish_weight', 'DESC')->first() ?? [];
        $lightest = $this->getData()->orderBy('fish_weight', 'ASC')->first() ?? [];
        $longest = $this->getData()->orderBy('fish_length', 'DESC')->first() ?? [];
        $shortest  = $this->getData()->orderBy('fish_length', 'ASC')->first() ?? [];

        return view('overlays.background', compact('heaviest', 'lightest', 'shortest', 'longest'));
    }

    public function title(){
        return view('overlays.title');
    }

    public function chat(){
        $bannedWords = config('combobox.banned_words');

        return view('overlays.chat', compact('bannedWords'));
    }

    private function getData(){
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
