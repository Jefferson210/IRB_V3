//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/
//

$( document ).on('turbolinks:load', function() {
    $("#one_offspring_id").on('change', function() {
        if(  $("#one_offspring_id").val() != "" ){
            var id = $( "#one_offspring_id option:selected" ).val();
            //            console.log(id)
            $.ajax({
                url: "/selectColorTwoOffspring/"+ id,
                type: "GET",
                dataType: "json",
                //            data : {id: 1},
                success: function (result) {
                    console.log(result)
                    if(result == null){
                        $("#colorId").val("")
                    }else{
                        $("#colorId").val(result.colorName)                        
                    }
                },
                error: function (err){
                    //alert("Algo salio mal");
                    //console.log(err);
                }
            });
        }else{
            //console.log("Select vacio")
            $("#colorId").val("");
        }
    });
})












