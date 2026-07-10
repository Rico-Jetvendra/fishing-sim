@include('components.header', ['title' => 'Mutation'])

<main class="app-main">
    <div class="app-content-header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <h3 class="mb-0">Mutation</h3>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-end">
                        <li class="breadcrumb-item"><a href="{{ route('web.index') }}">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Mutation</li>
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
    title="Mutation"
    :fields="[
        ['name' => 'mutation_name', 'id' => 'mutation_name', 'label' => 'Mutation', 'type' => 'text', 'required' => true],
        ['name' => 'fish_name', 'id' => 'fish_id', 'label' => 'Fish', 'type' => 'select', 'required' => true],
        ['name' => 'mutation_chance', 'id' => 'mutation_chance', 'label' => 'Chance', 'type' => 'number', 'required' => true],
        ['name' => 'mutation_min_weight', 'id' => 'mutation_min_weight', 'label' => 'Min Weight', 'type' => 'number', 'required' => true],
        ['name' => 'mutation_max_weight', 'id' => 'mutation_min_weight', 'label' => 'Max Weight', 'type' => 'number', 'required' => true],
        ['name' => 'mutation_min_length', 'id' => 'mutation_min_length', 'label' => 'Min Length', 'type' => 'number', 'required' => true],
        ['name' => 'mutation_max_length', 'id' => 'mutation_max_length', 'label' => 'Max Length', 'type' => 'number', 'required' => true],
        ['name' => 'mutation_description', 'id' => 'mutation_description', 'label' => 'Description', 'type' => 'textarea', 'required' => false],
    ]"
    :selects="[
        ['name' => 'fish_name', 'selects' => $selects['fish']],
    ]"
/>

@include('components.footer')

<script>
    const columns = @json($columns);

    initCrud({
        routes: {
            store: "{{ route('web.mutation.store') }}",
            update: id => "{{ route('web.mutation.update', ':id') }}".replace(':id', id),
            edit: id => "{{ route('web.mutation.edit', ':id') }}".replace(':id', id),
            destroy: id => "{{ route('web.mutation.destroy', ':id') }}".replace(':id', id),
            data: "{{ route('web.mutation.data') }}"
        },
        fields: {
            'mutation_name': 'mutation_name',
            'fish_id': 'fish_name',
            'mutation_chance': 'mutation_chance',
            'mutation_min_weight': 'mutation_min_weight',
            'mutation_max_weight': 'mutation_max_weight',
            'mutation_min_length': 'mutation_min_length',
            'mutation_max_length': 'mutation_max_length',
            'mutation_description': 'mutation_description',
        },
        columns: columns,
    });
</script>
