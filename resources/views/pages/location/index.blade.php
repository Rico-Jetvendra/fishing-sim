@include('components.header', ['title' => 'Location'])

<main class="app-main">
    <div class="app-content-header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <h3 class="mb-0">Location</h3>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-end">
                        <li class="breadcrumb-item"><a href="{{ route('web.index') }}">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Location</li>
                    </ol>
                </div>
            </div>
        </div>
        <div class="app-content">
            <div class="container-fluid">
                <x-crud-table
                    :data="$data"
                    :columns="$columns"
                    primaryKey="id"
                />
            </div>
        </div>
    </div>
</main>

<x-crud-modal
    title="Location"
    :fields="[
        ['name' => 'location_name', 'id' => 'location_name', 'label' => 'Location', 'type' => 'text', 'required' => true],
        ['name' => 'city_name', 'id' => 'city_id', 'label' => 'City', 'type' => 'select', 'required' => true],
        ['name' => 'water_type_name', 'id' => 'water_type', 'label' => 'Water', 'type' => 'select', 'required' => true],
        ['name' => 'location_description', 'id' => 'location_description', 'label' => 'Description', 'type' => 'textarea', 'required' => false],
    ]"
    :selects="[
        ['name' => 'city_name', 'selects' => $selects['city']],
        ['name' => 'water_type_name', 'selects' => $selects['water_type']],
    ]"
/>

@include('components.footer')

<script>
    const columns = @json($columns);

    initCrud({
        routes: {
            store: "{{ route('web.location.store') }}",
            update: id => "{{ route('web.location.update', ':id') }}".replace(':id', id),
            edit: id => "{{ route('web.location.edit', ':id') }}".replace(':id', id),
            destroy: id => "{{ route('web.location.destroy', ':id') }}".replace(':id', id),
            data: "{{ route('web.location.data') }}"
        },
        fields: {
            'location_name': 'location_name',
            'city_id': 'city_name',
            'water_type': 'water_type_name',
            'location_description': 'location_description',
        },
        columns: columns,
    });
</script>
