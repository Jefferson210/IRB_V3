//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('page:load ready', function() {
    return initWiceGrid();    
});

$(document).on('turbolinks:render', function() {
    return initWiceGrid();    
});

$(document).on('turbolinks:load', function(){

    $('#geneticBank').multiselect({
        buttonWidth: '300px',
        includeSelectAllOption: true,
        enableFiltering: true
    });    
});

