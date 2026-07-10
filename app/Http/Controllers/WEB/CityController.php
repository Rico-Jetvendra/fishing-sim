<?php

namespace App\Http\Controllers\WEB;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\City;
use Exception;

use Illuminate\Support\Facades\{
    DB,
    Log,
    Validator
};

use Yajra\DataTables\Facades\DataTables;

class CityController extends Controller{
    public function index(){
        $data = City::leftJoin('t_city as capital', 't_city.city_capital', '=', 'capital.city_id')
                        ->select(
                            't_city.*',
                            DB::raw("
                                CASE
                                    WHEN t_city.city_capital = 0 THEN 'Capital'
                                    ELSE capital.city_name
                                END as capital_name
                            ")
                        );

        $columns = [
            ['label' => 'Name', 'field' => 'city_name'],
            ['label' => 'Capital', 'field' => 'capital_name'],
        ];

        $selects = $this->getSelects();

        return view('pages.city.index', compact('data', 'columns', 'selects'));
    }

    public function data(){
        $query = City::leftJoin('t_city as capital', 't_city.city_capital', '=', 'capital.city_id')
                        ->select(
                            't_city.*',
                            DB::raw("
                                CASE
                                    WHEN t_city.city_capital = 0 THEN 'Capital'
                                    ELSE capital.city_name
                                END as capital_name
                            ")
                        );

        return DataTables::of($query)
            ->addIndexColumn()
            ->addColumn('action', function ($row) {
                $buttons = '';

                $buttons .= '
                <button class="btn btn-sm btn-warning btn-edit text-white" data-id="'.$row->city_id.'">
                    <i class="bi bi-pencil"></i>
                </button>';

                $buttons .= '
                <button class="btn btn-sm btn-danger btn-delete" data-id="'.$row->city_id.'" data-name="'.$row->city_name.'">
                    <i class="bi bi-trash"></i>
                </button>';

                return $buttons;
            })
            ->filterColumn('city_capital', function($query, $keyword) {
                $city_capital = City::get();

                if (stripos('capital', $keyword) !== false) {
                    $query->where('t_city.city_capital', 0);
                }

                foreach($city_capital as $capital ){
                    if(stripos($capital->city_name, $keyword) !== false){
                        $query->orWhere('t_city.city_capital', $capital->city_id);
                    }
                }
            })
            ->rawColumns(['action'])
            ->make(true);
    }

    public function edit($id){
        $data = City::leftJoin('t_city as capital', 't_city.city_capital', '=', 'capital.city_id')
                        ->select(
                            't_city.*',
                            'capital.city_id as city_capital_id',
                            'capital.city_name as city_capital_name',
                        )->find($id);
        if(!$data){
            return redirect()->back()->with('error', 'No record.');
        }

        return response()->json($data);
    }

    public function store(Request $request){
        $validator = Validator::make($request->all(), [
            'city_name'        => 'required|string',
            'city_capital_id'  => 'nullable|numeric',
            'city_description' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $validated = $validator->validated();

        try{
            $validated['city_capital'] = $validated['city_capital_id'];
            City::create($validated);

            return redirect()->route('web.city.index')->with('success', 'Successfully add record.');
        }catch(Exception $e){
            Log::error($e->getMessage());
            return redirect()->back()->with('error', 'Failed to create record: ' . $e->getMessage());
        }
    }

    public function update(Request $request, $id){
        $data = City::find($id);
        if(!$data){
            return redirect()->back()->with('error', 'No record.');
        }

        $validator = Validator::make($request->all(), [
            'city_name'         => 'required|string',
            'city_capital_id'   => 'nullable|numeric',
            'city_description'  => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $validated = $validator->validated();

        try{
            $validated['city_capital'] = $validated['city_capital_id'];
            $data->update($validated);

            return redirect()->route('web.city.index')->with('success', 'Successfully update record.');
        }catch(Exception $e){
            Log::error($e->getMessage());
            return redirect()->back()->with('error', 'Failed to create record: ' . $e->getMessage());
        }
    }

    public function destroy($id){
        $data = City::find($id);
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
        $city_capital = City::select('t_city.city_id as city_capital_id', 't_city.city_name as city_capital_name')->where('city_capital', 0)->get();

        return [
            "city_capital" => $city_capital
        ];
    }
}
