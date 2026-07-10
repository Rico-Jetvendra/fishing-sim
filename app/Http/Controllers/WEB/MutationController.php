<?php

namespace App\Http\Controllers\WEB;

use App\Http\Controllers\Controller;
use App\Models\Fish;
use Illuminate\Http\Request;
use App\Models\Mutation;
use Exception;

use Illuminate\Support\Facades\{
    DB,
    Log,
    Validator
};

use Yajra\DataTables\Facades\DataTables;

class MutationController extends Controller{
    public function index(){
        $data = $this->getData()->get();

        $columns = [
            ['label' => 'Fish', 'field' => 'fish_name'],
            ['label' => 'Mutation', 'field' => 'mutation_name'],
        ];

        $selects = $this->getSelects();

        return view('pages.mutation.index', compact('data', 'columns', 'selects'));
    }

    public function data(){
        $query = $this->getData();

        return DataTables::of($query)
            ->addIndexColumn()
            ->addColumn('action', function ($row) {
                $buttons = '';

                $buttons .= '
                <button class="btn btn-sm btn-warning btn-edit text-white" data-id="'.$row->mutation_id.'">
                    <i class="bi bi-pencil"></i>
                </button>';

                $buttons .= '
                <button class="btn btn-sm btn-danger btn-delete" data-id="'.$row->mutation_id.'" data-name="'.$row->mutation_name.'">
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
        $data = $this->getData()->where('t_mutation.mutation_id', $id)->first();
        if(!$data){
            return redirect()->back()->with('error', 'No record.');
        }

        return response()->json($data);
    }

    public function store(Request $request){
        $validator = Validator::make($request->all(), [
            'mutation_name'         => 'required|string',
            'fish_id'               => 'required|numeric',
            'mutation_chance'       => 'required|numeric|decimal:0,2',
            'mutation_min_weight'   => 'required|numeric|decimal:0,2',
            'mutation_max_weight'   => 'required|numeric|decimal:0,2',
            'mutation_min_length'   => 'required|numeric|decimal:0,2',
            'mutation_max_length'   => 'required|numeric|decimal:0,2',
            'mutation_description'  => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $validated = $validator->validated();

        try{
            Mutation::create($validated);

            return redirect()->route('web.mutation.index')->with('success', 'Successfully add record.');
        }catch(Exception $e){
            Log::error($e->getMessage());
            return redirect()->back()->with('error', 'Failed to create record: ' . $e->getMessage());
        }
    }

    public function update(Request $request, $id){
        $data = Mutation::find($id);
        if(!$data){
            return redirect()->back()->with('error', 'No record.');
        }

        $validator = Validator::make($request->all(), [
            'mutation_name'         => 'required|string',
            'fish_id'               => 'required|numeric',
            'mutation_chance'       => 'required|numeric|decimal:0,2',
            'mutation_min_weight'   => 'required|numeric|decimal:0,2',
            'mutation_max_weight'   => 'required|numeric|decimal:0,2',
            'mutation_min_length'   => 'required|numeric|decimal:0,2',
            'mutation_max_length'   => 'required|numeric|decimal:0,2',
            'mutation_description'  => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $validated = $validator->validated();

        try{
            $data->update($validated);

            return redirect()->route('web.mutation.index')->with('success', 'Successfully update record.');
        }catch(Exception $e){
            Log::error($e->getMessage());
            return redirect()->back()->with('error', 'Failed to create record: ' . $e->getMessage());
        }
    }

    public function destroy($id){
        $data = Mutation::find($id);
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
        $sql = Mutation::join('t_fish as f', 'f.fish_id', '=', 't_mutation.fish_id')
                        ->select(
                            't_mutation.*',
                            'f.fish_name',
                        );

        return $sql;
    }

    private function getSelects(){
        $fish = Fish::select('t_fish.fish_id as fish_id', 't_fish.fish_name as fish_name')->orderBy('fish_name', 'asc')->get();

        return [
            "fish" => $fish
        ];
    }
}
