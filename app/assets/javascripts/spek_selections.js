//# Place all the behaviors and hooks related to the matching controller here.
//# You can use CoffeeScript in this file: http://coffeescript.org/
//# All this logic will automatically be available in application.js.
$( document ).on('turbolinks:load', function() {
    //    Configuracion para el modal de codigos de barra
    $('#spekSelection').multiselect({
        buttonWidth: '300px',
        includeSelectAllOption: true,
        enableFiltering: true
    });  
})