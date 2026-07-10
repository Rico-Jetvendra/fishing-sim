@include('components.header', ['title' => 'Fish'])

<main class="app-main">
    <div class="app-content-header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <h3 class="mb-0">Fish</h3>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-end">
                        <li class="breadcrumb-item"><a href="{{ route('web.index') }}">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Fish</li>
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
    title="Fish"
    :fields="[
        ['name' => 'fish_name', 'id' => 'fish_name', 'label' => 'Fish', 'type' => 'text', 'required' => true],
        ['name' => 'fish_type_name', 'id' => 'fish_type', 'label' => 'Type', 'type' => 'select', 'required' => true],
        ['name' => 'fish_rarity_name', 'id' => 'fish_rarity', 'label' => 'Rarity', 'type' => 'select', 'required' => true],
        ['name' => 'fish_base_weight', 'id' => 'fish_base_weight', 'label' => 'Base Weight', 'type' => 'number', 'required' => true],
        ['name' => 'fish_min_weight', 'id' => 'fish_min_weight', 'label' => 'Min Weight', 'type' => 'number', 'required' => true],
        ['name' => 'fish_max_weight', 'id' => 'fish_min_weight', 'label' => 'Max Weight', 'type' => 'number', 'required' => true],
        ['name' => 'fish_min_length', 'id' => 'fish_min_length', 'label' => 'Min Length', 'type' => 'number', 'required' => true],
        ['name' => 'fish_max_length', 'id' => 'fish_max_length', 'label' => 'Max Length', 'type' => 'number', 'required' => true],
        ['name' => 'fish_description', 'id' => 'fish_description', 'label' => 'Description', 'type' => 'textarea', 'required' => false],
    ]"
    :selects="[
        ['name' => 'fish_type_name', 'selects' => $selects['type']],
        ['name' => 'fish_rarity_name', 'selects' => $selects['rarity']],
    ]"
/>

@include('components.footer')

<script>
    const columns = @json($columns);

    initCrud({
        routes: {
            store: "{{ route('web.fish.store') }}",
            update: id => "{{ route('web.fish.update', ':id') }}".replace(':id', id),
            edit: id => "{{ route('web.fish.edit', ':id') }}".replace(':id', id),
            destroy: id => "{{ route('web.fish.destroy', ':id') }}".replace(':id', id),
            data: "{{ route('web.fish.data') }}"
        },
        fields: {
            'fish_name': 'fish_name',
            'fish_type': 'fish_type_name',
            'fish_rarity': 'fish_rarity_name',
            'fish_base_weight': 'fish_base_weight',
            'fish_min_weight': 'fish_min_weight',
            'fish_max_weight': 'fish_max_weight',
            'fish_min_length': 'fish_min_length',
            'fish_max_length': 'fish_max_length',
            'fish_description': 'fish_description'
        },
        columns: columns,
    });
</script>
