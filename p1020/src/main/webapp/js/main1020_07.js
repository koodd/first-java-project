/**
 * main1020_07.js
 * 함수
 */
var i=0;
  function changeColor(){
	  var color=["blue","yellow","green","red"];
	  if(i>=color.length){
		  i=0;
	  }
	  var ch_d01 = document.getElementById("d01");
	  ch_d01.style.backgroundColor = color[i];
	  i++;
  }

  function changeColor2(){
	  var ch_d01 = document.getElementById("d01");
      ch_d01.classList.toggle("on");
      //ch_d01.className="on";
  }
  function changeColor3(){
	  var ch_d01 = document.getElementById("d01");
      ch_d01.className="off";
  }








//변수 count를 설정해서
// 함수1호출을 클릭하면 +2씩 증가
// 함수2호출을 클릭하면 -1씩 감소

// 버튼이 클릭될때마다
// table에 정보를 출력하시오.
