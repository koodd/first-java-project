
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
	<title>장바구니</title>
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
	<link rel="stylesheet" href="../css/footer.css">
	
	<link rel="stylesheet" href="../css/cart.css">
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script><!-- 29 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script><!-- 29 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
				var pclist1 = "${pclist}";
				$(function(){
					//쇼핑 계속하기
					$("#continue1").click(function(){
						location.href="../product/product_list";
					});
					//자동 갱신
					$("#ref").click(function(){
						location.reload(true);
					});
					var refreshchk1 = "${refreshchk}";
					if(refreshchk1==0){
						location.href="./my_cart?refreshchk=1";
					}
					/* 구매하기 *//* 30 */
					$("#checkout1").click(function(){
						
						//넘길 상품 번호들
						var p_nos = "${p_nos}";
						//넘길 상품 수량들
						var pl_nums = "${pl_nums}";
						var arr1 = [];
						arr1.push(p_nos);
						var arr2 = [];
						arr2.push(pl_nums);
						var pay_code = "${py_no}";
						var pay_name = "${py_no}";
						var pay_user = "${mDto.u_name}";
						var cartuno = "${mDto.u_no}";
						var ncartuno = Number(cartuno);
						var zipcode1 = $("#zipcode").val();
						var addr1 = $("#u_addr1").val();
						var addr2 = $("#u_addr2").val();
						var addr3 = addr1+","+addr2;
						var totalprice = "${totalcttp}";
						if(zipcode1=="" || addr1=="" || addr2 ==""){
							window.open("my_delivery", "width=300, height=300, fullscreen=no");
						}else{
				             IMP.init('imp30403635');
	// 		                 IMP.request_pay(param, callback) 결제창 호출
			                 IMP.request_pay({ // param
			                     pg: "kakaopay",
			                     pay_method: "card",
			                     merchant_uid: pay_code,	// 결제코드
			                     name: pay_name,	//상품명
			                     amount: totalprice,	//결제금액
			                     buyer_email: "hsp880514@naver.com",	//유저 이메일
			                     buyer_name: pay_user,	// 유저이름
			                     buyer_tel: "010-5161-0157",	// 유저 전화번호 (테스트라서)
			                     buyer_addr: addr3,	// 유저 주소
			                     buyer_postcode: zipcode1
			                 }, function (rsp) { // callback
			                     if (rsp.success) {
				                    var msg = '결제가 완료되었습니다.\n';
			                        msg += '고유ID : ' + rsp.imp_uid+"\n";
			                        msg += '상점 거래ID : ' + rsp.merchant_uid+"\n";
			                        msg += '결제 금액 : ' + rsp.paid_amount;
									location.href="./my_cart_buy?u_no="+ncartuno+"&addr3="+addr3+"&pay_code="+pay_code+"&totalprice="+totalprice;
			                     } else {
			                        var msg = '결제에 실패하였습니다.';
			                        msg += '에러내용 : ' + rsp.error_msg;
			                     }
			                     alert(msg);
			                 });
						}
					});//checkout1
					
				});//jquery
				
				//삭제 버튼을 통한 해당 물품을 장바구니에서 삭제
				function deleteBtn(ct_no){
					
			    	  $.ajax({
				     		 url:"./cartdel",
				     		 type:"post",
				     		 data:{
				     			 "ct_no":ct_no
				     		 },
				     		 success:function(data){
				     			 
				     			 if(data!=null){
					     			 alert("삭제 성공했습니다!");
				     			 }
	
				     		 },
				     		 error:function(textStatus){
				     			 
				     		 }
				     	  });
					
					location.href="./my_cart";
					
				}
				
	</script>

