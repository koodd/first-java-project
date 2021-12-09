/**
 * main1020_03.js
 * 날짜 정보 객체
 */
// 대통령 선거일 2022.3.9 총 몇일 몇시간 남았는지 출력하세요.
var today = new Date();
var pday = new Date(2022,2,9);
var dday = pday.getTime()-today.getTime();

var nowDate = Math.floor(dday/(24*60*60*1000));
var nowhour = Math.ceil((dday%(24*60*60*1000))/(60*60*1000));
document.write("대통령 선거일까지 남은 일시<br>");
document.write(nowDate+"일 "+nowhour+"시간 남았습니다.<br>");