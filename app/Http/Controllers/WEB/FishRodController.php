<?php

namespace App\Http\Controllers\WEB;

use Exception;
use App\Http\Controllers\Controller;
use App\Models\Rod;
use App\Models\Fish;
use App\Models\FishRod;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\{
    DB,
    Log,
    Validator
};

use Yajra\DataTables\Facades\DataTables;

class FishRodController extends Controller{
    public function index(){
        $data = $this->getData()->get();

        $columns = [
            ['label' => 'Rod', 'field' => 'rod_name'],
        ];

        $selects = $this->getSelects();

        return view('pages.fish_rod.index', compact('data', 'columns', 'selects'));
    }

    public function data(){
        $query = $this->getData();

        return DataTables::of($query)
            ->addIndexColumn()
            ->addColumn('action', function ($row) {
                $buttons = '';

                $buttons .= '
                <button class="btn btn-sm btn-warning btn-edit-relation text-white" data-id="'.$row->rod_id.'">
                    <i class="bi bi-pencil"></i>
                </button>';

                $buttons .= '
                <button class="btn btn-sm btn-danger btn-delete-relation" data-id="'.$row->rod_id.'" data-name="'.$row->rod_name.'">
                    <i class="bi bi-trash"></i>
                </button>';

                return $buttons;
            })
            ->filterColumn('rod_name', function($query, $keyword) {
                $query->where('r.rod_name', 'LIKE', '%'.$keyword.'%' );
            })
            ->rawColumns(['action'])
            ->make(true);
    }

    public function edit($id){
        $data = FishRod::join('t_fish as f', 'f.fish_id', '=', 't_fish_rod.fish_id')
                        ->join('t_rod as l', 'l.rod_id', '=', 't_fish_rod.rod_id')
                        ->select(
                            't_fish_rod.*',
                            'f.fish_name',
                            'l.rod_name',
                        )->where('t_fish_rod.rod_id', $id)->get();
        if(!$data){
            return redirect()->back()->with('error', 'No record.');
        }

        return response()->json($data);
    }

    public function store(Request $request){
        $validator = Validator::make($request->all(), [
            'rod_id'   => 'required|numeric',
            'relation' => 'required|string',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $validated = $validator->validated();

        try{
            foreach(json_decode($validated['relation']) as $value) {
                $data = ['rod_id' => $validated['rod_id']];

                $data['fish_id']        = $value->fish_id->id;
                $data['rod_modifier']   = $value->rod_modifier;
                $data['rod_escape']     = $value->rod_escape;

                FishRod::create($data);
            }

            return response()->json(['success' => true, 'messages' => "Successfully added record."]);
        }catch(Exception $e){
            Log::error($e->getMessage());
            return response()->json(['success' => false, 'messages' => 'Failed to create record: ' . $e->getMessage()]);
        }
    }

    public function update(Request $request, $id){
        $validator = Validator::make($request->all(), [
            'rod_id'   => 'required|numeric',
            'relation' => 'required|string',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $validated = $validator->validated();

        try{
            FishRod::where('rod_id', $id)->delete();
            foreach(json_decode($validated['relation']) as $value) {
                $res                    = ['rod_id' => $validated['rod_id']];

                $res['fish_id']         = $value->fish_id->id;
                $res['rod_modifier']    = $value->rod_modifier;
                $res['rod_escape']      = $value->rod_escape;

                FishRod::create($res);
            }

            return response()->json(['success' => true, 'messages' => "Successfully updated record."]);
        }catch(Exception $e){
            Log::error($e->getMessage());
            return response()->json(['success' => false, 'messages' => 'Failed to create record: ' . $e->getMessage()]);
        }
    }

    public function destroy($id){
        $data = FishRod::where('rod_id', $id);
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
        $sql = FishRod::join('t_rod as r', 'r.rod_id', '=', 't_fish_rod.rod_id')
                        ->select(
                            't_fish_rod.rod_id',
                            'r.rod_name',
                        )->groupBy('t_fish_rod.rod_id','r.rod_name',);

        return $sql;
    }

    private function getSelects(){
        $fish = Fish::join('t_fish_type as ft', 't_fish.fish_type', '=', 'ft.fish_type_id')
                    ->join('t_fish_rarity as fr', 't_fish.fish_rarity', '=', 'fr.fish_rarity_id')
                    ->select(
                        't_fish.fish_id',
                        't_fish.fish_name',
                        DB::raw('
                            CASE
                                WHEN ft.water_type = 1 THEN "Freshwater"
                                WHEN ft.water_type = 2 THEN "Brackish"
                                ELSE "Seawater"
                            END as water_type
                        '),
                        'ft.fish_type as fish_type_name',
                        'fr.fish_rarity as fish_rarity_name',
                        'fr.base_bite',
                        'fr.base_escape',
                        'fr.base_mutation',
                    )->orderBy('t_fish.fish_name', 'ASC')->get();
        $rod   = Rod::all();

        return [
            "fish" => $fish,
            "rod" => $rod
        ];
    }
}
