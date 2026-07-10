@include('components.header', ['title' => 'Bait'])

<main class="app-main">
    <div class="app-content-header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <h3 class="mb-0">Bait</h3>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-end">
                        <li class="breadcrumb-item"><a href="{{ route('web.index') }}">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Bait</li>
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
    title="Bait"
    :fields="[
        ['name' => 'bait_name', 'id' => 'bait_name', 'label' => 'Bait', 'type' => 'text', 'required' => true],
        ['name' => 'bait_category_name', 'id' => 'bait_category', 'label' => 'Category', 'type' => 'select', 'required' => true],
        ['name' => 'bait_description', 'id' => 'bait_description', 'label' => 'Description', 'type' => 'textarea', 'required' => false],
    ]"
    :selects="[
        ['name' => 'bait_category_name', 'selects' => $selects['bait_category']],
    ]"
/>

@include('components.footer')

<script>
    const columns = @json($columns);

    initCrud({
        routes: {
            store: "{{ route('web.bait.store') }}",
            update: id => "{{ route('web.bait.update', ':id') }}".replace(':id', id),
            edit: id => "{{ route('web.bait.edit', ':id') }}".replace(':id', id),
            destroy: id => "{{ route('web.bait.destroy', ':id') }}".replace(':id', id),
            data: "{{ route('web.bait.data') }}"
        },
        fields: {
            'bait_name': 'bait_name',
            'bait_category': 'bait_category_name',
            'bait_description': 'bait_description',
        },
        columns: columns,
    });
</script>
