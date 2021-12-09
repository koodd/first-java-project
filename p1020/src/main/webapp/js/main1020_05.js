/**
 * main1020_05.js
 * 문자 객체
 */
// 객체 : 기능->함수,속성->변수 
var tv = new Object();
tv.color = "white";
//var color ="white";
tv.price = 300000;
tv.info = function(){
   document.write("tv색상 : "+this.color+"<br>");	
   document.write("tv가격 : "+this.price+"<br>");	
}
tv.info();
document.write("-------------------------<br>");
var tv2 = {
	color:"black",price:500000,
	info:function(){
		document.write("tv2색상 : "+this.color+"<br>");
		document.write("tv2가격 : "+this.price+"<br>");
	}
};
tv2.info();

//var today = new Date();




var arr_1 = ["사과","배","복숭아","감"];
for(var i in arr_1){
	console.log(arr_1[i]);
}





//var tel1 = prompt("전화번호를 입력하세요.예)010-1234-1234");
//var tel1 =prompt("전화번호를 입력하세요.예)010-1234-1234");;
//var telResult = tel1.substring(0,tel1.length-4)+"****";
//console.log(typeof telResult);
//console.log(tel1);
//console.log(telResult);
//alert(telResult);
//document.getElementById("tel_txt").innerText = telResult;
//010-1234-****


