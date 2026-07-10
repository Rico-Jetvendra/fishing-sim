@include('components.header', ['title' => 'Weather'])

<main class="app-main">
    <div class="app-content-header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <h3 class="mb-0">Weather</h3>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-end">
                        <li class="breadcrumb-item"><a href="{{ route('web.index') }}">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Weather</li>
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
    title="Weather"
    :fields="[
        ['name' => 'weather_name', 'id' => 'weather_name', 'label' => 'Weather', 'type' => 'text', 'required' => true],
    ]"
/>

@include('components.footer')

<script>
    const columns = @json($columns);

    initCrud({
        routes: {
            store: "{{ route('web.weather.store') }}",
            update: id => "{{ route('web.weather.update', ':id') }}".replace(':id', id),
            edit: id => "{{ route('web.weather.edit', ':id') }}".replace(':id', id),
            destroy: id => "{{ route('web.weather.destroy', ':id') }}".replace(':id', id),
            data: "{{ route('web.weather.data') }}"
        },
        fields: {
            'weather_name': 'weather_name',
        },
        columns: columns,
    });
</script>
