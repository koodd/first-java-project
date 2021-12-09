<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<title>상품 상세</title>
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
	
	<link rel="stylesheet" href="../css/product_view.css">
	
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script><!-- 30 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
			var place = 0;
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
						var n6 = String(n5);//29
						var n7 = n6.replace(/\B(?=(\d{3})+(?!\d))/g, ",");//29
						$("#totalpnum2").text(n7);//29
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
						var n6 = String(n5);//29
						var n7 = n6.replace(/\B(?=(\d{3})+(?!\d))/g, ",");//29
						$("#totalpnum2").text(n7);//29
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
						var n6 = String(n5);//29
						var n7 = n6.replace(/\B(?=(\d{3})+(?!\d))/g, ",");//29
						$("#totalpnum2").text(n7);//29
						$("#totalpnum2").val(n5);
					});
					//상품 수량, 총가격
					
						$("#cart1").click(function(){
							var pnum1 = $("#pnum1").val();
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
										"&p_name="+p_name1+"&p_pic="+p_pic1+"&p_num="+p_num2;
							}
							
						});//카트
						//place 부분 체크
						$("#option-sm").click(function(){
							place = 1;
						});		
						$("#option-md").click(function(){
							place = 2;
						});							

					$("#buy1").click(function(){/* 구매하기 부분 알람은 바로구매시 구매하기 화면으로 넘길 변수들 */
						var pnum1 = $("#pnum1").val();
					
						var uno = "${u_no}";
						
						var pn1 = $("#pnum1").val();
						var pn2 = Number(pn1);
						
						var n1 = $("#totalpnum2").val();
						var n2 = Number(n1);
						
						var p_no1 = "${pDto.p_no}";
						var p_no2 = Number(p_no1);
						
						var pay_code = "${py_no}";
						var paycode1 = Number(pay_code);
						
						var pay_user = "${mDto.u_name}";
						
						if(pnum1==0){
							alert("최소 1개 이상의 수량이 필요합니다.");
						}else{
				             IMP.init('imp30403635');
//     	 		                 IMP.request_pay(param, callback) 결제창 호출
    			                 IMP.request_pay({ // param
    			                     pg: "kakaopay",
    			                     pay_method: "card",
    			                     merchant_uid: paycode1,	// 결제코드
    			                     name: paycode1,	//상품명
    			                     amount: n2,	//결제금액
    			                     buyer_email: "hsp880514@naver.com",	//유저 이메일
    			                     buyer_name: pay_user,	// 유저이름
    			                     buyer_tel: "010-5161-0157",	// 유저 전화번호 (테스트라서)
    			                     buyer_addr: place,	// 유저 주소
    			                     buyer_postcode: place
    			                 }, function (rsp) { // callback
    			                     if (rsp.success) {
    				                    var msg = '결제가 완료되었습니다.\n';
    			                        msg += '고유ID : ' + rsp.imp_uid+"\n";
    			                        msg += '상점 거래ID : ' + rsp.merchant_uid+"\n";
    			                        msg += '결제 금액 : ' + rsp.paid_amount;
										location.href="./my_pur_do2?totalcost="+n1+"&pl_delivery="+place+"&pl_num="+pn2+"&p_no="+p_no2+"&u_no="+uno+"&py_no="+paycode1;
    			                     } else {
    			                        var msg = '결제에 실패하였습니다.';
    			                        msg += '에러내용 : ' + rsp.error_msg;
    			                     }
    			                     alert(msg);
    			                 });
						}
					});	
					
					//댓글 권한 부분 /* 29 */
					var pcheck = "${pcheck}";
					var reviewtextarea1 = $("#reviewtextarea1");
					
					if(pcheck==0){
						reviewtextarea1.attr("readonly", true);
						
					}
					
				});//제이쿼리 끝
				
				//버튼을 통한 댓글 쓰기 //로그인한 유저의 닉네임을 받아서 디비에 저장하고 그대로 댓글에 그 닉네임 띄우기
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
							<strong id="price1">가격: <span id="price2">
							<fmt:formatNumber value="${pDto.p_price}" pattern="#,###"/></span><!-- 29 -->
								원
							</strong>
						</p>

						<div class="mb-5">
							<div id="amount">수량</div>
							<div id="totalpnum1">
							
								총 가격: <span id="totalpnum2">0</span> 원
							</div>
							<div id="totalpnum1">남은 수량: ${pDto.p_num}</div>
							<div id="buttonpart1" class="input-group mb-3"
								style="max-width: 120px;">
								<div class="input-group-prepend">
									<button class="btn btn-outline-primary js-btn-minus"
										type="button" id="minus1">&minus;</button>
								</div>
								<input type="text" class="form-control text-center" value="0"
									placeholder="0" aria-label="Example text with button addon"
									aria-describedby="button-addon1" id="pnum1">
								<!-- 27 -->
								<!-- value1 -->
								<div class="input-group-append">
									<button class="btn btn-outline-primary js-btn-plus"
										type="button" id="plus1">&plus;</button>
								</div>
							</div>
						</div>
						<div class="mb-1 d-flex">
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
							<a href="#" class="buy-now btn btn-sm btn-primary" id="cart1"><span
								id="cart2">장바구니</span></a> <a href="#"
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
				</div><br>
				<div class="row">
					<div class="col-md-12">
					
						<c:if test="${pDto.p_picd eq 'blank.png'}"><!-- 01 -->
							<div id="nopics">
								<h3>등록된 사진들이 없습니다.</h3>
							</div>
						</c:if>
						<c:if test="${pDto.p_picd != 'blank.png'}">
	 						<div id="productbox">
								<div id="imagebox">
									<img src="../upload/${pDto.p_picd}" alt="${pDto.p_picd}" class="img-fluid">
								</div><br>
							</div>
						</c:if>
						<c:if test="${pDto.p_picd2 != 'blank.png'}">
	 						<div id="productbox">
								<div id="imagebox">
									<img src="../upload/${pDto.p_picd2}" alt="${pDto.p_picd2}" class="img-fluid">
								</div><br>
							</div>
						</c:if>
						<c:if test="${pDto.p_picd3 != 'blank.png'}">
	 						<div id="productbox">
								<div id="imagebox">
									<img src="../upload/${pDto.p_picd3}" alt="${pDto.p_picd3}" class="img-fluid">
								</div><br>
							</div>
						</c:if>
						<c:if test="${pDto.p_picd4 != 'blank.png'}">
	 						<div id="productbox">
								<div id="imagebox">
									<img src="../upload/${pDto.p_picd4}" alt="${pDto.p_picd4}" class="img-fluid">
								</div><br>
							</div>
						</c:if>
						<c:if test="${pDto.p_picd5 != 'blank.png'}">
	 						<div id="productbox">
								<div id="imagebox">
									<img src="../upload/${pDto.p_picd5}" alt="${pDto.p_picd5}" class="img-fluid">
								</div><br>
							</div>
						</c:if>
						
					</div>
				</div>
			</div>
		</div>
		<!-- 같은 상품 사진들 -->
		

		<!-- review write -->
		<div id="reviewwrite1">
			<h2>리뷰</h2>
			<h3>평점: ★ ${starCount}/5 (댓글 수: ${prlistCount})</h3>
			<textarea rows="3" cols="90" id="reviewtextarea1" placeholder="구매내역이 있어야 리뷰를 달 수 있습니다."></textarea><!-- 29 -->
			<a class="buy-now btn btn-sm btn-primary" id="reviewreg1"
				onclick="reviewregBtn()"><span id="reviewreg2">등록</span></a>
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
		<div id="reviewlist1">
			<!-- 댓글 리스트 출력 -->
			<c:forEach items="${prlist}" var="prDto">

				<div>
					<!-- 댓글 반복 시작 -->
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
				</div>
				<!-- 댓글 반복 끝  -->

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