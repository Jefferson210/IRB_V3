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
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require dataTables/jquery.dataTables
//= require turbolinks
//= require wice_grid
//= require bootstrap-datepicker
//= require bootstrap-multiselect
//= require bootstrap-sprockets
//= require sweetalert2
//= require sweet-alert2-rails
//= require_tree .


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

    $('.filterTable thead tr').clone(true).appendTo('.filterTable thead');
    $('.filterTable thead tr:eq(1) th').each(function (i) {
        var title = $(this).text();
        if (!$(this).hasClass("buttonAction")) {
            $(this).html('<input class="form-control" size="5" type="text"/>');
        }
        
        $('input', this).on('keyup change', function () {
            if (table.column(i).search() !== this.value) {
                table
                    .column(i)
                    .search(this.value)
                    .draw();
            }
        });
    });
    var table = $('.filterTable').DataTable({
        orderCellsTop: true,
        fixedHeader: true
    });

    //clear filters
    $(".clearFilters").click(function (e) {
        $('.filterable .filters input').val('');
        table
            .search('')
            .columns().search('')
            .draw();
    });    
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

// funcion para cargar el select de codigos de barra
function reloadBarCodeData(modelToSearch) {    
    $.ajax({        
        url: "/loadBarCode/"+modelToSearch,
        type: "GET",
        dataType: "json",
        success: function (result) {
            var setOptions = {
                enableFiltering: true,
                enableCaseInsensitiveFiltering: true,
                includeSelectAllOption: true
            };
            
            $('#barCodeSelect').multiselect();

            var options = [];
            for (value in result) {
                if(modelToSearch == "Crossing" || modelToSearch == "Seed" )
                {
                    console.log(result);
                    var values = { label: result[value].codeCross +"-"+result[value].numRepeat , value: result[value].id };
                }
                else
                {
                    var values = { label: result[value].code, value: result[value].id };
                }                
                options.push(values);
            }
            $('#barCodeSelect').multiselect('dataprovider', options);
            $('#barCodeSelect').multiselect('setOptions', setOptions);
            $('#barCodeSelect').multiselect('rebuild');
        },
        error: function (err) {
            console.log(err);
        }
    });
}