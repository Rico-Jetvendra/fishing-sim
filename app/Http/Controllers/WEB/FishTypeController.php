<?php

namespace App\Http\Controllers\WEB;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\FishType;
use Exception;

use Illuminate\Support\Facades\{
    DB,
    Log,
    Validator
};

use Yajra\DataTables\Facades\DataTables;

class FishTypeController extends Controller{
    public function index(){
        $data = $this->getData()->get();

        $columns = [
            ['label' => 'Fish Type', 'field' => 'fish_type'],
            ['label' => 'Water', 'field' => 'water_type_name'],
        ];

        $selects = $this->getSelects();

        return view('pages.fish_type.index', compact('data', 'columns', 'selects'));
    }

    public function data(){
        $query = $this->getData();

        return DataTables::of($query)
            ->addIndexColumn()
            ->addColumn('action', function ($row) {
                $buttons = '';

                $buttons .= '
                <button class="btn btn-sm btn-warning btn-edit text-white" data-id="'.$row->fish_type_id.'">
                    <i class="bi bi-pencil"></i>
                </button>';

                $buttons .= '
                <button class="btn btn-sm btn-danger btn-delete" data-id="'.$row->fish_type_id.'" data-name="'.$row->fish_type.'">
                    <i class="bi bi-trash"></i>
                </button>';

                return $buttons;
            })
            ->filterColumn('water_type_name', function($query, $keyword) {
                $keyword = strtolower($keyword);
                switch($keyword){
                    case 'freshwater':
                        $query->where('water_type', '=', 1);
                        break;
                    case 'brackish':
                        $query->where('water_type', '=', 2);
                        break;
                    case 'seawater':
                        $query->where('water_type', '=', 3);
                        break;
                }
            })
            ->rawColumns(['action'])
            ->make(true);
    }

    public function edit($id){
        $data = FishType::find($id);
        if(!$data){
            return redirect()->back()->with('error', 'No record.');
        }

        return response()->json($data);
    }

    public function store(Request $request){
        $validator = Validator::make($request->all(), [
            'fish_type'    => 'required|string',
            'water_type'   => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $validated = $validator->validated();

        try{
            FishType::create($validated);

            return redirect()->route('web.fishType.index')->with('success', 'Successfully add record.');
        }catch(Exception $e){
            Log::error($e->getMessage());
            return redirect()->back()->with('error', 'Failed to create record: ' . $e->getMessage());
        }
    }

    public function update(Request $request, $id){
        $data = FishType::find($id);
        if(!$data){
            return redirect()->back()->with('error', 'No record.');
        }

        $validator = Validator::make($request->all(), [
            'fish_type'    => 'required|string',
            'water_type'   => 'required|numeric',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $validated = $validator->validated();

        try{
            $data->update($validated);

            return redirect()->route('web.fishType.index')->with('success', 'Successfully update record.');
        }catch(Exception $e){
            Log::error($e->getMessage());
            return redirect()->back()->with('error', 'Failed to create record: ' . $e->getMessage());
        }
    }

    public function destroy($id){
        $data = FishType::find($id);
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

    private function getSelects(){
        $water_type = config('combobox.water');

        return [
            "water_type" => $water_type
        ];
    }

    private function getData(){
        $sql = FishType::select(
                        't_fish_type.*',
                        DB::raw(
                            'CASE
                                WHEN t_fish_type.water_type = 1 THEN "Freshwater"
                                WHEN t_fish_type.water_type = 2 THEN "Brackish"
                                WHEN t_fish_type.water_type = 3 THEN "Seawater"
                            END AS water_type_name'
                        ),
                    );

        return $sql;
    }
}
