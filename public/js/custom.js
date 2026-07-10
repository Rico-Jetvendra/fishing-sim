$(document).ready(function () {
    $('.datepicker').each(function () {
        $(this).datepicker({
            uiLibrary: 'bootstrap5',
            format: 'yyyy-mm-dd',
            placeholder: 'yyyy-mm-dd'
        });
    });

    const segment1      = window.location.pathname.split('/').filter(Boolean).at(-1).replace(/-/g, "_");
    if(segment1 === 'public'){
        $.fn.DataTable.ext.pager.numbers_length = 5;

        const table = $('.dataTable').DataTable({
            responsive:true,
            autoWidth:false,
            processing: true,
        });
    }
});

document.querySelectorAll('.searchable-select').forEach((el) => {
    const label = document.querySelector(`label[for="${el.id}"]`);
    const text  = label.innerText.trim().replace('(required)', '');

    if (el.options[0].value === '') {
        el.options[0].text =
            `----- Select ${text} -----`;
    }

    if (!el.tomselect) {
        new TomSelect(el, {
            create: false
        });
    }
});
