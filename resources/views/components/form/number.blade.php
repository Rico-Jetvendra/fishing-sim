<input
    type="number"
    class="form-control"
    name="{{ $field['name'] }}"
    id="{{ $field['name'] }}"
    placeholder="{{ $field['label'] }}"
    step="0.01"
    min="0"
    max="99999"
    @required($field['required'] ?? false)
>
