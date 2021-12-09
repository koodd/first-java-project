<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>배송지 입력</title>
	<link rel="stylesheet" href="../css/delivery1.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- 29 -->
	<script type="text/javascript">
		
		$(function(){
			
			$("#close1").click(function(){
				
				var zipcode1 = $("#zipcode").val();
				var addr1 = $("#u_addr1").val();
				var addr2 = $("#u_addr2").val();
				
				if(zipcode1=="" || addr1=="" || addr2 ==""){
					alert("배송지를 입력해 주세요!");
				}else{
					
					var zipcode1 = $("#zipcode").val();
					var addr1 = $("#u_addr1").val();
					var addr2 = $("#u_addr2").val();
					$("#zipcode", opener.document).val(zipcode1);
					$("#u_addr1", opener.document).val(addr1);
					$("#u_addr2", opener.document).val(addr2);
					$("#checkout1", opener.document).click();
					window.close();
				}
			});
			
		});
	
	
		/* 배송지 주소 찾기 */
	    function zipSearch(){/* 29 */
	        new daum.Postcode({
	            oncomplete: function(data) {
	                $("#zipcode").val(data.zonecode);
	                $("#zipcode").attr("readonly",true);
	                $("#u_addr1").val(data.address);
	                $("#u_addr1").attr("readonly",true);
	                $("#u_addr2").focus();
	            }
	      }).open(); 
	    }
	
	</script>
	
</head>
<body>
	<h2>배송지 입력</h2><br>
	<div id="box1">
		<input type="text" id="zipcode" name="zipcode" />&nbsp;
		<a href="#" onclick="zipSearch()" id="zipatag"><span id="searchpostcode">우편번호 찾기</span></a><br>
		<p><input type="text" id="u_addr1" name="u_addr" /></p>
		<p>
		<input type="text" id="u_addr2" name="u_addr" placeholder="배송 관련 상세주소" /></p>
		<button type="button" id="close1">주소 전달</button><br>
	</div>
</body>
</html>