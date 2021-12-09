/**
 * main06.js 
 */
// 
// 입력받은 값 : 5 4 7 2 1 3 4
// 이 가운데 가장큰수를 출력하시오.
// 7출력
var input = prompt("숫자7자리를 입력하세요!");
if(input.length==7){
 var maxNum = Math.max(input.charAt(0),input.charAt(1),input.charAt(2),input.charAt(3),input.charAt(4),input.charAt(5),input.charAt(6));
 alert("입력한 최대값 : "+maxNum+",입력한 값 :"+input);
}else{
  alert("숫자 7자리까지 입력하세요");
  location.reload();	
}


//alert("입력한 숫자 길이 : "+input.length);
//var result = Math.max(10,5,4,8);
//alert(result);