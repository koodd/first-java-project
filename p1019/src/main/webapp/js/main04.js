/**
 * main04.js 
 */
// 

//location.href="http://www.naver.com";
/*
이동할 페이지를 선택하세요.
1.네이버
2.다음
3.구글
4.지마켓
5.배달의민족
번호를 선택해주세요. prompt 입력받을것
그 페이지이동하도록 구현
(switch)

*/

var checkIn = prompt("이동할 페이지를 선택하세요! \n1.네이버\n2.다음");
checkIn = Number(checkIn);
document.write("타입 : "+ typeof checkIn);
switch(checkIn){
	case 1:
	  location.href="http://www.naver.com";
	break;
	case 2:
	  location.href="http://www.daum.net";
	break;
	default:
	  alert("번호를 잘못선택하셨습니다. 다시 선택해주세요.");
      location.reload();
	break;
}








