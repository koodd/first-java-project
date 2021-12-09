/**
 * main05.js 
 */
// 
//0*10+1<=num*10+1<1*10+1 -> 1<=num<11
// 1<=x<11  1.00000000 ~ 10.9999999999
// Math.floor(x) = 0,1,2,3,4,5,6,7,8,9
var resultNum = Math.floor(Math.random()*10);

while(true){
	var inputNum = prompt("0-9까지 숫자를 입력하세요");
	inputNum=Number(inputNum);
	if(resultNum==inputNum){
	   alert("빙고입니다.\n 랜덤숫자:"+resultNum+",입력숫자:"+inputNum);
       break;
	}else if(resultNum>inputNum){
	   alert("입력한 숫자보다 더 큰수를 입력하세요.\n 입력숫자:"+inputNum);
	}else{
	   alert("입력한 숫자보다 더 작은 수를 입력하세요.\n 입력숫자:"+inputNum);
		
	}
}






//location.reload();



