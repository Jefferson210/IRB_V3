//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/


$( document ).on('turbolinks:load', function() {
    $("#seed_id").on('change', function() {

        if($("#seed_id").val() != ""){
            var id = $( "#seed_id option:selected" ).val();
            $.ajax({
                url: "/getSeed/"+ id,
                type: "GET",
                dataType: "json",
                success: function (result) {
                    //                    console.log(result)
                    $("#codeCross").val(result.codeCross)
                    $("#codeCrossNumRepeat").val(result.codeCrossName)
                },
                error: function (err){
                    //                    alert("Algo salio mal");
                    //                    console.log(err);
                }
            });  
        }else{
            $("#codeCross").val('')
            $("#codeCrossNumRepeat").val('')        
        }

        //Funcion para adquirir el total de numSeeds por NumRepeat al cambiar el valor del select "seed_id"
        if($("#seed_id").val() != ""){
            $.ajax({
                url: "/numGerminationsNumRepeat/",
                type: "GET",
                dataType: "json",
                success: function (result) {
                    if($("#numGerminations").val() != ''){
                        var val2 = 0;
                        var numRepeat = $( "#seed_id option:selected" ).text();
                        var val1 = $("#numGerminations").val();
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

        //Funcion para adquirir el total de numSeeds por codeCross al cambiar el valor del select "seed_id"
        if($("#seed_id").val() != ""){
            $.ajax({
                url: "/numGerminationsCodeCross/",
                type: "GET",
                dataType: "json",
                success: function (result) {
                    console.log(result)
                    if($("#numGerminations").val() != ''){
                        var val2 = 0;
                        var numRepeat = $( "#codeCross" ).val();
                        var val1 = $("#numGerminations").val();
                        var missingSeed=0;
                        //para ver las seeds restantes

                        if(result[0][numRepeat] == undefined ){
                            val2 = 0;
                        }else{
                            val2 = result[0][numRepeat]
                        }
                        var sum = parseInt(val1) + parseInt(val2)
                        $("#totalCode").val(sum)   
                    }  
                    //var numRepeat = $( "#codeCross" ).val();
                    var numRepeat = $( "#codeCrossNumRepeat" ).val();
                    var code = $( "#codeCross" ).val();
                    //nos aeguramos que se llenen los campos codeCross y codeCrossNumRepeat
                    if(numRepeat == "" || code == ""){
                        if($("#seed_id").val() != ""){
                            var id = $( "#seed_id option:selected" ).val();
                            $.ajax({
                                url: "/getSeed/"+ id,
                                type: "GET",
                                dataType: "json",
                                success: function (result) {
                                    //console.log(result)
                                    $("#codeCross").val(result.codeCross)
                                    $("#codeCrossNumRepeat").val(result.codeCrossName)
                                },
                                error: function (err){
                                    //                    alert("Algo salio mal");
                                    //                    console.log(err);
                                }
                            });  
                        }else{
                            $("#codeCross").val('')
                            $("#codeCrossNumRepeat").val('')        
                        }

                    }
                    console.log("codeNumRepeat "+numRepeat);
                    console.log("code "+code);
                    //if(result[1][numRepeat] == undefined){
                    if(result[0][numRepeat] == undefined){
                        console.log("no hay missingSeed")
                        //$("#missingSeedId").val(result[2][numRepeat]);
                        $("#missingSeedId").val(result[3][numRepeat]);
                    }
                    else{                                               
                        //missingSeed = parseInt(result[1][numRepeat]) - parseInt(result[0][numRepeat])                  
                        missingSeed = parseInt(result[3][numRepeat]) - parseInt(result[0][numRepeat])                 
                        $("#missingSeedId").val(missingSeed); 
                    } 
                },
                error: function (err){
                    //                    alert("Algo salio mal");
                    //                    console.log(err);
                }
            });  
        }

    });
})


function germinationsTotal() {
    if($("#seed_id").val() != ""){
        //Funcion para adquirir el total de numSeeds por NumRepeat al cambiar el valor del input "numSeeds"
        $.ajax({
            url: "/numGerminationsNumRepeat/",
            type: "GET",
            dataType: "json",
            success: function (result) {
                if($("#numGerminations").val() != ''){
                    var val2 = 0;
                    var numRepeat = $( "#seed_id option:selected" ).text();
                    var val1 = $("#numGerminations").val();
                    if(result[numRepeat] == undefined ){
                        val2 = 0;
                    }else{
                        val2 = result[numRepeat]
                    }
                    var sum = parseInt(val1) + parseInt(val2)
                    $("#totalNumRepeat").val(sum)
                }
            },
            error: function (err){
                //                alert("Algo salio mal");
                //                console.log(err);
            }
        }); 
        //Funcion para adquirir el total de numSeeds por codeCross al cambiar el valor del input "numSeeds"
        $.ajax({
            url: "/numGerminationsCodeCross/",
            type: "GET",
            dataType: "json",
            success: function (result) {
                if($("#numGerminations").val() != ''){
                    var val2 = 0;
                    var numRepeat = $( "#codeCross" ).val();
                    var val1 = $("#numGerminations").val();
                    var missingSeed;
                    if(result[0][numRepeat] == undefined ){
                        val2 = 0;
                    }else{
                        val2 = result[0][numRepeat]
                    }
                    var sum = parseInt(val1) + parseInt(val2)
                    $("#totalCode").val(sum)  
                }
            },
            error: function (err){
                //                alert("Algo salio mal");
                //                console.log(err);
            }
        });   
    }
}



