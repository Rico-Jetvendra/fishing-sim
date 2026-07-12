<?php

namespace App\Http\Controllers\WEB;

use App\Http\Controllers\Controller;
use App\Models\CatchLogs;

use Illuminate\Support\Facades\{
    DB,
};

use Yajra\DataTables\Facades\DataTables;

class CatchLogsController extends Controller{
    public function index(){
        $data = $this->getData()->get();

        $columns = [
            ['label' => 'Username', 'field' => 'username'],
            ['label' => 'Fish', 'field' => 'fish_name'],
            ['label' => 'Weight', 'field' => 'fish_weight'],
            ['label' => 'Length', 'field' => 'fish_length'],
            ['label' => 'Type', 'field' => 'teras'],
        ];

        return view('pages.catch_logs.index', compact('data', 'columns'));
    }

    public function data(){
        $query = $this->getData();

        return DataTables::of($query)
            ->addIndexColumn()
            ->addColumn('username', function($row){
                $href = "<a href='#' onclick='openDetail({$row}); return false;'>{$row->username}</a>";
                return $href;
            })
            ->addColumn('fish_weight', function($row){
                return $row->fish_weight.' kg';
            })
            ->addColumn('fish_length', function($row){
                return $row->fish_length.' cm';
            })
            ->filterColumn('fish_name', function($query, $keyword) {
                 $query->where(function ($q) use ($keyword) {
                    $q->where('f.fish_name', 'LIKE', "%{$keyword}%")
                    ->orWhere('m.mutation_name', 'LIKE', "%{$keyword}%");
                });
            })
            ->filterColumn('teras', function($query, $keyword) {
                if (stripos('mutation', $keyword) !== false) {
                    $query->where('t_catch_log.is_teras', 1);
                }

                if (stripos('normal', $keyword) !== false) {
                    $query->where('t_catch_log.is_teras', 0);
                }
            })
            ->rawColumns(['username'])
            ->make(true);
    }

    private function getData(){
        $sql = CatchLogs::join('t_user as u', 'u.twitch_user_id', '=', 't_catch_log.user_id')
                        ->join('t_rod as r', 'r.rod_id', '=', 't_catch_log.rod_id')
                        ->join('t_location as l', 'l.location_id', '=', 't_catch_log.location_id')
                        ->join('t_season as s', 's.season_id', '=', 't_catch_log.season_id')
                        ->join('t_weather as w', 'w.weather_id', '=', 't_catch_log.weather_id')
                        ->leftJoin('t_fish as f', 'f.fish_id', '=', 't_catch_log.fish_id')
                        ->leftJoin('t_mutation as m', 'm.mutation_id', '=', 't_catch_log.fish_id')
                        ->select(
                            'u.username',
                            DB::raw('
                                CASE
                                    WHEN t_catch_log.is_teras = 1 THEN m.mutation_name
                                    ELSE f.fish_name
                                END as fish_name
                            '),
                            't_catch_log.fish_weight',
                            't_catch_log.fish_length',
                            'r.rod_name',
                            'l.location_name',
                            's.season_name',
                            'w.weather_name',
                            't_catch_log.created_date',
                            DB::raw('
                                CASE
                                    WHEN t_catch_log.is_teras = 1 THEN (SELECT fish_rarity FROM t_fish_rarity WHERE fish_rarity_id = (SELECT fish_rarity FROM t_fish WHERE t_fish.fish_id = m.fish_id))
                                    ELSE (SELECT fish_rarity FROM t_fish_rarity WHERE fish_rarity_id = f.fish_rarity)
                                END as fish_rarity
                            '),
                            DB::raw(
                                'CASE
                                    WHEN t_catch_log.is_teras = 1 THEN "Mutation"
                                    ELSE "Normal"
                                END as teras'
                            ),
                        );

        return $sql;
    }
}
