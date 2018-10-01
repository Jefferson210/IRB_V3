//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/
//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

$( document ).on('turbolinks:load', function() {

    $("#crossing_id").on('change', function() {
        //Funcion para obtener los codeCross con su NumRepeat
        if(  $("#crossing_id").val() != "" ){
            var codeCrossName = $( "#crossing_id option:selected" ).text();
            $("#codeCrossName").val(codeCrossName)
        }

        //Funcion para obtener los codeCross y numSeeds
        if($("#crossing_id").val() != ""){
            var id = $( "#crossing_id option:selected" ).val();
            $.ajax({
                url: "/getCrossing/"+ id,
                type: "GET",
                dataType: "json",
                success: function (result) {

                    $("#codeCross").val(result[1].codeCross)

                    if(result[1].numSeeds == null){
                        $("#numSeeds").val(0)
                    }else{
                        $("#numSeeds").val(result[1].numSeeds) 
                    }  

                    var val2 = 0;
                    var numRepeat = result[1].codeCross                  
                    var val1 = result[1].numSeeds
                    if(result[0][numRepeat] == undefined  ){
                        val2 = 0;
                    }else{
                        val2 = result[0][numRepeat]
                    }
                    var sum = parseInt(val1) + parseInt(val2)
                    $("#totalCode").val(sum)
                },
                error: function (err){
                }
            });  
        }

        //Funcion para adquirir el total de numSeeds por NumRepeat al cambiar el valor del select "crossing_id"
        if($("#crossing_id").val() != ""){
            $.ajax({
                url: "/numSeedsNumRepeat/",
                type: "GET",
                dataType: "json",
                success: function (result) {
                    //                    console.log(result)
                    if($("#numSeeds").val() != ''){
                        var val2 = 0;
                        var numRepeat = $( "#crossing_id option:selected" ).text();
                        var val1 = $("#numSeeds").val();
                        if(result[numRepeat] == undefined  ){
                            val2 = 0;
                        }else{
                            val2 = result[numRepeat]
                        }
                        var sum = parseInt(val1) + parseInt(val2)
                        $("#totalNumRepeat").val(sum)
                    }

                },
                error: function (err){
                    //                    alert("Algo salio mal");
                    //                    console.log(err);
                }
            });  
        }
    });
    $('#seeds').multiselect({
        buttonWidth: '300px',
        includeSelectAllOption: true,
        enableFiltering: true
    });    
})






