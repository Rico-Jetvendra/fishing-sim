<?php

namespace App\Http\Controllers\WEB;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Bait;
use Exception;

use Illuminate\Support\Facades\{
    DB,
    Log,
    Validator
};

use Yajra\DataTables\Facades\DataTables;

class BaitController extends Controller{
    public function index(){
        $data = Bait::all();

        $columns = [
            ['label' => 'Name', 'field' => 'bait_name'],
            ['label' => 'Category', 'field' => 'bait_category'],
        ];

        $selects = $this->getSelects();

        return view('pages.bait.index', compact('data', 'columns', 'selects'));
    }

    public function data(){
        $query = Bait::query();

        return DataTables::of($query)
            ->addIndexColumn()
            ->addColumn('bait_category', function($row){
                $bait_category = config('combobox.bait_category');

                foreach($bait_category as $category){
                    if($category->bait_category == $row->bait_category){
                        return $category->bait_category_name;
                    }
                }
            })
            ->addColumn('action', function ($row) {
                $buttons = '';

                $buttons .= '
                <button class="btn btn-sm btn-warning btn-edit text-white" data-id="'.$row->bait_id.'">
                    <i class="bi bi-pencil"></i>
                </button>';

                $buttons .= '
                <button class="btn btn-sm btn-danger btn-delete" data-id="'.$row->bait_id.'" data-name="'.$row->bait_name.'">
                    <i class="bi bi-trash"></i>
                </button>';

                return $buttons;
            })
            ->filterColumn('bait_category', function($query, $keyword) {
                $bait_category = config('combobox.bait_category');

                foreach($bait_category as $category){
                    if(stripos($category->bait_category_name, $keyword) !== false){
                        $query->orWhere('bait_category', $category->bait_category);
                    }
                }
            })
            ->rawColumns(['action'])
            ->make(true);
    }

    public function edit($id){
        $data = Bait::find($id);
        if(!$data){
            return redirect()->back()->with('error', 'No record.');
        }

        return response()->json($data);
    }

    public function store(Request $request){
        $validator = Validator::make($request->all(), [
            'bait_name'         => 'required|string',
            'bait_category'     => 'required|numeric',
            'bait_description'  => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $validated = $validator->validated();

        try{
            Bait::create($validated);

            return redirect()->route('web.bait.index')->with('success', 'Successfully add record.');
        }catch(Exception $e){
            Log::error($e->getMessage());
            return redirect()->back()->with('error', 'Failed to create record: ' . $e->getMessage());
        }
    }

    public function update(Request $request, $id){
        $data = Bait::find($id);
        if(!$data){
            return redirect()->back()->with('error', 'No record.');
        }

        $validator = Validator::make($request->all(), [
            'bait_name'         => 'required|string',
            'bait_category'     => 'required|numeric',
            'bait_description'  => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $validated = $validator->validated();

        try{
            $data->update($validated);

            return redirect()->route('web.bait.index')->with('success', 'Successfully update record.');
        }catch(Exception $e){
            Log::error($e->getMessage());
            return redirect()->back()->with('error', 'Failed to create record: ' . $e->getMessage());
        }
    }

    public function destroy($id){
        $data = Bait::find($id);
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
        $bait_category = config('combobox.bait_category');

        return [
            "bait_category" => $bait_category
        ];
    }
}
