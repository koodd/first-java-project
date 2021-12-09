<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../base/managerbase.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 등록</title>
	
	<link rel="stylesheet" href="../css/productreg.css">
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript"><!--상품등록 성공시 알러트-->
				var result = "${result}";
				if(result==1){
					alert("상품 등록에 성공하였습니다.");
				}
				
				/* p_num, p_term, pc_no, p_price 수량,유통기한,물품카테고리,가격 숫자만 들어갈 수 있고, 마이너스일시 0으로 바꿈.
				물품 카테고리 넘버는 1~4만 가능
				*//* 23 */
				$(function(){
					
					$("#p_num").keyup(function(){
						var p_num1 = $("#p_num").val();
						var p_num2 = Number(p_num1);
						if(p_num2<1){
							$("#p_num").val(1);
						}
					});
					
					$("#p_num").click(function(){
						var p_num1 = $("#p_num").val();
						var p_num2 = Number(p_num1);
						if(p_num2<1){
							$("#p_num").val(1);
						}
					});
					
					$("#pc_no").keyup(function(){
						var pc_no1 = $("#pc_no").val();
						var pc_no2 = Number(pc_no1);
						if(pc_no2<1){
							$("#pc_no").val(1);
						}
					});
					
					$("#pc_no").keyup(function(){
						var pc_no1 = $("#pc_no").val();
						var pc_no2 = Number(pc_no1);
						if(pc_no2>4){
							$("#pc_no").val(4);
						}
					});
					
					$("#pc_no").click(function(){
						var pc_no1 = $("#pc_no").val();
						var pc_no2 = Number(pc_no1);
						if(pc_no2>4){
							$("#pc_no").val(4);
						}
					});
					
					$("#pc_no").click(function(){
						var pc_no1 = $("#pc_no").val();
						var pc_no2 = Number(pc_no1);
						if(pc_no2<1){
							$("#pc_no").val(1);
						}
					});
					
					$("#p_price").keyup(function(){
						var p_price1 = $("#p_price").val();
						var p_price2 = Number(p_price1);
						if(p_price2<1){
							$("#p_price").val(1);
						}
					});
					
					$("#p_price").click(function(){
						var p_price1 = $("#p_price").val();
						var p_price2 = Number(p_price1);
						if(p_price2<1){
							$("#p_price").val(1);
						}
					});
	
					/* 처음 시작시, 유통기한 오늘 날짜로 자동 세팅 */
					window.onload = function() {
						today = new Date();
						today = today.toISOString().slice(0, 10);
						$("#p_term").val(today);
					}
					
				});
	</script>
</head>
<body>
	<div id="title1">

		<h2>상품 등록</h2>

	</div>
	<div id="title2">
		<form action="do_man_product_reg" method="post"
			enctype="multipart/form-data">
			<label><span id="font1">이름:</span></label> <input class="reg1"
				type="text" id="p_name" name="p_name"><br> <label><span
				id="font1">사용방법:</span></label> <input class="reg1" type="text" id="p_way"
				name="p_way"><br> <label><span id="font1">수량:</span></label>
			<input class="reg1" type="number" id="p_num" name="p_num" value="1"><br>
			<label><span id="font1">유통기한:</span></label> <input class="reg1"
				type="date" id="p_term" name="p_term"><br> <label><span
				id="font1">물품 카테고리:</span></label> <input class="reg1" type="number"
				id="pc_no" name="pc_no" value="1"><br> <label><span
				id="font1">물품가격:</span></label> <input class="reg1" type="number"
				id="p_price" name="p_price" value="1"><br> <label><span
				id="font1">물품정보:</span></label> <input class="reg1" type="text" id="p_info"
				name="p_info"><br> <label><span id="font1">물품사진:</span></label>
			<input class="reg1" type="file" id="file" name="file"><br>
			<label><span id="font1">물품기타사진1:</span></label> <input class="reg1"
				type="file" id="files1" name="files1"><br> <label><span
				id="font1">물품기타사진2:</span></label> <input class="reg1" type="file"
				id="files2" name="files2"><br> <label><span
				id="font1">물품기타사진3:</span></label> <input class="reg1" type="file"
				id="files3" name="files3"><br> <label><span
				id="font1">물품기타사진4:</span></label> <input class="reg1" type="file"
				id="files4" name="files4"><br> <label><span
				id="font1">물품기타사진5:</span></label> <input class="reg1" type="file"
				id="files5" name="files5"><br>
			<button type="submit" id="btn1">등록</button>
			<button type="button" id="btn2"
				onclick="location.href='./man_product_list'">취소</button>
		</form>
	</div>
</body>
</html>