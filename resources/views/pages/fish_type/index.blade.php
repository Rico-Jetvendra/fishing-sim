@include('components.header', ['title' => 'Fish Type'])

<main class="app-main">
    <div class="app-content-header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <h3 class="mb-0">Fish Type</h3>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-end">
                        <li class="breadcrumb-item"><a href="{{ route('web.index') }}">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Fish Type</li>
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
    title="Fish Type"
    :fields="[
        ['name' => 'fish_type', 'id' => 'fish_type', 'label' => 'Fish Type', 'type' => 'text', 'required' => true],
        ['name' => 'water_type_name', 'id' => 'water_type', 'label' => 'Water', 'type' => 'select', 'required' => true],
    ]"
    :selects="[
        ['name' => 'water_type_name', 'selects' => $selects['water_type']],
    ]"
/>

@include('components.footer')

<script>
    const columns = @json($columns);

    initCrud({
        routes: {
            store: "{{ route('web.fishType.store') }}",
            update: id => "{{ route('web.fishType.update', ':id') }}".replace(':id', id),
            edit: id => "{{ route('web.fishType.edit', ':id') }}".replace(':id', id),
            destroy: id => "{{ route('web.fishType.destroy', ':id') }}".replace(':id', id),
            data: "{{ route('web.fishType.data') }}"
        },
        fields: {
            'fish_type': 'fish_type',
            'water_type': 'water_type_name'
        },
        columns: columns,
    });
</script>
