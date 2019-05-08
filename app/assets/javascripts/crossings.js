//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/
function crossingsValidations(action) { 
  $("#codeCrossId").change(function () {
    var codeCross = $("#codeCrossId").val();
    $.ajax({
      url: "/codeCrossParents/" + codeCross,
      type: "GET",
      dataType: "json",
      success: function (result) {
        console.log(result)
        if (result != null) {
          var father_id = 0;
          var mother_id = 0;
          father_id = result.father_id;
          mother_id = result.mother_id;

          // seleccionamos en el select el padre/madre con value igual al id padre/madre
          $("#father_id").val(father_id)
          $("#mother_id").val(mother_id)

          //inhabilitamos el resto de opciones del select father_id
          $('#father_id > option').each(function () {
            if ($(this).val() != father_id) {
              $(this).attr("disabled", "disabled")
            }
          });
          //inhabilitamos el resto de opciones del select mother_id
          $('#mother_id > option').each(function () {
            if ($(this).val() != mother_id) {
              $(this).attr("disabled", "disabled")
            }
          });
        }
      },
      error: function (err) {
      }
    });
  })

  $("#goodCrossingId").change(function () {
    var numCrossings = $("#numCrossingId").val();
    var goodCrossings = $(this).val();
    var percentaje = 0;

    if (parseInt(goodCrossings) > parseInt(numCrossings)) {
      $("#notice").html("<p class='alert alert-danger'>GoodCrossing should be less than NumCrossing</p>")
      $("#goodCrossingId").val(0);
      $("#badCrossingId").val(0);
      $("#percEffectiveId").val(0 + "%");
    } else {
      $("#notice").html("");
      var badCrossing = parseInt(numCrossings) - parseInt(goodCrossings);
      percentaje = (parseInt(goodCrossings) * 100) / parseInt(numCrossings);
      $("#badCrossingId").val(badCrossing);
      $("#percEffectiveId").val(percentaje + "%");
    }
  })

  $("#numCrossingId").change(function () {
    var numCrossings = $("#numCrossingId").val();
    var goodCrossings = $("#goodCrossingId").val();
    var percentaje = 0;
    if (goodCrossings == "") {
      goodCrossings = 0;
    }
    if (parseInt(goodCrossings) > parseInt(numCrossings)) {
      $("#notice").html("<p class='alert alert-danger'>GoodCrossing should be less than NumCrossing</p>")
      $("#goodCrossingId").val(0);
      $("#badCrossingId").val(0);
      $("#percEffectiveId").val(0 + "%");
    } else {
      $("#notice").html("");
      var badCrossing = parseInt(numCrossings) - parseInt(goodCrossings);
      percentaje = (parseInt(goodCrossings) * 100) / parseInt(numCrossings);
      $("#badCrossingId").val(badCrossing);
      $("#percEffectiveId").val(percentaje + "%");
    }
  })

  //mostrar campos segun la opcion de Effective
  $("#effectiveId").change(function () {
    var str = "";
    $("#effectiveId option:selected").each(function () {
      str += $(this).text();
      //alert(str)
      if (str == "Not" || str == "Select") {
        $(".effectiveOption").hide();
        //borramos los datos despues de editar la propiedad a Not
        $("#numCrossingId").val("");
        $("#percEffectiveId").val("");
        $("#goodCrossingId").val("");
        $("#badCrossingId").val("");
        $("#crossing_dateHarvest").val("");
        $("#crossing_weekHarvest").val("");
        $("#crossing_numSeeds").val("");
      } else {
        $(".effectiveOption").show();
      }
    });
  }).trigger("change");

  if ($("#effectiveShowPage span").text() == "not") {
    $(".effectiveOption").hide();
  }

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

  function ConvertToWord(year) {
    for (var item in array) {
      El_Searched = array[item].split('|');
      yearSearched = El_Searched[0];
      letterSearched = El_Searched[1];
      if (year == yearSearched) {
        return letterSearched
        break;
      }
    }
  }

  $("#father_id").change(function () {
    fatherChoose = $("#father_id option:selected").html()
    $("#codeCrossId").val("");
    $('#crossing_year').val("");
    $("#crossing_numOrder").val("");
    $("#mother_id").val("");
    if (fatherChoose != "Select code-trademark") {
      $('#mother_id').prop('disabled', false);
    }
    else {
      $('#mother_id').prop('disabled', true);
      $('#crossing_year').prop('disabled', true);
    }
  });

  $("#mother_id").change(function () {
    motherChoose = $("#mother_id option:selected").html();
    $("#codeCrossId").val("");
    $('#crossing_year').val("");
    $("#crossing_numOrder").val("");
    if (motherChoose != "Select code-trademark") {
      $('#crossing_year').prop('disabled', false);
    }
    else {
      $('#crossing_year').prop('disabled', true);
      $("#codeCrossId").val("");
      $('#crossing_year').val("");
      $("#crossing_numOrder").val("");
    }
  });

  $("#crossing_year").change(function () {
    letter = ConvertToWord($("#crossing_year").val());
    year = $("#crossing_year option:selected").html();
    fatherChoose = $("#father_id").val();
    motherChoose = $("#mother_id").val();
    arrayNumbers = [];

    $.ajax({
      url: "/getCrossingsByYear/" + year,
      type: "GET",
      dataType: "json",
      success: function (result) {        
        if (year != "Select" && fatherChoose != "Select code-trademark" && motherChoose != "Select code-trademark") {
          for (var item in result) {
            CodeCross = result[item].codeCross;
            FatherCross = result[item].father_id;
            MotherCross = result[item].mother_id;
            YearCross = result[item].year;
            if (fatherChoose == FatherCross && motherChoose == MotherCross && year == YearCross) {
              $("#codeCrossId").val(CodeCross);
              number = CodeCross.substring(1, CodeCross.length);
              $("#crossing_numOrder").val(number);
              return
            }
            else {
              number = CodeCross.substring(1, CodeCross.length);
              arrayNumbers.push(number);
            }
          }

          if (arrayNumbers.length > 0) {
            max = Math.max(...arrayNumbers);
            $("#codeCrossId").val(letter + (parseInt(max) + 1));
            $("#crossing_numOrder").val(max + 1);
          }
          else {
            $("#codeCrossId").val(letter + 1);
            $("#crossing_numOrder").val(1);
            $("#notice").html("");
          }
        }

      },
      error: function (err) {
      }
    });
  })

  $("#crossing_numRepeat").keyup(function () {
    codeCross = $("#codeCrossId").val();
    NumRepeat = $("#crossing_numRepeat").val();
    $.ajax({
      url: "/validRepetition/" + codeCross + "-" + NumRepeat,
      type: "GET",
      dataType: "json",
      success: function (result) {
        if (result.length > 0) {
          $("#notice").html("<p class='alert alert-danger'>The Crossing with this numRepeat already exists,please change numRepeat</p>");
          $("#crossing_numRepeat").val("");
          $("#crossing_numRepeat").focus();
        }
        else {
          $("#notice").html("");
        }
      },
      error: function (err) {
      }
    });
  });

  $(document).on('turbolinks:load', function () {
    //cargar los elementos a la list box para imprimir codigo de barras
    $('#crossings').multiselect({
      buttonWidth: '300px',
      includeSelectAllOption: true,
      enableFiltering: true
    });
  });
};