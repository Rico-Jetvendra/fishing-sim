@include('components.header', ['title' => 'Catch Logs'])

<main class="app-main">
    <div class="app-content-header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <h3 class="mb-0">Catch Logs</h3>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-end">
                        <li class="breadcrumb-item"><a href="{{ route('web.index') }}">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Catch Logs</li>
                    </ol>
                </div>
            </div>
        </div>
        <div class="app-content">
            <div class="container-fluid">
                <div class="card">
                    <div class="card-body">
                        <table id="dataTable" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th width="60">No</th>
                                    @foreach ($columns as $col)
                                        <th>{{ $col['label'] }}</th>
                                    @endforeach
                                </tr>
                            </thead>

                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
</main>

<div class="modal fade" id="catchModal" data-bs-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <span>Detail Catch Log</span>
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body">
                <div class="card border-0 shadow-sm" id="detailRow">
                    <div class="card-header bg-success text-white">
                        <h4 class="mb-0">
                            <i class="bi bi-water"></i>
                            Fish Information
                        </h4>
                    </div>
                    <div class="card-body">
                        <!-- Fish Name -->
                        <div class="text-center mb-4">
                            <h2 class="fw-bold mb-1" id="fish_name"></h2>
                            <h4 class="fw-bold mb-1" id="fish_rarity"></h4>
                            <small class="text-muted">Catch Information</small>
                        </div>

                        <!-- Weight & Length -->
                        <div class="row text-center mb-4">
                            <div class="col-6">
                                <div class="border rounded p-3">
                                    <i class="bi bi-speedometer2 fs-2 text-primary"></i>
                                    <div class="text-muted mt-2">Weight</div>
                                    <h3 class="fw-bold mb-0" id="fish_weight"></h3>
                                </div>
                            </div>

                            <div class="col-6">
                                <div class="border rounded p-3">
                                    <i class="bi bi-rulers fs-2 text-success"></i>
                                    <div class="text-muted mt-2">Length</div>

                                    <h3 class="fw-bold mb-0" id="fish_length"></h3>
                                </div>
                            </div>
                        </div>

                        <!-- Catch Information -->
                        <div class="border py-2 px-1 row gy-3">
                            <div class="col-md-6">
                                <i class="bi bi-person-circle text-primary"></i>
                                <strong> Player</strong>

                                <div id="username" class="ms-4"></div>
                            </div>

                            <div class="col-md-6">
                                <i class="bi bi-stars text-warning"></i>
                                <strong> Rod</strong>

                                <div id="rod_name" class="ms-4"></div>
                            </div>

                            <div class="col-md-6">
                                <i class="bi bi-geo-alt-fill text-danger"></i>
                                <strong> Location</strong>

                                <div id="location_name" class="ms-4"></div>
                            </div>

                            <div class="col-md-6">
                                <i class="bi bi-tree-fill text-success"></i>
                                <strong> Season</strong>

                                <div id="season_name" class="ms-4"></div>
                            </div>

                            <div class="col-md-6">
                                <i class="bi bi-cloud-sun-fill text-warning"></i>
                                <strong> Weather</strong>

                                <div id="weather_name" class="ms-4"></div>
                            </div>

                            <div class="col-md-6">
                                <i class="bi bi-clock-history text-secondary"></i>
                                <strong> Caught At</strong>

                                <div id="created_date" class="ms-4"></div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

@include('components.footer')

<script>
    const columns = @json($columns);

    const tableColumns  = [
        { data: 'DT_RowIndex', orderable: false, searchable: false },

        ...columns.map(col => ({
            data: col.field,
            orderable: col.orderable ?? true,
            searchable: col.searchable ?? true
        })),
    ];

    $.fn.DataTable.ext.pager.numbers_length = 5;

    // Initialize DataTable
    const table = $('#dataTable').DataTable({
        responsive: true,
        autoWidth: false,
        processing: true,
        serverSide: true,
        ajax: "{{ route('web.catchLogs.data') }}",
        pagingType: "simple_numbers",
        columns: tableColumns,
    });

    function openDetail(row){
        const modal     = new bootstrap.Modal(document.getElementById('catchModal'));
        const detailRow = $('#detailRow');

        detailRow.find('#username').text(row.username);
        detailRow.find('#fish_name').text(row.fish_name);
        detailRow.find('#fish_rarity').text("("+row.fish_rarity+")");
        detailRow.find('#fish_weight').text(row.fish_weight+ " kg");
        detailRow.find('#fish_length').text(row.fish_length+ " cm");
        detailRow.find('#rod_name').text(row.rod_name);
        detailRow.find('#location_name').text(row.location_name);
        detailRow.find('#season_name').text(row.season_name);
        detailRow.find('#weather_name').text(row.weather_name);
        detailRow.find('#created_date').text(row.created_date);

        modal.show();
    }
</script>
