/**
 * 
 */
$(function(){
	// 이미지 2개를 가져와서
	// 버튼 2개 : 전체 검정테두리 3적용, 각각 red,pink 색상 3적용
	var i=1;
	$("#bBtn").click(function(){
		i++;
		$("#d01").css("border-width",i);
	});
	
	//전체변경
	$("#colorBtn").click(function(){
		$(".c01").addClass("color1");
	});
	
	$("#colorBtn2").click(function(){
		var i=2;
		$(".c01").each(function(){
			$(this).addClass("color"+i);
			i++;
		});
	})
	
	
	
	
});