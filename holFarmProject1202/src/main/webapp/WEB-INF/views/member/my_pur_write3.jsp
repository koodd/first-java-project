
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
	
		<title>교환 신청</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
		<link rel="stylesheet" href="../fonts/icomoon/style.css">
		<link rel="stylesheet" href="../css/magnific-popup.css">
		<link rel="stylesheet" href="../css/jquery-ui.css">
		<link rel="stylesheet" href="../css/owl.carousel.min.css">
		<link rel="stylesheet" href="../css/owl.theme.default.min.css">
		<link rel="stylesheet" href="../css/aos.css">
		<link rel="stylesheet" href="../css/style.css">
		
		<link rel="stylesheet" href="../css/bootstrap.min.css">
		<link rel="stylesheet" href="../css/footer.css">
	
		<link rel="stylesheet" href="../css/purchaselist.css">
		<link rel="stylesheet" href="../css/productreg.css">
		<link rel="stylesheet" href="../css/my_pur_write.css">
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script type="text/javascript">
		
			$(function(){
				
			});
			
		</script>
	</head>
	<body>
	
		<%@ include file="../base/myPage.jsp" %>
	
		<div class="site-wrap">
			<div class="bg-light py-3">
			</div>
	
			<div class="site-section" id="section1">
				<div class="container">
				<hr>
				<div id="title1">상품 교환 신청</div>
				<hr>

		<div id="title2">
			<form action="do_my_pur_write3" method="post" enctype="multipart/form-data">
			<div id="py_no1box">
				<input class="reg1" type="hidden" id="hidden" name="py_no" value="${py_no}"><br>
			
			</div>
			<div id="creason1box">
			
				<label><span id="font1">사유:</span></label>
				<textarea class="reg1" id="c_reason" name="c_reason"></textarea><br>
				
				
				
			</div>
			
			<div id="cpic1box">
				<label><span id="font1">사유사진: </span></label>
				<input class="reg1" type="file" id="file" name="file"><br>
			
			</div>
			<div id="cbtn1box">
			
				<button type="submit" id="btn1"> 등록 </button>
				<button type="button" id="btn2" onclick="location.href='./my_pur_list'"> 취소 </button>
			
			</div>

			
			</form>
		
		
		</div>
					
					
				</div>
			</div>
		</div>
	
		<script src="../js/jquery-3.3.1.min.js"></script>
		<script src="../js/jquery-ui.js"></script>
		<script src="../js/popper.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script src="../js/owl.carousel.min.js"></script>
		<script src="../js/jquery.magnific-popup.min.js"></script>
		<script src="../js/aos.js"></script>
		<script src="../js/main.js"></script>
	
		<%@include file="../base/footer.jsp"%>
	
	</body>
</html>