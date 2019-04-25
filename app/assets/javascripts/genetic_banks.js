//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('turbolinks:render', function() {    
    return initWiceGrid();   
});


$(document).on('turbolinks:load', function(){        
    // $(".new-geneticBank").hide();

    //cargar los elementos a la list box para imprimir codigo de barras
    $('#geneticBank').multiselect({
        buttonWidth: '300px',
        includeSelectAllOption: true,
        enableFiltering: true
    });                   
});

// $(document).on("ajax:success","form#genetic_bank-form",function(ev,data)
// {              
//     $("#genetic_bank-form").empty();
//     $(".message").append("<h2 class='alert alert-success'>"+data["message"]+"</h2>");
//     $(".new-geneticBank").show();
// });

// $(document).on("ajax:error","form#genetic_bank-form",function(ev,data)
// {  
//     $("#codeId").empty(); 
//     $("#locationId").empty(); 
//     $("#statusId").empty(); 
//     //remove old instances of the .has-error class
//     $(".form-group").removeClass("has-error");

//     //aqui se agregarán,si es el caso, las demas validaciones
//     keys = data.responseJSON;    
//     for(key in keys)
//     {        
//         if(data.responseJSON[""+key+""] != null)
//         {        
//             $("#"+key+"Id").append('<div class="field_with_errors">'+data.responseJSON[""+key+""]+'</div>');
//             $("#"+key+"Id").closest(".form-group").addClass("has-error");
//         }    
//     }   
// });


