<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<title>상품 상세</title>
		<meta charset="utf-8">
		<meta name="viewport"
			content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet"
			href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
		<link rel="stylesheet" href="../fonts/icomoon/style.css">
		<link rel="stylesheet" href="../css/magnific-popup.css">
		<link rel="stylesheet" href="../css/jquery-ui.css">
		<link rel="stylesheet" href="../css/owl.carousel.min.css">
		<link rel="stylesheet" href="../css/owl.theme.default.min.css">
		<link rel="stylesheet" href="../css/aos.css">
		<link rel="stylesheet" href="../css/style.css">
		
		<link rel="stylesheet" href="../css/bootstrap.min.css">
	
		<link rel="stylesheet" href="../css/product_view.css">
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script type="text/javascript">
		var a1 = 1;/* test용 */
		var t1 = 2;/* test용 */
		var place = 0;/* 27 */
			//제이쿼리 시작
			$(function(){
				//상품 수량, 총가격
				$("#pnum1").keyup(function(){
					var n1 = $("#pnum1").val();
					
					var cs1 = /[^0-9]/g;// 숫자가 아닌 문자열을 선택하는 정규식
					var result = n1.replace(cs1, "");

					
					
					var n2 = Number(result);
					$("#pnum1").val(n2);
					
					if(n2<1){
						n2=1;
						$("#pnum1").val(n2);
					}
					var nt = "${pDto.p_num}";
					var ntt = Number(nt);
					if(n2>ntt){
						n2=ntt;
						$("#pnum1").val(n2);
					}
					var n3 = "${pDto.p_price}";
					var n4 = Number(n3);
					var n5 = n2*n4;
					$("#totalpnum2").text(n5);
					$("#totalpnum2").val(n5);
				});
				
				$("#minus1").click(function(){
					var n1 = $("#pnum1").val();
					var n2 = Number(n1);
					if(n2<1){n2=1;}
					var n2minus = n2-1;
					var n3 = "${pDto.p_price}";
					var n4 = Number(n3);
					var n5 = n2minus*n4;
					$("#totalpnum2").text(n5);
					$("#totalpnum2").val(n5);
				});
				
				$("#plus1").click(function(){
					var n1 = $("#pnum1").val();
					var n2 = Number(n1);
					var n2plus = n2+1;
					if(n2plus<1){n2plus=1;}
					var nt = "${pDto.p_num}";
					var ntt = Number(nt);
					if(n2plus>ntt){n2plus=ntt;}
					$("#pnum1").val(n2plus-1);
					var n3 = "${pDto.p_price}";
					var n4 = Number(n3);
					var n5 = n2plus*n4;
					$("#totalpnum2").text(n5);
					$("#totalpnum2").val(n5);
				});
				//상품 수량, 총가격
				
							$("#cart1").click(function(){/* 수정함 보내는 값 place부분, cart버튼 place안에 넣음. *//* 27 */
								var pnum1 = $("#pnum1").val();
// 			 					alert("총 구매 숫자:"+pnum1);
								if(pnum1==0){
									
									alert("최소 1개 이상의 수량이 필요합니다.");
								}else{
									
									
									var n1 = $("#totalpnum2").val();
									var n2 = Number(n1);
									var pn1 = $("#pnum1").val();
									var pn2 = Number(pn1);
									var p_no1 = "${pDto.p_no}";
									var p_no2 = Number(p_no1);
									var p_price1 = "${pDto.p_price}";
									var p_price2 = Number(p_price1);
									var p_name1 = "${pDto.p_name}";
									var p_pic1 = "${pDto.p_pic}";
									var p_num1 = "${pDto.p_num}";
									var p_num2 = Number(p_num1);
	
									location.href="../member/my_cart?totalprice="+n2+"&place="+place+
											"&selectamount="+pn2+"&p_no="+p_no2+"&p_price="+p_price2+
											"&p_name="+p_name1+"&p_pic="+p_pic1+"&p_num="+p_num2;/* 27 place 수정 */
									
									
								}
								
							});//카트
					//place 부분 체크/* 라디오 버튼 *//* 27 *//* 수정함 */
					$("#option-sm").click(function(){
						place = 1;
// 						alert("나의 집: "+place);
						
					});		
					$("#option-md").click(function(){
						place = 2;
// 						alert("예약한 농장: "+place);
						
					});							

				
//  				//place 부분 체크/* 라디오 버튼 테스트 *//* 24 *//* 수정함 */
// 					$("input[name=place]").each(function(){
// 						var house1 = $(this).val();
// 						var place = $(this).val();
// 						var checked = $(this).prop('checked');
// 						var place2 = Number(place);
// 						if(checked){
// 							alert("1이면 집, 2이면 농장 값은:"+place2);
// 						}//조건
// 					});//다 체크
					
				$("#buy1").click(function(){/* 구매하기 부분 알람은 바로구매시 구매하기 화면으로 넘길 변수들 *//* 27 */
					var pnum1 = $("#pnum1").val();
// 					alert("총 구매 금액:"+pnum1);
					if(pnum1==0){
						
						alert("최소 1개 이상의 수량이 필요합니다.");
					}else{
						var pn1 = $("#pnum1").val();
						var pn2 = Number(pn1);
						var n1 = $("#totalpnum2").val();
						var p_no1 = "${pDto.p_no}";
						var p_no2 = Number(p_no1);
						alert("총 구매 금액:"+n1);
						alert("배송지:"+place);
						alert("수량:"+pn2);
						alert("물품번호:"+p_no2);
						
						location.href="./my_pur_do2?totalcost="+n1+"&pl_delivery="+place+"&pl_num="+pn2+"&p_no="+p_no2;
					}
					
				});	
				
				//댓글 권한 부분
				var pcheck = "${pcheck}";
				var reviewtextarea1 = $("#reviewtextarea1");
				
				
				if(pcheck==0){
					alert("댓글 쓸 권한이 없습니다!");
					reviewtextarea1.attr("readonly", true);
					
				}
				
				
				
			});//제이쿼리 끝
			
			//버튼을 통한 댓글 쓰기 //23 //로그인한 유저의 닉네임을 받아서 디비에 저장하고 그대로 댓글에 그 닉네임 띄우기
			function reviewregBtn(){
				var star1 = $("#star");
				var star2 = star1.val();
				var star3 = Number(star2);
				var reviewtextarea1 = $("#reviewtextarea1");
				var reviewtextarea2 = reviewtextarea1.val();				
				var p_no1 = "${pDto.p_no}";
				var p_no2 = Number(p_no1);
				
				$.ajax({
					 url:"./ProductReviewWrite",
			 		 type:"post",
			 		 data:{
			 			 "pr_grade":star3,
			 			 "pr_content":reviewtextarea2,
			 			 "p_no":p_no2,
			 		 },
			 		 success:function(data){
			 		     alert("댓글이 등록되었습니다.");
			 		    	location.reload();
			 		 },
			 		 error:function(){
			 			 alert("실패 했습니다.");
			 		 }
				  });//ajax
			}
			
		</script>
	
	</head>
	<body>
	
		<%@include file="../base/header.jsp"%>
	
		<div class="site-wrap">
			<div class="bg-light py-3"></div>
			<div class="site-section">
				<div class="container">
					<div class="row">
						<div class="col-md-6" id="viewimage2">
							<img src="../upload/${pDto.p_pic}" alt="Image" class="img-fluid"
								id="viewimage1">
						</div>
						<div class="col-md-6">
							<h2 class="text-black">상품명: ${pDto.p_name}</h2>
							<p>
								<strong id="price1">가격: <span id="price2">${pDto.p_price}</span> 원</strong>
							</p>
	
							<div class="mb-5">
								<div id="amount">수량</div>
								<div id="totalpnum1">총 가격: <span id="totalpnum2" >0</span> 원</div>
								<div id="totalpnum1">남은 수량: ${pDto.p_num}</div>
								<div id="buttonpart1" class="input-group mb-3"
									style="max-width: 120px;">
									<div class="input-group-prepend">
										<button class="btn btn-outline-primary js-btn-minus"
											type="button" id="minus1">&minus;</button>
									</div>
									<input type="text" class="form-control text-center"
										value="0" placeholder="0"
										aria-label="Example text with button addon"
										aria-describedby="button-addon1" id="pnum1"><!-- 27 --><!-- value1 -->
									<div class="input-group-append">
										<button class="btn btn-outline-primary js-btn-plus"
											type="button" id="plus1">&plus;</button>
									</div>
								</div>
							</div>
							<div class="mb-1 d-flex"><!-- 24 --><!-- name , value 수정함. -->
								<label for="option-sm" class="d-flex mr-3 mb-3"> <span
									class="d-inline-block mr-2"
									style="top: -2px; position: relative;"><input
										type="radio" id="option-sm" name="place" value="1"></span> <span
									class="d-inline-block text-black">나의 집으로 보내기</span>
								</label> <label for="option-md" class="d-flex mr-3 mb-3"> <span
									class="d-inline-block mr-2"
									style="top: -2px; position: relative;"><input
										type="radio" id="option-md" name="place" value="2"></span> <span
									class="d-inline-block text-black">예약한 농장으로 보내기</span>
								</label>
							</div>

							<p id="button1">
								<a href="#"
								 class="buy-now btn btn-sm btn-primary"
									id="cart1"><span id="cart2">장바구니</span></a> <a href="#"
									class="buy-now btn btn-sm btn-primary" id="buy1"><span
									id="buy2">구매하기</span></a>
							</p>
	
						</div>
					</div>
				</div>
			</div>
			<hr>
			<!-- info -->
			<div id="pinfo1">	
				<h2>사용법</h2>
				<p>${pDto.p_way}</p>
				<hr>
				<h2>상품 정보</h2>
				<p>${pDto.p_info}</p>
				<hr>	
			</div>
	
			<!-- 같은 상품 사진들 -->
			<div class="site-section block-3 site-blocks-2 bg-light">
				<div class="container">
					<div class="row justify-content-center">
						<h2>상품 사진들</h2>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="nonloop-block-3 owl-carousel">
								
								<!-- 상품 리스트 수정 만약 널값이면 blank.png가 대신 들어감. --><!--23-->
								<div class="item">
									<div class="block-4 text-center">
										<figure class="block-4-image">
											<img src="../upload/${pDto.p_picd}" alt="Image placeholder"
												class="img-fluid">
										</figure>
										<div class="block-4-text p-4">
											<h3>${pDto.p_picd}</h3>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="block-4 text-center">
										<figure class="block-4-image">
											<img src="../upload/${pDto.p_picd2}" alt="Image placeholder"
												class="img-fluid">
										</figure>
										<div class="block-4-text p-4">
											<h3>${pDto.p_picd2}</h3>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="block-4 text-center">
										<figure class="block-4-image">
											<img src="../upload/${pDto.p_picd3}" alt="Image placeholder"
												class="img-fluid">
										</figure>
										<div class="block-4-text p-4">
											<h3>${pDto.p_picd3}</h3>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="block-4 text-center">
										<figure class="block-4-image">
											<img src="../upload/${pDto.p_picd4}" alt="Image placeholder"
												class="img-fluid">
										</figure>
										<div class="block-4-text p-4">
											<h3>${pDto.p_picd4}</h3>
										</div>
									</div>
								</div>
								<div class="item">
									<div class="block-4 text-center">
										<figure class="block-4-image">
											<img src="../upload/${pDto.p_picd5}" alt="Image placeholder"
												class="img-fluid">
										</figure>
										<div class="block-4-text p-4">
											<h3>${pDto.p_picd5}</h3>
										</div>
									</div>
								</div>
								<!-- 상품 리스트 수정  --><!--23-->
								
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 같은 상품 사진들 --><!--23-->
	
			<!-- review write --><!--23--><!--추가 및 수정-->
			<div id="reviewwrite1">	
				<h2>리뷰</h2>
				<h3>평점: ★ ${starCount}/5 (댓글 수: ${prlistCount})</h3>	
				<textarea rows="3" cols="90" id="reviewtextarea1" >구매내역이 있어야 리뷰를 달 수 있습니다.</textarea>
				<a class="buy-now btn btn-sm btn-primary"
					id="reviewreg1" onclick="reviewregBtn()"><span id="reviewreg2">등록</span></a>
					<div>
						<select id="star">
							<option value="5">★★★★★</option>
							<option value="4">★★★★</option>
							<option value="3">★★★</option>
							<option value="2">★★</option>
							<option value="1">★</option>	
						</select>
					</div>
			</div>
			<hr>
			<div id="reviewlist1"><!--23  --><!-- 댓글 리스트 출력 -->	<!--추가함-->
				<c:forEach items="${prlist}" var="prDto">
				
					<div><!-- 댓글 반복 시작 -->
						<div>
							<h3>${prDto.pr_nickname}</h3>
						</div>
							<p id="star1">
								<c:forEach begin="1" end="${prDto.pr_grade}">
									★
								</c:forEach>
							</p>
						<p id="date1">${prDto.pr_date}</p>
						<p id="reviewcontent1">${prDto.pr_content}</p>	
					</div><!-- 댓글 반복 끝  -->
				
				</c:forEach>
					

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