//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

function threeOffspringsValidations(action) {
    $("#two_offspring_id").on('change',function(){
        if ($("#two_offspring_id").val() != ""){
            var id = $("#two_offspring_id option:selected").val();
            console.log(id)
            $.ajax({
                url: '/selectColorThreeOffspring/'+ id,
                type: 'GET',
                dataType: 'json',
                success: function(result){
                    // console.log(result)
                    if(result == null){
                        $("#colorId").val("")
                    }else{
                        $("#colorId").val(result.color)                        
                    }
                },
                error: function(err){
                    alert("Algo salio mal");
                    console.log(err);
                }
            })
        }else{
            //console.log("Select vacio")
            $("#colorId").val("");
        }
    });
}