</head>
<body>

	<%@ include file="../base/myPage.jsp"%>

	<div class="site-wrap">


		<div class="bg-light py-3"></div>

		<div class="site-section" id="section1">


			<div class="container">
				<form class="col-md-12" method="post" action="my_pur_do">
					<!-- form -->
					<div id="title1">장바구니</div>
					<br>
					<div class="row mb-5">
						<div class="site-blocks-table" id="uppertable">

							<table id="table1">
								<thead>
									<tr>
										<th class="product-quantity">수량</th>
										<th class="product-total">총 가격</th>
										<th class="product-remove">상품 삭제</th>
									</tr>
								</thead>

								<tbody id="tr1">
									<c:forEach items="${pclist}" var="pcDto">
										<tr>
											<td>
												<div class="input-group mb-3" style="max-width: 120px;"
													id="amount1">
													<div id="buttonpart1" class="input-group mb-3"
														style="max-width: 120px;">
														<div class="input-group-prepend">
															<button class="btn btn-outline-primary js-btn-minus"
																type="button" id="minus${pcDto.cartDto.ct_no}"
																onclick="minusBtn(${pcDto.cartDto.ct_no})">&minus;</button>
														</div>
														<input type="text" class="form-control text-center"
															value="${pcDto.cartDto.ct_num}" placeholder="1"
															aria-label="Example text with button addon"
															aria-describedby="button-addon1"
															id="${pcDto.cartDto.ct_no}"
															onkeyup="pnum(${pcDto.cartDto.ct_no},${pcDto.productDto.p_num})"
															onchange="update(this)" name="pl_num">
														<div class="input-group-append">
															<button class="btn btn-outline-primary js-btn-plus"
																type="button" id="plus${pcDto.cartDto.ct_no}"
																onclick="plusBtn(${pcDto.cartDto.ct_no},${pcDto.productDto.p_num})">&plus;</button>
														</div>
													</div>
													<input type="hidden" value="${pcDto.productDto.p_price}"
														id="pprice${pcDto.cartDto.ct_no}">
													<!-- 29 -->
												</div>
											</td>

											<td>
												<div id="totalpnum${pcDto.cartDto.ct_no}"><!-- 29 -->
												<fmt:formatNumber value="${pcDto.cartDto.ct_tp}" pattern="#,###"/>
												 원</div>
												<script type="text/javascript">
												var ctno1 = "${pcDto.cartDto.ct_no}";
												function plusBtn(ctno,pnum){
												var pprice1 = document.getElementById("pprice"+ctno);
												var totalpnum1 = document.getElementById("totalpnum"+ctno);
													var pnumid = document.getElementById(ctno);
													var pnumidval = Number(pnumid.value);
													var pprice2 = Number(pprice1.value);
													totalpnum1.innerHTML = (pnumidval+1)*pprice2;
													if(pnumidval+1>pnum){
														alert("경고! 상품 최대 수량을 초과할 수 없습니다!");
														pnumid.value = pnum-1;
														var pnumidval2 = Number(pnumid.value);
														totalpnum1.innerHTML = (pnumidval2+1)*pprice2;
														var pnumidvaldata = pnumidval2+1;
													}else{
														var pnumidvaldata = pnumidval+1;
													}
													//총가격
													var totalinner = totalpnum1.innerHTML;
													var totalpnumdata = Number(totalinner);
													$.ajax({
														 url:"cartupdate",
												 		 type:"post",
												 		 
												 		 data:{
												 			 "ct_no":ctno,
												 			 "ct_num":pnumidvaldata,
												 			 "ct_tp":totalinner
												 			 
												 		 },
												 		 success:function(data){
												 		 },
												 		 error:function(){
												 			 alert("실패 했습니다.");
												 		 }
													  });//ajax
												}
												
												function minusBtn(ctno){
													var pprice1 = document.getElementById("pprice"+ctno);
													var totalpnum1 = document.getElementById("totalpnum"+ctno);
													var pnumid = document.getElementById(ctno);
													var pnumidval = Number(pnumid.value);
													var pprice2 = Number(pprice1.value);
													totalpnum1.innerHTML = (pnumidval-1)*pprice2;
													if(pnumidval-2<0){
														alert("경고! 최소 1개 이상의 수량이어야 합니다!");
														pnumid.value = 2;
														var pnumidval2 = Number(pnumid.value);
														totalpnum1.innerHTML = (pnumidval2-1)*pprice2;
														var pnumidvaldata = pnumidval2-1;
													}else{
														var pnumidvaldata = pnumidval-1;
													}
													
													//총가격
													var totalinner = totalpnum1.innerHTML;
													var totalpnumdata = Number(totalinner);
													$.ajax({
														 url:"cartupdate",
												 		 type:"post",
												 		 
												 		 data:{
												 			 "ct_no":ctno,
												 			 "ct_num":pnumidvaldata,
												 			 "ct_tp":totalinner
												 		 },
												 		 success:function(data){
												 		 },
												 		 error:function(){
												 			 alert("실패 했습니다.");
												 		 }
													  });//ajax
													
												}
												
												function pnum(ctno,pnum){
													var pprice1 = document.getElementById("pprice"+ctno);
													var pprice2 = Number(pprice1.value);
													var totalpnum1 = document.getElementById("totalpnum"+ctno);
													var pnumid = document.getElementById(ctno);
													var pnumidval = pnumid.value;	// 원래 문자열
													var cs1 = /[^0-9]/g;// 숫자가 아닌 문자열을 선택하는 정규식
													var result = pnumidval.replace(cs1, "");
													var numresult = Number(result);
													pnumid.value = numresult;
													totalpnum1.innerHTML = numresult*pprice2;
													if(numresult<1){
														alert("경고! 최소 1개 이상의 수량이어야 합니다!");
														pnumid.value = 1;
														var pnumidval2 = pnumid.value;
														totalpnum1.innerHTML = pnumidval2*pprice2;
														var pnumidvaldata = pnumidval2;
														
													}else if(numresult>pnum){
														alert("경고! 상품 최대 수량을 초과할 수 없습니다!");
														pnumid.value = pnum;
														var pnumidval2 = pnumid.value;
														totalpnum1.innerHTML = pnumidval2*pprice2;
														var pnumidvaldata = pnumidval2;
													}else{
														var pnumidvaldata = numresult;
													}
													//총가격
													var totalinner = totalpnum1.innerHTML;
													var totalpnumdata = Number(totalinner);
													$.ajax({
														 url:"cartupdate",
												 		 type:"post",
												 		 data:{
												 			 "ct_no":ctno,
												 			 "ct_num":pnumidvaldata,
												 			 "ct_tp":totalinner
												 		 },
												 		 success:function(data){
												 		 },
												 		 error:function(){
												 			 alert("실패 했습니다.");
												 		 }
													  });//ajax
												}
											</script>
											</td>
											<td><div id="height1">
													<a href="#" class="btn btn-primary btn-sm" id="remove1"
														onclick="deleteBtn(${pcDto.cartDto.ct_no})">X</a>
												</div></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<table id="table2">
								<thead>
									<tr>
										<th class="product-thumbnail">상품 이미지</th>
										<th class="product-name">상품</th>
										<th class="product-price">가격</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${pclist}" var="pcDto">
										<tr>
											<td class="product-thumbnail"><div id="height2">
													<img src="../upload/${pcDto.productDto.p_pic}"
														alt="${pcDto.productDto.p_pic}" class="img-fluid"
														id="img1">
												</div>
												<!-- 29 --></td>
											<td class="product-name">
												<div id="height1">
													<h2 class="h5 text-black">${pcDto.productDto.p_name}</h2>
												</div>
											</td>
											<td><input type="hidden" name="p_no"
												value="${pcDto.productDto.p_no}">
												<div id="height1">
												<fmt:formatNumber value="${pcDto.productDto.p_price}" pattern="#,###"/><!-- 29 -->
												 원</div></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- upper table -->
					</div>

					<div class="row">
						<div class="col-md-6">
							<div class="row mb-5">
								<div class="col-md-6">
									<button class="btn btn-outline-primary btn-sm btn-block"
										id="continue1" type="button">
										<span id="continue2">쇼핑 계속하기</span>
									</button>
								</div>
								<div class="col-md-6">
									<button class="btn btn-outline-primary btn-sm btn-block"
										id="continue1" type="button">
										<span id="continue2" onclick="refreshBtn()">장바구니 총가격 갱신</span>
									</button>
									<c:forEach items="${pclist}" var="pcDto">
										<script type="text/javascript">
										var ctnoi = "${pcDto.cartDto.ct_no}";
											function refreshBtn(){
												location.reload();
											}
										</script>
									</c:forEach>
								</div>
							</div>
						</div>

						<div class="col-md-6 pl-5">
							<div class="row justify-content-end">
								<div class="col-md-7">
									<div class="row">
										<div class="col-md-12 text-right border-bottom mb-5">
											<h3 class="text-black h4 text-uppercase">장바구니 총 가격</h3>
										</div>
									</div>
									<div class="row mb-3">
										<div class="col-md-6">
											<span class="text-black" id="totalprice1">총 가격</span>
										</div>
										<div class="col-md-6 text-right">
											<strong class="text-black" id="totalprice2">
											<fmt:formatNumber value="${totalcttp}" pattern="#,###"/> 원</strong><!-- 29 -->
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<button type="button"
												class="btn btn-primary btn-lg py-3 btn-block"
												 id="checkout1">
												<span id="checkout2">구매하기</span>
											</button>
										</div>
									</div>
									<div>
										<input type="hidden" id="zipcode" name="zipcode" /><br>
									
										<input type="hidden" id="u_addr1" name="u_addr" /><br>
										<input type="hidden" id="u_addr2" name="u_addr" placeholder="상세주소를 적어주세요" /><br>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
				<!-- form -->
			</div>
			<!-- container -->
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