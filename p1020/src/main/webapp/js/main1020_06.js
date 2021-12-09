/**
 * main1020_06.js
 * 팝업 객체
 */
function commentBtn(){
	var cid = document.getElementById("id").value;
	var cContent = document.getElementById("content").value;
	console.log(cid);
	console.log(cContent);
	
	var chtml="";
	chtml = chtml + "<tr>";
	chtml += "<td>"+cid+"</td>";
	chtml += "<td>"+cContent+"</td>";
	chtml += "</tr>";
	console.log(chtml);
	// innerHTML : 기존의 html을 모두 삭제한후 추가
	// appendChild
	//var c = document.querySelector("#ctext");
	var c = document.getElementById("ctext");
	c.innerHTML += chtml;
	document.getElementById("id").value="";
	document.getElementById("content").value="";
	alert("댓글이 저장되었습니다.");
	
}
