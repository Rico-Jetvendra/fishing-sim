@include('components.header', ['title' => 'Rod'])

<main class="app-main">
    <div class="app-content-header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <h3 class="mb-0">Rod</h3>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-end">
                        <li class="breadcrumb-item"><a href="{{ route('web.index') }}">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Rod</li>
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
    title="Rod"
    :fields="[
        ['name' => 'rod_name', 'id' => 'rod_name', 'label' => 'Rod', 'type' => 'text', 'required' => true],
        ['name' => 'rod_rarity_name', 'id' => 'rod_rarity', 'label' => 'Rarity', 'type' => 'select', 'required' => true],
        ['name' => 'rod_description', 'id' => 'rod_description', 'label' => 'Description', 'type' => 'textarea', 'required' => false],
    ]"
    :selects="[
        ['name' => 'rod_rarity_name', 'selects' => $selects['rod_rarity']],
    ]"
/>

@include('components.footer')

<script>
    const columns = @json($columns);

    initCrud({
        routes: {
            store: "{{ route('web.rod.store') }}",
            update: id => "{{ route('web.rod.update', ':id') }}".replace(':id', id),
            edit: id => "{{ route('web.rod.edit', ':id') }}".replace(':id', id),
            destroy: id => "{{ route('web.rod.destroy', ':id') }}".replace(':id', id),
            data: "{{ route('web.rod.data') }}"
        },
        fields: {
            'rod_name': 'rod_name',
            'rod_rarity': 'rod_rarity_name',
            'rod_description': 'rod_description',
        },
        columns: columns,
    });
</script>
