//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on('turbolinks:load', function () {
    getResulsGerminations();
})

function germinationsValidations(action) {
    $("#seed_id").on('change', function () {
        if ($("#seed_id").val() != "") {
            var id = $("#seed_id option:selected").val();
            $.ajax({
                url: "/getSeed/" + id,
                type: "GET",
                dataType: "json",
                success: function (result) {                    
                    $("#codeCross").val(result.codeCross)
                    $("#codeCrossNumRepeat").val(result.codeCrossName)
                },
                error: function (err) {                    
                }
            });
        } else {
            $("#codeCross").val('')
            $("#codeCrossNumRepeat").val('')
        }

        //Funcion para adquirir el total de numSeeds por NumRepeat al cambiar el valor del select "seed_id"
        if ($("#seed_id").val() != "") {
            $.ajax({
                url: "/numGerminationsNumRepeat/",
                type: "GET",
                dataType: "json",
                success: function (result) {
                    if ($("#numGerminations").val() != '') {
                        var val2 = 0;
                        var numRepeat = $("#seed_id option:selected").text();
                        var val1 = $("#numGerminations").val();
                        if (result[numRepeat] == undefined) {
                            val2 = 0;
                        } else {
                            val2 = result[numRepeat]
                        }
                        var sum = parseInt(val1) + parseInt(val2)
                        $("#totalNumRepeat").val(sum)
                    }
                },
                error: function (err) {                    
                }
            });
        }

        //Funcion para adquirir el total de numSeeds por codeCross al cambiar el valor del select "seed_id"
        if ($("#seed_id").val() != "") {
            $.ajax({
                url: "/numGerminationsCodeCross/",
                type: "GET",
                dataType: "json",
                success: function (result) {
                    console.log(result)
                    if ($("#numGerminations").val() != '') {
                        var val2 = 0;
                        var numRepeat = $("#codeCross").val();
                        var val1 = $("#numGerminations").val();
                        var missingSeed = 0;
                        //para ver las seeds restantes

                        if (result[0][numRepeat] == undefined) {
                            val2 = 0;
                        } else {
                            val2 = result[0][numRepeat]
                        }
                        var sum = parseInt(val1) + parseInt(val2)
                        $("#totalCode").val(sum)
                    }
                    //var numRepeat = $( "#codeCross" ).val();
                    var numRepeat = $("#codeCrossNumRepeat").val();
                    var code = $("#codeCross").val();
                    //nos aeguramos que se llenen los campos codeCross y codeCrossNumRepeat
                    if (numRepeat == "" || code == "") {
                        if ($("#seed_id").val() != "") {
                            var id = $("#seed_id option:selected").val();
                            $.ajax({
                                url: "/getSeed/" + id,
                                type: "GET",
                                dataType: "json",
                                success: function (result) {                                    
                                    $("#codeCross").val(result.codeCross)
                                    $("#codeCrossNumRepeat").val(result.codeCrossName)
                                },
                                error: function (err) {                                    
                                }
                            });
                        } else {
                            $("#codeCross").val('')
                            $("#codeCrossNumRepeat").val('')
                        }
                    }                    
                    if (result[0][numRepeat] == undefined) {                                                
                        $("#missingSeedId").val(result[3][numRepeat]);
                    }
                    else {                                     
                        missingSeed = parseInt(result[3][numRepeat]) - parseInt(result[0][numRepeat])
                        $("#missingSeedId").val(missingSeed);
                    }
                },
                error: function (err) {                    
                }
            });
        }

    });
}
function germinationsTotal() {
    if ($("#seed_id").val() != "") {
        //Funcion para adquirir el total de numSeeds por NumRepeat al cambiar el valor del input "numSeeds"
        $.ajax({
            url: "/numGerminationsNumRepeat/",
            type: "GET",
            dataType: "json",
            success: function (result) {
                if ($("#numGerminations").val() != '') {
                    var val2 = 0;
                    var numRepeat = $("#seed_id option:selected").text();
                    var val1 = $("#numGerminations").val();
                    if (result[numRepeat] == undefined) {
                        val2 = 0;
                    } else {
                        val2 = result[numRepeat]
                    }
                    var sum = parseInt(val1) + parseInt(val2)
                    $("#totalNumRepeat").val(sum)
                }
            },
            error: function (err) {
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
                if ($("#numGerminations").val() != '') {
                    var val2 = 0;
                    var numRepeat = $("#codeCross").val();
                    var val1 = $("#numGerminations").val();
                    var missingSeed;
                    if (result[0][numRepeat] == undefined) {
                        val2 = 0;
                    } else {
                        val2 = result[0][numRepeat]
                    }
                    var sum = parseInt(val1) + parseInt(val2)
                    $("#totalCode").val(sum)
                }
            },
            error: function (err) {
                //                alert("Algo salio mal");
                //                console.log(err);
            }
        });
    }
}

function getResulsGerminations() {
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        var target = $(e.target).attr("href")

        if (target == "#resultsGerminations") {  
            console.log(target);          
            $.ajax({
                url: "/sumByCodeCrossGerminations",
                type: "GET",
                dataType: "json",
                success: function (result) {                    
                    $("#resultsGerminations tbody tr").remove();                    
                    for(value in result[0])
                    {                        
                        for(value2 in result[1])
                        {
                            if(value == value2)
                            {
                                $percent = (result[0][value] * 100) /  result[1][value2];
                                $("#resultsGerminations table tbody").append("<tr><td>"+value+"</td><td>"+result[0][value]+"</td><td>"+$percent+" %</td></tr>");
                            }
                        }
                    }                                        
                },
                error: function (err) {
                    console.log(err);                    
                }
            });
        }
    });
};

