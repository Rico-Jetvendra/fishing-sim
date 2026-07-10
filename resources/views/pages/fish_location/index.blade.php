@include('components.header', ['title' => 'Fish Location'])

<main class="app-main">
    <div class="app-content-header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <h3 class="mb-0">Fish Location</h3>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-end">
                        <li class="breadcrumb-item"><a href="{{ route('web.index') }}">Dashboard</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Fish Location</li>
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

<div class="modal fade" id="crudModal" data-bs-backdrop="static">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <form method="POST" id="crudForm" onsubmit="store()">
                @csrf
                <input type="hidden" name="_method" id="formMethod" value="POST">
                <input type="hidden" name="editID" id="editID" value="">

                <div class="modal-header">
                    <h5 class="modal-title">
                        <span id="modalTitle">Add</span> Fish Location
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 mb-3">
                            <label class="form-label" for="fish_id">Fish</label>
                            <select class="form-select searchable-select" name="fish_id" id="fish_id" required>
                                <option value="">-- Select Fish --</option>
                                @foreach($selects['fish'] as $fish)
                                    <option value="{{ $fish->fish_id }}">{{ $fish->fish_name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-lg-12 col-md-12 mb-3">
                            <a href="#" class="btn btn-primary btn-relation mb-3" onclick="openRelation(); return false;">
                                <i class="bi bi-plus"></i> Add Relations
                            </a>
                            <table id="dataTable" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Location</th>
                                        <th>Modifier</th>
                                        <th>Mutation Chance</th>
                                    </tr>
                                </thead>
                                <tbody id="relationTable">
                                    <tr>
                                        <td class="text-center" colspan="4">No records</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>

            </form>

        </div>
    </div>
</div>

<div class="modal fade" id="relationModal" data-bs-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <span id="modalRelationTitle">Add</span> Relation
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <form id="relationForm" onsubmit="saveRelation()">
                <div class="modal-body">
                    <input type="hidden" name="relationIndex" id="relationIndex" value="" />
                    <div class="row">
                        <div class="col-lg-12 col-md-12 mb-3">
                            <label class="form-label" for="location_id">Location</label>
                            <select class="form-select searchable-select" name="location_id" id="location_id" required>
                                <option value="">-- Select Location --</option>
                                @foreach($selects['location'] as $location)
                                    <option value="{{ $location->location_id }}">
                                        {{ $location->location_name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-lg-12 col-md-12 mb-3">
                            <label class="form-label" for="location_modifier">Modifier</label>
                            <input type="number" class="form-control" name="location_modifier" step="1" min="0" max="99999" id="location_modifier" placeholder="Location Modifier" oninput="if(this.value > 99999) this.value = 99999; if(this.value < 1) this.value = 0;"/>
                        </div>
                        <div class="col-lg-12 col-md-12 mb-3">
                            <label class="form-label" for="location_mutation">Mutation Chance</label>
                            <input type="number" class="form-control" name="location_mutation" step="1" min="0" max="100" id="location_mutation" placeholder="Location Chance" oninput="if(this.value > 100) this.value = 100; if(this.value < 1) this.value = 0;"/>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>


@include('components.footer')

<script>
    const columns = @json($columns);
    var relations = [];

    initCrud({
        routes: {
            store: "{{ route('web.fishLocation.store') }}",
            update: id => "{{ route('web.fishLocation.update', ':id') }}".replace(':id', id),
            edit: id => "{{ route('web.fishLocation.edit', ':id') }}".replace(':id', id),
            destroy: id => "{{ route('web.fishLocation.destroy', ':id') }}".replace(':id', id),
            data: "{{ route('web.fishLocation.data') }}"
        },
        fields: {
            'fish_id': 'fish_name',
            'location_id': 'location_name',
            'location_modifier': 'location_modifier',
            'location_mutation': 'location_mutation',
        },
        columns: columns,
    });

    function openRelation(){
        var relationIndex   = $('#relationIndex');
        var form            = $('#relationForm');
        const modal         = new bootstrap.Modal(document.getElementById('relationModal'));

        modal.show();
        $('#modalRelationTitle').text('Add');

        form.trigger('reset');
        $('#location_id')[0].tomselect.clear();
    }

    function saveRelation(){
        event.preventDefault();

        var relationIndex   = $('#relationIndex');
        var inputs          = $('#relationForm :input');
        var data            = {};

        for (let index = 0; index < inputs.length; index++) {
            var element = inputs[index];
            var value   = element.value;

            if(element.name && element.name != 'relationIndex'){
                if(element.type == 'select-one'){
                    var select = {};

                    select['id']    = element.value;
                    select['name']  = element.options[element.selectedIndex].text;

                    data[element.name] = select;
                }else{
                    data[element.name] = element.value;
                }

            }
        }

        if(relationIndex.val() == ""){
            relations.push(data);
        }else{
            relations[relationIndex.val()] = data;
        }

        populateRelation();

        bootstrap.Modal.getInstance(
            document.getElementById('relationModal')
        ).hide();
    }

    function populateRelation(){
        var tbody = $('#relationTable');

        tbody.empty();

        relations.forEach((relation, index) => {
            tbody.append(`
                <tr>
                    <td>${index+1}</td>
                    <td>${relation.location_id['name']}</td>
                    <td>${relation.location_modifier}</td>
                    <td>${relation.location_mutation}</td>
                    <td>
                        <a href="#" class="btn btn-warning btn-sm text-white" onclick="editRelation(${index}); return false;">Edit</a>
                        <a href="#" class="btn btn-danger btn-sm" onclick="deleteRelation(${index}); return false;">Delete</a>
                    </td>
                </tr>
            `);
        });
    }

    function editRelation(index){
        $('#modalRelationTitle').text('Edit');

        let relationIndex   = $('#relationIndex');
        let form            = $('#relationForm');
        let item            = relations[index];

        relationIndex.val(index);

        form.find('#location_id')[0].tomselect.setValue(item.location_id['id']);
        form.find('#location_modifier').val(item.location_modifier);
        form.find('#location_mutation').val(item.location_mutation);

        new bootstrap.Modal(
            document.getElementById('relationModal')
        ).show();
    }

    function deleteRelation(index){
        relations.splice(index, 1);
        populateRelation();
    }

    function store(){
        event.preventDefault();

        var form = $('#crudForm');
        var data = form.serializeArray();
        var rel  = {
            name: 'relation',
            value: JSON.stringify(relations)
        };
        data.push(rel);

        if($('#formMethod').val() == 'POST'){
            $.post("{{ route('web.fishLocation.store') }}", data).then((result) => {
                if(!result.success){
                    Swal.fire({
                        title: 'Error',
                        text: result.messages,
                        icon: 'error'
                    });
                }

                Swal.fire({
                    title: 'Success',
                    text: result.messages,
                    icon: 'success'
                });
            });
        }else{
            const id = $('#editID').val();

            $.ajax({
                url: "{{ route('web.fishLocation.update', ':id') }}".replace(':id', id),
                type: 'POST',
                data: data,
                dataType: 'json',
                success: function(result) {
                    if(!result.success){
                        Swal.fire({
                            title: 'Error',
                            text: result.messages,
                            icon: 'error'
                        });
                    }

                    Swal.fire({
                        title: 'Success',
                        text: result.messages,
                        icon: 'success'
                    });
                },
            });
        }

        bootstrap.Modal.getInstance(
            document.getElementById('crudModal')
        ).hide();

        $('.dataTable').DataTable().ajax.reload();
    };

    $('.btn-create').click(() => {
        const form  = $('#crudForm');
        const modal = $('#crudModal');

        relations.length = 0;
        form.trigger('reset');
        $('#fish_id')[0].tomselect.clear();

        populateRelation();

        form.attr('action', "{{ route('web.fishLocation.store') }}");
        $('#formMethod').val('POST');
        $('#modalTitle').text('Add');

        modal.modal('show');
    });

    $(document).on('click', '.btn-edit-relation', function () {
        const id    = $(this).data('id');
        const form  = $('#crudForm');
        const modal = $('#crudModal');

        $('.btn-edit-relation').prop('disabled', true);
        $('.btn-delete-relation').prop('disabled', true);

        $('#editID').val(id);
        $('#formMethod').val('PUT');
        $('#modalTitle').text('Edit');

        $.get("{{ route('web.fishLocation.edit', ':id') }}".replace(':id', id))
        .done(function(res){
            relations.length = 0;
            $('#fish_id')[0].tomselect.setValue(res[0].fish_id);

            res.forEach(element => {
                let data = {
                    location_id: {
                        id: element.location_id,
                        name: element.location_name
                    },
                    location_modifier: element.location_modifier,
                    location_mutation: element.location_mutation
                };

                relations.push(data);
            });

            populateRelation();

            setTimeout(() => {
                modal.modal('show');
            }, 0);
        }).always(function() {
            $('.btn-edit-relation').prop('disabled', false);
            $('.btn-delete-relation').prop('disabled', false);
        });
    });

    $(document).on('click', '.btn-delete-relation', function () {
        const id = $(this).data('id');
        const name = $(this).data('name');

        Swal.fire({
            title: 'You sure?',
            text: "You sure want to delete this " + name + "?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes, delete!',
            cancelButtonText: 'No, cancel!',
        }).then(r => {
            if (!r.isConfirmed){
                return Swal.fire({
                    title: 'Cancelled',
                    text: 'Record not deleted.',
                    icon: 'error'
                });
            };

            destroy(id);
        });
    });

    function destroy(id) {
        $.post("{{ route('web.fishLocation.destroy', ':id') }}".replace(':id', id), {
            _method: 'DELETE'
        })
        .done(() => {
            Swal.fire({
                title: 'Success!',
                text: 'Record have been deleted.',
                icon: 'success'
            }).then(() => $('.dataTable').DataTable().ajax.reload());
        });
    }
</script>
