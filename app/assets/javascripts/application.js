// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require wice_grid
//= require bootstrap-datepicker
//= require bootstrap-multiselect
//= require bootstrap-sprockets
//= require_tree .
//= require sweetalert2
//= require sweet-alert2-rails

// para sobrescribir el diseño del dialogo de confirmacion al eliminar
window.sweetAlertConfirmConfig = {
    title: 'Are you sure?',
    type: 'error',
    showCancelButton: true,
    confirmButtonColor: '#DD6B55',
    confirmButtonText: 'Ok'
};

$(document).on('turbolinks:load', function () {
    Turbolinks.clearCache();
});

$(document).ready(function () {  
    // boton para ir al inicio de la pagina
    $(window).scroll(function () {
        if ($(this).scrollTop() > 50) {
            $('#back-to-top').fadeIn();
        } else {
            $('#back-to-top').fadeOut();
        }
    });
    $('#back-to-top').click(function () {
        $('#back-to-top').tooltip('hide');
        $('body,html').animate({
            scrollTop: 0
        }, 500);
        return false;
    });
    $('#back-to-top').tooltip('show');  
});

$(document).on('turbolinks:load', function () {
    //clear filters     
    // $("#clearFilters").click(function (e) {
    //     $('.filterable .filters input').val('');
    //     /* Ignore tab key */
    //     var code = e.keyCode || e.which;
    //     if (code == '9') return;
    //     /* Useful DOM data and selectors */
    //     var $input = $(this),
    //         inputContent = $input.val().toLowerCase(),
    //         $panel = $input.parents('.filterable'),
    //         column = $panel.find('.filters th').index($input.parents('th')),
    //         $table = $panel.find('.table'),
    //         $rows = $table.find('tbody tr');
    //     /* Dirtiest filter function ever ;) */
    //     var $filteredRows = $rows.filter(function () {
    //         var value = $(this).find('td').eq(column).text().toLowerCase();
    //         return value.indexOf(inputContent) === -1;
    //     });
    //     /* Clean previous no-result if exist */
    //     $table.find('tbody .no-result').remove();
    //     /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
    //     $rows.show();
    //     $filteredRows.hide();
    //     /* Prepend no-result row if all rows are filtered */
    //     if ($filteredRows.length === $rows.length) {
    //         $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="' + $table.find('.filters th').length + '">No result found</td></tr>'));
    //     }
    // });

    // Filtro en la cabezera de cada columna
    $('.filterable .filters input').keyup(function (e) {
        /* Ignore tab key */
        var code = e.keyCode || e.which;
        if (code == '9') return;
        /* Useful DOM data and selectors */
        var $input = $(this),
            inputContent = $input.val().toLowerCase(),
            $panel = $input.parents('.filterable'),
            column = $panel.find('.filters th').index($input.parents('th')),
            $table = $panel.find('.table'),
            $rows = $table.find('tbody tr');
        /* Dirtiest filter function ever ;) */
        var $filteredRows = $rows.filter(function () {
            var value = $(this).find('td').eq(column).text().toLowerCase();
            return value.indexOf(inputContent) === -1;
        });
        /* Clean previous no-result if exist */
        $table.find('tbody .no-result').remove();
        /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
        $rows.show();
        $filteredRows.hide();
        /* Prepend no-result row if all rows are filtered */
        if ($filteredRows.length === $rows.length) {
            $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="' + $table.find('.filters th').length + '">No result found</td></tr>'));
        }
    });
});