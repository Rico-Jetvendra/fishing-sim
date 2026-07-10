<?php

namespace App\Http\Controllers\WEB;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Rod;
use Exception;

use Illuminate\Support\Facades\{
    DB,
    Log,
    Validator
};

use Yajra\DataTables\Facades\DataTables;

class RodController extends Controller{
    public function index(){
        $data = Rod::all();

        $columns = [
            ['label' => 'Name', 'field' => 'rod_name'],
            ['label' => 'Rarity', 'field' => 'rod_rarity'],
        ];

        $selects = $this->getSelects();

        return view('pages.rod.index', compact('data', 'columns', 'selects'));
    }

    public function data(){
        $query = Rod::query();

        return DataTables::of($query)
            ->addIndexColumn()
            ->addColumn('rod_rarity', function($row){
                $rod_rarity = config('combobox.rod_rarity');

                foreach($rod_rarity as $rarity){
                    if($rarity->rod_rarity == $row->rod_rarity){
                        return $rarity->rod_rarity_name;
                    }
                }
            })
            ->addColumn('action', function ($row) {
                $buttons = '';

                $buttons .= '
                <button class="btn btn-sm btn-warning btn-edit text-white" data-id="'.$row->rod_id.'">
                    <i class="bi bi-pencil"></i>
                </button>';

                $buttons .= '
                <button class="btn btn-sm btn-danger btn-delete" data-id="'.$row->rod_id.'" data-name="'.$row->rod_name.'">
                    <i class="bi bi-trash"></i>
                </button>';

                return $buttons;
            })
            ->filterColumn('rod_rarity', function($query, $keyword) {
                $rod_rarity = config('combobox.rod_rarity');

                foreach($rod_rarity as $rarity){
                    if(stripos($rarity->rod_rarity_name, $keyword) !== false){
                        $query->orWhere('rod_rarity', $rarity->rod_rarity);
                    }
                }
            })
            ->rawColumns(['action'])
            ->make(true);
    }

    public function edit($id){
        $data = Rod::find($id);
        if(!$data){
            return redirect()->back()->with('error', 'No record.');
        }

        return response()->json($data);
    }

    public function store(Request $request){
        $validator = Validator::make($request->all(), [
            'rod_name'         => 'required|string',
            'rod_rarity'       => 'required|numeric',
            'rod_description'  => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $validated = $validator->validated();

        try{
            Rod::create($validated);

            return redirect()->route('web.rod.index')->with('success', 'Successfully add record.');
        }catch(Exception $e){
            Log::error($e->getMessage());
            return redirect()->back()->with('error', 'Failed to create record: ' . $e->getMessage());
        }
    }

    public function update(Request $request, $id){
        $data = Rod::find($id);
        if(!$data){
            return redirect()->back()->with('error', 'No record.');
        }

        $validator = Validator::make($request->all(), [
            'rod_name'         => 'required|string',
            'rod_rarity'       => 'required|numeric',
            'rod_description'  => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $validated = $validator->validated();

        try{
            $data->update($validated);

            return redirect()->route('web.rod.index')->with('success', 'Successfully update record.');
        }catch(Exception $e){
            Log::error($e->getMessage());
            return redirect()->back()->with('error', 'Failed to create record: ' . $e->getMessage());
        }
    }

    public function destroy($id){
        $data = Rod::find($id);
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
        $rod_rarity = config('combobox.rod_rarity');

        return [
            "rod_rarity" => $rod_rarity
        ];
    }
}
