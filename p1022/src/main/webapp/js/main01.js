/**
 * 
 */
$(function(){
    $("#colorBtn").click(function(){
	     $(".c01").toggleClass("color1");
    });


    //각각 색상변경 - class : color1, color2, color3
    $("#colorBtn2").click(function(){
	     var i=1;
         $(".c01").each(function(){
		    $(this).addClass("color"+i);
            i++;
	     });
    });



});