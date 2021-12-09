/**
 * main1020_01.js
 * 날짜 정보 객체
 */
var today = new Date(); //현재날짜
var xmas = new Date(2021,11,25); //이번 크리스마스
document.write("시간 : "+xmas.getTime()+"<br>");
var dDay = xmas.getTime()-today.getTime();
document.write("크리스마스까지 남은 일 : "+Math.floor(dDay/(24*60*60*1000))+"일"+"<br>");
//document.write(Math.floor(dDay%(24*60*60*1000)/(60*60*1000))+"시");
//document.write(Math.floor((dDay%(60*60*1000))/(60*1000))+"분");
//document.write(((dDay%(60*60*1000))%(60*1000))/(1000)+"초"+"<br>");

// 오늘날짜 2021/10/20   
//Date d = new Date();
var nowMonth = today.getMonth();
var nowDate = today.getDate();
var nowDay = today.getDay();
// 10월 21일 수요일-3
var korNowDay;
switch(nowDay){
	case 0:
	korNowDay = "일요일";
	break;
	case 1:
	korNowDay = "월요일";
	break;
	case 2:
	korNowDay = "화요일";
	break;
	case 3:
	korNowDay = "수요일";
	break;
	case 4:
	korNowDay = "목요일";
	break;
	case 5:
	korNowDay = "금요일";
	break;
	case 6:
	korNowDay = "토요일";
	break;
}

document.write((nowMonth+1)+"월 "+nowDate+"일 "+korNowDay+"<br>");


document.write("월 : "+today.getMonth()+"<br>");
document.write("일 : "+today.getDate()+"<br>");
document.write("요일 : "+today.getDay()+"<br>");
document.write("표기날짜 : "+today.getDay()+"<br>");
//0-일요일 1-월요일 2-화요일 3-수요일 4-목요일 5-금요일 6-토요일 

var endDay = new Date(2021,11,6);
document.write("월 : "+endDay.getMonth()+"<br>");
document.write("일 : "+endDay.getDate()+"<br>");
document.write("요일 : "+endDay.getDay()+"<br>");
