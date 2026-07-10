@include('components.header', ['title' => 'City'])

<main class="app-main">
    <div class="app-content-header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <h3 class="mb-0">City</h3>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-end">
                        <li class="breadcrumb-item"><a href="{{ route('web.index') }}">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">City</li>
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
    title="City"
    :fields="[
        ['name' => 'city_name', 'id' => 'city_name', 'label' => 'City', 'type' => 'text', 'required' => true],
        ['name' => 'city_capital_name', 'id' => 'city_capital_id', 'label' => 'Capital', 'type' => 'select', 'required' => false],
        ['name' => 'city_description', 'id' => 'city_description', 'label' => 'Description', 'type' => 'textarea', 'required' => false],
    ]"
    :selects="[
        ['name' => 'city_capital_name', 'selects' => $selects['city_capital']],
    ]"
/>

@include('components.footer')

<script>
    const columns = @json($columns);

    initCrud({
        routes: {
            store: "{{ route('web.city.store') }}",
            update: id => "{{ route('web.city.update', ':id') }}".replace(':id', id),
            edit: id => "{{ route('web.city.edit', ':id') }}".replace(':id', id),
            destroy: id => "{{ route('web.city.destroy', ':id') }}".replace(':id', id),
            data: "{{ route('web.city.data') }}"
        },
        fields: {
            'city_name': 'city_name',
            'city_capital_id': 'city_capital_name',
            'city_description': 'city_description',
        },
        columns: columns,
    });
</script>
