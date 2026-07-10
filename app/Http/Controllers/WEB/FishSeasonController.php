<?php

namespace App\Http\Controllers\WEB;

use Exception;
use App\Http\Controllers\Controller;
use App\Models\Season;
use App\Models\Fish;
use App\Models\FishSeason;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\{
    DB,
    Log,
    Validator
};

use Yajra\DataTables\Facades\DataTables;

class FishSeasonController extends Controller{
    public function index(){
        $data = $this->getData()->get();

        $columns = [
            ['label' => 'Fish', 'field' => 'fish_name'],
        ];

        $selects = $this->getSelects();

        return view('pages.fish_season.index', compact('data', 'columns', 'selects'));
    }

    public function data(){
        $query = $this->getData();

        return DataTables::of($query)
            ->addIndexColumn()
            ->addColumn('action', function ($row) {
                $buttons = '';

                $buttons .= '
                <button class="btn btn-sm btn-warning btn-edit-relation text-white" data-id="'.$row->fish_id.'">
                    <i class="bi bi-pencil"></i>
                </button>';

                $buttons .= '
                <button class="btn btn-sm btn-danger btn-delete-relation" data-id="'.$row->fish_id.'" data-name="'.$row->fish_name.'">
                    <i class="bi bi-trash"></i>
                </button>';

                return $buttons;
            })
            ->filterColumn('fish_name', function($query, $keyword) {
                $query->where('f.fish_name', 'LIKE', '%'.$keyword.'%' );
            })
            ->rawColumns(['action'])
            ->make(true);
    }

    public function edit($id){
        $data = FishSeason::join('t_fish as f', 'f.fish_id', '=', 't_fish_season.fish_id')
                        ->join('t_season as l', 'l.season_id', '=', 't_fish_season.season_id')
                        ->select(
                            't_fish_season.*',
                            'f.fish_name',
                            'l.season_name',
                        )->where('t_fish_season.fish_id', $id)->get();
        if(!$data){
            return redirect()->back()->with('error', 'No record.');
        }

        return response()->json($data);
    }

    public function store(Request $request){
        $validator = Validator::make($request->all(), [
            'fish_id'       => 'required|numeric',
            'relation'      => 'required|string',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $validated = $validator->validated();

        try{
            foreach(json_decode($validated['relation']) as $value) {
                $data = ['fish_id' => $validated['fish_id']];

                $data['season_id']        = $value->season_id->id;
                $data['season_modifier']  = $value->season_modifier;

                FishSeason::create($data);
            }

            return response()->json(['success' => true, 'messages' => "Successfully added record."]);
        }catch(Exception $e){
            Log::error($e->getMessage());
            return response()->json(['success' => false, 'messages' => 'Failed to create record: ' . $e->getMessage()]);
        }
    }

    public function update(Request $request, $id){
        $validator = Validator::make($request->all(), [
            'fish_id'       => 'required|numeric',
            'relation'      => 'required|string',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $validated = $validator->validated();

        try{
            FishSeason::where('fish_id', $id)->delete();
            foreach(json_decode($validated['relation']) as $value) {
                $res                   = ['fish_id' => $validated['fish_id']];

                $res['season_id']        = $value->season_id->id;
                $res['season_modifier']  = $value->season_modifier;

                FishSeason::create($res);
            }

            return response()->json(['success' => true, 'messages' => "Successfully updated record."]);
        }catch(Exception $e){
            Log::error($e->getMessage());
            return response()->json(['success' => false, 'messages' => 'Failed to create record: ' . $e->getMessage()]);
        }
    }

    public function destroy($id){
        $data = FishSeason::where('fish_id', $id);
        if(!$data){
            return redirect()->back()->with('error', 'No record.');
        }

        try{
            $data->delete();
        }catch(Exception $e){
            Log::error($e->getMessage());
            return redirect()->back()->with('error', 'Failed to create record: ' . $e->getMessage());
        }
    }

    private function getData(){
        $sql = FishSeason::join('t_fish as f', 'f.fish_id', '=', 't_fish_season.fish_id')
                        ->select(
                            't_fish_season.fish_id',
                            'f.fish_name',
                        )->groupBy('t_fish_season.fish_id','f.fish_name',);

        return $sql;
    }

    private function getSelects(){
        $fish   = Fish::all();
        $season = Season::all();

        return [
            "fish" => $fish,
            "season" => $season
        ];
    }
}
