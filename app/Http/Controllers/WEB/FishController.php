<?php

namespace App\Http\Controllers\WEB;

use Exception;

use App\Http\Controllers\Controller;
use App\Models\Fish;
use App\Models\FishRarity;
use App\Models\FishType;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\{
    DB,
    Log,
    Validator
};

use Yajra\DataTables\Facades\DataTables;

class FishController extends Controller{
    public function index(){
        $data = $this->getData()->get();

        $columns = [
            ['label' => 'Name', 'field' => 'fish_name'],
            ['label' => 'Type', 'field' => 'fish_type_name'],
            ['label' => 'Rarity', 'field' => 'fish_rarity_name'],
            ['label' => 'Ticket', 'field' => 'fish_base_weight'],
        ];

        $selects = $this->getSelects();

        return view('pages.fish.index', compact('data', 'columns', 'selects'));
    }

    public function data(){
        $query = $this->getData();

        return DataTables::of($query)
            ->addIndexColumn()
            ->addColumn('action', function ($row) {
                $buttons = '';

                $buttons .= '
                <button class="btn btn-sm btn-warning btn-edit text-white" data-id="'.$row->fish_id.'">
                    <i class="bi bi-pencil"></i>
                </button>';

                $buttons .= '
                <button class="btn btn-sm btn-danger btn-delete" data-id="'.$row->fish_id.'" data-name="'.$row->fish_name.'">
                    <i class="bi bi-trash"></i>
                </button>';

                return $buttons;
            })
            ->filterColumn('fish_type_name', function($query, $keyword) {
                $query->where('ft.fish_type', 'like', "%$keyword%");
            })
            ->filterColumn('fish_rarity_name', function($query, $keyword) {
                $query->where('fr.fish_rarity', 'like', "%$keyword%");
            })
            ->rawColumns(['action'])
            ->make(true);
    }

    public function edit($id){
        $data = $this->getData()->find($id);
        if(!$data){
            return redirect()->back()->with('error', 'No record.');
        }

        return response()->json($data);
    }

    public function store(Request $request){
        $validator = Validator::make($request->all(), [
            'fish_name'         => 'required|string',
            'fish_type'         => 'required|numeric',
            'fish_rarity'       => 'required|numeric',
            'fish_base_weight'  => 'required|numeric',
            'fish_min_weight'   => 'required|numeric|decimal:0,2',
            'fish_max_weight'   => 'required|numeric|decimal:0,2',
            'fish_min_length'   => 'required|numeric|decimal:0,2',
            'fish_max_length'   => 'required|numeric|decimal:0,2',
            'fish_description'  => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $validated = $validator->validated();

        try{
            Fish::create($validated);

            return redirect()->route('web.fish.index')->with('success', 'Successfully add record.');
        }catch(Exception $e){
            Log::error($e->getMessage());
            return redirect()->back()->with('error', 'Failed to create record: ' . $e->getMessage());
        }
    }

    public function update(Request $request, $id){
        $data = Fish::find($id);
        if(!$data){
            return redirect()->back()->with('error', 'No record.');
        }

        $validator = Validator::make($request->all(), [
            'fish_name'         => 'required|string',
            'fish_type'         => 'required|numeric',
            'fish_rarity'       => 'required|numeric',
            'fish_base_weight'  => 'required|numeric',
            'fish_min_weight'   => 'required|numeric|decimal:0,2',
            'fish_max_weight'   => 'required|numeric|decimal:0,2',
            'fish_min_length'   => 'required|numeric|decimal:0,2',
            'fish_max_length'   => 'required|numeric|decimal:0,2',
            'fish_description'  => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $validated = $validator->validated();

        try{
            $data->update($validated);

            return redirect()->route('web.fish.index')->with('success', 'Successfully update record.');
        }catch(Exception $e){
            Log::error($e->getMessage());
            return redirect()->back()->with('error', 'Failed to create record: ' . $e->getMessage());
        }
    }

    public function destroy($id){
        $data = Fish::find($id);
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
        $sql = Fish::join('t_fish_type as ft', 'ft.fish_type_id', '=', 't_fish.fish_type')
                    ->join('t_fish_rarity as fr', 'fr.fish_rarity_id', '=', 't_fish.fish_rarity')
                    ->select(
                        't_fish.*',
                        'ft.fish_type as fish_type_name',
                        'fr.fish_rarity as fish_rarity_name'
                    );

        return $sql;
    }

    private function getSelects(){
        $rarity = FishRarity::select(
                            't_fish_rarity.fish_rarity_id as fish_rarity',
                            't_fish_rarity.fish_rarity as fish_rarity_name'
                        )->get();
        $type   = FishType::select(
                            't_fish_type.fish_type_id as fish_type',
                            DB::raw('
                                CASE
                                    WHEN t_fish_type.water_type = 1 THEN CONCAT_WS(" ", "Freshwater - ", t_fish_type.fish_type)
                                    WHEN t_fish_type.water_type = 2 THEN CONCAT_WS(" ", "Brackish - ", t_fish_type.fish_type)
                                    WHEN t_fish_type.water_type = 3 THEN CONCAT_WS(" ", "Seawater - ", t_fish_type.fish_type)
                                END as fish_type_name
                            '),
                        )->get();

        return [
            "type"      => $type,
            "rarity"    => $rarity,
        ];
    }
}
