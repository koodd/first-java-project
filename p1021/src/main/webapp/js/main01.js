/**
 * 
 */
$(function(){
	  $("#rBtn").click(function(){
	     var arr = [0,0,0,0,0];
         for(var i=0;i<5;i++){
		    arr[i]=(Math.floor(Math.random()*10));
	     }	 
	     var win = ""+arr[0]+arr[1]+arr[2]+arr[3]+arr[4];
	     //10000~99999     
		 var chtml="";
	     chtml += '<img src="images/'+arr[0]+'.png">';
	     chtml += '<img src="images/'+arr[1]+'.png">';
	     chtml += '<img src="images/'+arr[2]+'.png">';
	     chtml += '<img src="images/'+arr[3]+'.png">';
	     chtml += '<img src="images/'+arr[4]+'.png">';
	     $("#d01").html(chtml);
	     $("span").text(win); 
	  });
});