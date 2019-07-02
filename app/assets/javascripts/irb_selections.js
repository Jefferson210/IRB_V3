//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

function irbValidations(action) {
    $("#three_offspring_id").on('change', function () {
        //        if(  $("#three_offspring_id").val() != "" ){
        if ($("#three_offspring_id").val() != "") {
            var id = $("#three_offspring_id option:selected").val();
            //            console.log(id)
            $.ajax({
                url: "/selectColorIrbSelections/" + id,
                type: "GET",
                dataType: "json",
                //            data : {id: 1},
                success: function (result) {
                    if (result == null) {
                        $("#colorId").val("")
                    } else {
                        $("#colorId").val(result.color)
                    }
                },
                error: function (err) {
                    //alert("Algo salio mal");
                    //console.log(err);
                }
            });
        } else {
            //console.log("Select vacio")
            $("#colorId").val("");
        }
    });

    array = [
        "2012|A",
        "2013|B",
        "2014|C",
        "2015|D",
        "2016|E",
        "2017|F",
        "2018|G",
        "2019|H",
        "2020|I",
        "2021|J",
        "2022|K",
        "2023|L",
        "2024|M",
        "2025|N",
        "2026|O",
        "2027|P",
        "2028|Q",
        "2029|R",
        "2030|S",
        "2031|T",
        "2032|U",
        "2033|V",
        "2034|W",
        "2035|X",
        "2036|Y",
        "2037|Z"
    ]

    function ConvertToYear(letter) {

        for (var item in array) {

            El_Searched = array[item].split('|');
            yearSearched = El_Searched[0];
            letterSearched = El_Searched[1];

            if (letter == letterSearched) {

                return yearSearched
                break;

            }

        }

    }
    $("#three_offspring_id").change(function () {

        threeOffspring = $("#three_offspring_id option:selected").html();


        if (threeOffspring != "Select") {
            arraythreeOffspring = threeOffspring.split('-');
            letter = arraythreeOffspring[0].substring(0, 1);
            cross = arraythreeOffspring[0].substring(1, arraythreeOffspring[0].length);
            individual = arraythreeOffspring[1];

            year = ConvertToYear(letter).substring(2, 4);


            cod = "IRB-" + year + "-" + cross + "-" + individual

            $("#irb_selection_code").val(cod);

        }
        else {


            $("#irb_selection_code").val("");
        }
    })
}