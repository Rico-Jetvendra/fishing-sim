<?php

namespace App\Http\Controllers\WEB;

use App\Http\Controllers\Controller;
use App\Models\City;
use Illuminate\Http\Request;
use App\Models\Location;
use Exception;

use Illuminate\Support\Facades\{
    DB,
    Log,
    Validator
};

use Yajra\DataTables\Facades\DataTables;

class LocationController extends Controller{
    public function index(){
        $data = $this->getData()->get();

        $columns = [
            ['label' => 'Name', 'field' => 'location_name'],
            ['label' => 'City', 'field' => 'city_name'],
            ['label' => 'Water', 'field' => 'water_type'],
        ];

        $selects = $this->getSelects();

        return view('pages.location.index', compact('data', 'columns', 'selects'));
    }

    public function data(){
        $query = $this->getData();

        return DataTables::of($query)
            ->addIndexColumn()
            ->addColumn('water_type', function($row){
                $water_type = config('combobox.water');

                foreach($water_type as $water){
                    if($water->water_type == $row->location_water){
                        return $water->water_type_name;
                    }
                }
            })
            ->addColumn('action', function ($row) {
                $buttons = '';

                $buttons .= '
                <button class="btn btn-sm btn-warning btn-edit text-white" data-id="'.$row->location_id.'">
                    <i class="bi bi-pencil"></i>
                </button>';

                $buttons .= '
                <button class="btn btn-sm btn-danger btn-delete" data-id="'.$row->location_id.'" data-name="'.$row->location_name.'">
                    <i class="bi bi-trash"></i>
                </button>';

                return $buttons;
            })
            ->filterColumn('city_name', function($query, $keyword) {
                $query->where('c.city_name', 'like', "%$keyword%");
            })
            ->filterColumn('water_type', function($query, $keyword) {
                $water_type = config('combobox.water');

                foreach($water_type as $water){
                    if(stripos($water->water_type_name, $keyword) !== false){
                        $query->orWhere('location_water', $water->water_type);
                    }
                }
            })
            ->rawColumns(['action'])
            ->make(true);
    }

    public function edit($id){
        $data = $this->getData()->where('t_location.location_id', $id)->first();
        if(!$data){
            return redirect()->back()->with('error', 'No record.');
        }

        return response()->json($data);
    }

    public function store(Request $request){
        $validator = Validator::make($request->all(), [
            'location_name'         => 'required|string',
            'city_id'               => 'required|numeric',
            'water_type'            => 'required|numeric',
            'location_description'  => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $validated = $validator->validated();

        try{
            $validated['location_water'] = $validated['water_type'];
            Location::create($validated);

            return redirect()->route('web.location.index')->with('success', 'Successfully add record.');
        }catch(Exception $e){
            Log::error($e->getMessage());
            return redirect()->back()->with('error', 'Failed to create record: ' . $e->getMessage());
        }
    }

    public function update(Request $request, $id){
        $data = Location::find($id);
        if(!$data){
            return redirect()->back()->with('error', 'No record.');
        }

        $validator = Validator::make($request->all(), [
            'location_name'         => 'required|string',
            'city_id'               => 'required|numeric',
            'water_type'            => 'required|numeric',
            'location_description'  => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $validated = $validator->validated();

        try{
            $validated['location_water'] = $validated['water_type'];
            $data->update($validated);

            return redirect()->route('web.location.index')->with('success', 'Successfully update record.');
        }catch(Exception $e){
            Log::error($e->getMessage());
            return redirect()->back()->with('error', 'Failed to create record: ' . $e->getMessage());
        }
    }

    public function destroy($id){
        $data = Location::find($id);
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
        $sql = Location::join('t_city as c', 't_location.city_id', '=', 'c.city_id')
                        ->select(
                            't_location.*',
                            't_location.location_water as water_type',
                            'c.city_name'
                        );

        return $sql;
    }

    private function getSelects(){
        $city       = City::all();
        $water_type = config('combobox.water');

        return [
            "city" => $city,
            "water_type" => $water_type
        ];
    }
}
