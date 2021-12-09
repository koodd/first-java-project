
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>장바구니</title>
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

	<link rel="stylesheet" href="../css/cart.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script type="text/javascript">
			var pclist1 = "${pclist}";
		
	
		
		
			$(function(){//25 상품 수량 갱신시 총가격 바뀌는거 버튼 삭제함.
				//쇼핑 계속하기
				$("#continue1").click(function(){
					location.href="../product/product_list";
				});
			
				$("#ref").click(function(){
					alert("test");
					location.reload(true);
				});
				var refreshchk1 = "${refreshchk}";
// 				alert("refreshchk:"+refreshchk1);
				if(refreshchk1==0){
					location.href="./my_cart?refreshchk=1";
				}
				
// 				var plist1 = "${plist}";
// 				for(var i in plist1){
					
// 					console.log("plist의 product"+plist1[i]);
// 					alert("plist의 product"+plist1[i]);
// 				}
				
				
				//장바구니 갱신 //24 장바구니 갱신 부분 추가함.
// 				$("#refresh1").click(function(){
// 					var totalnum1 = $("#totalpnum2").val();
// 					var totalnum2 = Number(totalnum1);
// 					alert("test"+typeof totalnum2);
// 					$("#totalprice2").text(totalnum2);
					
// 				});
// 				var pcheck = "${pcheck}";
// 				var n1 = $("#pnum1").val();
// 				var n2 = Number(n1);
				
// 				alert("pcheck:"+pcheck);
				
// 				$("#pnum1").val(n2+1);
// 				var ctlist = "${ctlist}";

// 				for(var i=0;i<"${ctlist}".length;i++){
					
// // 					alert("ctlist안의 cartdto들의 제품수:"+ctlist[i].ct_num);
// 					console.log(ctlist[i]);
// 				}

// 				var pnum1 = $("#pnum1").val();
// 				alert(pnum1);

// 				$("#pnum1").each(function(){
					
// 					alert($(this).val());
					
// 				});
				
// 				$("#pnum1").each(function(){
// 					alert($(this).val());
// 					console.log($(this).val());
// 				});

				/* 구매하기 부분 알람은 바로구매시 구매하기 화면으로 넘길 변수들 *//* 27 */
				$("#checkout1").click(function(){
					
					
					alert("test");
					
				});


				
			});//jquery
			
			//삭제 버튼을 통한 해당 물품을 장바구니에서 삭제
			function deleteBtn(ct_no){
				
// 				alert("testdel"+pno);
// 				alert("type"+typeof pno);
				
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
			
			//구매하기 버튼
			function buy2(tp){
				
// 		        for(var i=0;i<ctlist.length;i++){

// 		            console.log(ctlist[i]);

// 		        }

				
				alert("buytest"+tp);
				alert("pclisttest"+pclist1);
				
				
				
				
				
			}
			
		</script>

</head>
<body>

	<%@ include file="../base/myPage.jsp" %>

	<div class="site-wrap">


		<div class="bg-light py-3">

		</div>

		<div class="site-section" id="section1">
		
		
			<div class="container">
			<form class="col-md-12" method="post" action="my_pur_do"><!-- form -->
			<div id="title1">장바구니</div><br>
<%-- 			<div id="title1">인서트 결과값: ${result2}</div><br> --%>
<%-- 			<c:forEach items="${map.ctlist}" var="ctDto"> --%>
			
<%-- 				<input type="text" value="${ctDto.ct_num}" id="ctnum1" > --%>
<%-- 			</c:forEach> --%>

				<div class="row mb-5">
						<div class="site-blocks-table" id="uppertable">
						
						
							<table id="table1">
							
								<thead>
								
									<tr><!-- 25 --><!-- 표 th 바꿈. -->
										<th class="product-quantity">수량</th>
										<th class="product-total">총 가격</th>
										<th class="product-remove">상품 삭제</th><!-- 27 -->
									</tr>
								</thead>
								
								<tbody id="tr1" >
									<c:forEach items="${pclist}" var="pcDto">
									<tr>
										<td>
										
										
										
											<div class="input-group mb-3" style="max-width: 120px;" id="amount1">
												<div id="buttonpart1" class="input-group mb-3"
													style="max-width: 120px;">
													<div class="input-group-prepend">
														<button class="btn btn-outline-primary js-btn-minus"
															type="button" id="minus${pcDto.cartDto.ct_no}" onclick="minusBtn(${pcDto.cartDto.ct_no})">&minus;</button>
													</div>
													<input type="text" class="form-control text-center"
														value="${pcDto.cartDto.ct_num}" placeholder="1"
														aria-label="Example text with button addon"
														aria-describedby="button-addon1"  id="${pcDto.cartDto.ct_no}" onkeyup="pnum(${pcDto.cartDto.ct_no},${pcDto.productDto.p_num})" onchange="update(this)" name="pl_num"><!-- 27 --><!-- value1 -->
													<div class="input-group-append">
														<button class="btn btn-outline-primary js-btn-plus"
															type="button" id="plus${pcDto.cartDto.ct_no}" onclick="plusBtn(${pcDto.cartDto.ct_no},${pcDto.productDto.p_num})">&plus;</button>
													</div>
												</div>
												<div>cartno: ${pcDto.cartDto.ct_no}</div>
												<input type="text" value="${pcDto.productDto.p_price}" id="pprice${pcDto.cartDto.ct_no}">
<!-- 												<div id="ctnum1"> -->
<%-- 													${pcDto.cartDto.ct_num} 개 --%>
												
<!-- 												</div> -->
											</div>
										</td>
										
										<td>
											<div id="totalpnum${pcDto.cartDto.ct_no}">${pcDto.cartDto.ct_tp}</div>
											<script type="text/javascript">
												var ctno1 = "${pcDto.cartDto.ct_no}";
// 												alert("ctno:"+ctno1);
// 												var pprice1 = "${pcDto.productDto.p_price}";
// 												var tp3 = tp2.innerHTML;
												
												function plusBtn(ctno,pnum){
												var pprice1 = document.getElementById("pprice"+ctno);
												var totalpnum1 = document.getElementById("totalpnum"+ctno);
// 													alert("ctno:"+ctno);
// 													alert("pnum:"+pnum);
													var pnumid = document.getElementById(ctno);
// 													alert("pnumid:"+pnumid.value);
													var pnumidval = Number(pnumid.value);
// 													alert(typeof pnumidval);
// 													alert("pnumidval:"+pnumidval);
													var pprice2 = Number(pprice1.value);
													totalpnum1.innerHTML = (pnumidval+1)*pprice2;
													if(pnumidval+1>pnum){
														alert("경고! 상품 최대 수량을 초과할 수 없습니다!");
														pnumid.value = pnum-1;
														var pnumidval2 = Number(pnumid.value);
														totalpnum1.innerHTML = (pnumidval2+1)*pprice2;
														var pnumidvaldata = pnumidval2+1;
// 														alert(pnumidvaldata);
														
													}else{
														var pnumidvaldata = pnumidval+1;
// 														alert(pnumidvaldata);
														
													}
													
													//총가격
													var totalinner = totalpnum1.innerHTML;
													var totalpnumdata = Number(totalinner);
// 													alert(totalinner);
// // 													alert("testtp3:"+tp3);
// // 													alert("pprice1:"+pprice1.value);
													$.ajax({
														 url:"cartupdate",
												 		 type:"post",
												 		 
												 		 data:{
												 			 "ct_no":ctno,
												 			 "ct_num":pnumidvaldata,
												 			 "ct_tp":totalinner
												 			 
												 		 },
												 		 success:function(data){
// 												 		     alert("댓글이 등록되었습니다."+data);
												 		 },
												 		 error:function(){
												 			 alert("실패 했습니다.");
												 		 }
													  });//ajax
													
													
													
												}
												
												function minusBtn(ctno){
													var pprice1 = document.getElementById("pprice"+ctno);
													var totalpnum1 = document.getElementById("totalpnum"+ctno);
// 													alert("ctno:"+ctno);
													var pnumid = document.getElementById(ctno);
// 													alert("pnumid:"+pnumid.value);
													var pnumidval = Number(pnumid.value);
// 													alert(typeof pnumidval);
// 													alert("pnumidval:"+pnumidval);
													var pprice2 = Number(pprice1.value);
													totalpnum1.innerHTML = (pnumidval-1)*pprice2;
													if(pnumidval-2<0){
														alert("경고! 최소 1개 이상의 수량이어야 합니다!");
														pnumid.value = 2;
														var pnumidval2 = Number(pnumid.value);
														totalpnum1.innerHTML = (pnumidval2-1)*pprice2;
														var pnumidvaldata = pnumidval2-1;
// 														alert(pnumidvaldata);
													}else{
														var pnumidvaldata = pnumidval-1;
// 														alert(pnumidvaldata);
														
													}
													
													
													//총가격
													var totalinner = totalpnum1.innerHTML;
													var totalpnumdata = Number(totalinner);
// 													alert(totalinner);
// // 													alert("testtp3:"+tp3);
// // 													alert("pprice1:"+pprice1.value);
													$.ajax({
														 url:"cartupdate",
												 		 type:"post",
												 		 
												 		 data:{
												 			 "ct_no":ctno,
												 			 "ct_num":pnumidvaldata,
												 			 "ct_tp":totalinner
												 			 
												 		 },
												 		 success:function(data){
// 												 		     alert("댓글이 등록되었습니다."+data);
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
// 													alert("pnum"+typeof pnum);
// 													alert("ctno:"+typeof ctno);
													var pnumid = document.getElementById(ctno);
// 													alert("pnumid:"+pnumid.value);
													var pnumidval = pnumid.value;	// 원래 문자열
													var cs1 = /[^0-9]/g;// 숫자가 아닌 문자열을 선택하는 정규식
													var result = pnumidval.replace(cs1, "");
// 													alert("teststring:"+result);
													var numresult = Number(result);
													pnumid.value = numresult;
													totalpnum1.innerHTML = numresult*pprice2;
													if(numresult<1){
														alert("경고! 최소 1개 이상의 수량이어야 합니다!");
														pnumid.value = 1;
														var pnumidval2 = pnumid.value;
														totalpnum1.innerHTML = pnumidval2*pprice2;
														var pnumidvaldata = pnumidval2;
// 														alert(pnumidvaldata);
	
														
													}else if(numresult>pnum){
														alert("경고! 상품 최대 수량을 초과할 수 없습니다!");
														pnumid.value = pnum;
														var pnumidval2 = pnumid.value;
														totalpnum1.innerHTML = pnumidval2*pprice2;
														var pnumidvaldata = pnumidval2;
// 														alert(pnumidvaldata);
													}else{
														
														var pnumidvaldata = numresult;
// 														alert(pnumidvaldata);
														
													}
													//총가격
													var totalinner = totalpnum1.innerHTML;
													var totalpnumdata = Number(totalinner);
// 													alert(totalinner);
// // 													alert("testtp3:"+tp3);
// // 													alert("pprice1:"+pprice1.value);
													$.ajax({
														 url:"cartupdate",
												 		 type:"post",
												 		 
												 		 data:{
												 			 "ct_no":ctno,
												 			 "ct_num":pnumidvaldata,
												 			 "ct_tp":totalinner
												 			 
												 		 },
												 		 success:function(data){
// 												 		     alert("댓글이 등록되었습니다."+data);
												 		 },
												 		 error:function(){
												 			 alert("실패 했습니다.");
												 		 }
													  });//ajax

													
												}
												
// 												//input box 밸류 감지.
// 												function update(obj){
// 													alert("testupdate:"+obj.value);
// 													var totalpnumdata = Number(obj.value);
// 													alert(typeof totalpnumdata);
// 												}
												


// 													my1.addEventListener('keyup', () => {
// 													  result_div.innerHTML += '<div>keyup</div>';
// 													});
// 												$(function(){
// 													$("#pnum"+ctno1).each(function(){
														
// 														alert("pnumtest:"+$(this).val());
// 													});
													
// 												});


											
											</script>
										</td><!-- 25 --><!-- 표 위치 바꿈-->
										
										
										<td><div id="height1"><a href="#" class="btn btn-primary btn-sm" id="remove1" onclick="deleteBtn(${pcDto.cartDto.ct_no})">X</a></div></td>
										<!-- 25 --><!-- 삭제 버튼 자리 옮김 -->
										
										
										
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
								<tbody><!-- 24 --><!-- 장바구니 반복 -->
									
									<c:forEach items="${pclist}" var="pcDto">
									
									<tr>
									
										<td class="product-thumbnail" ><div id="height2"><img
											src="../upload/${pcDto.productDto.p_pic}" alt="Image" class="img-fluid"></div>
										</td>
										<td class="product-name">
											<div id="height1">
												<h2 class="h5 text-black">${pcDto.productDto.p_name}</h2><!-- 23 --><!-- 들어가는거 바꿈. -->
											</div>
										</td>
										<td>
										<input type="hidden" name="p_no" value="${pcDto.productDto.p_no}">
											<div id="height1">${pcDto.productDto.p_price} 원</div>
										</td><!-- 23 --><!-- 들어가는거 바꿈. -->
<%-- 										<td><input type="hidden" value="${pDto.p_num}개"> </td><!-- 25 --><!-- 들어가는거 바꿈. --> --%>
										
										
										
		
										
										
<%-- 										<c:if test="${place==1}">24 --%><%-- test로 배송지 수정
											<td><div id="height1">test-배송지: 나의 집</div></td>
										</c:if>
										<c:if test="${place==2}">24 --%><%-- test로 배송지 수정
											<td><div id="height1">test-배송지: 예약한 농장</div></td>
										</c:if> --%>
									</tr>
									</c:forEach>	
								
									


								</tbody>
							</table>
							

							
						</div><!-- upper table -->
					
				</div>

				<div class="row">
					<div class="col-md-6">
						<div class="row mb-5"><!-- 27 --><!-- 장바구니 갱신 부활. -->
							<div class="col-md-6">
								<button class="btn btn-outline-primary btn-sm btn-block" id="continue1" type="button"><span
									id="continue2">쇼핑 계속하기</span></button>
							</div>
							<div class="col-md-6">
								<button class="btn btn-outline-primary btn-sm btn-block" id="continue1" type="button"><span
									id="continue2" onclick="refreshBtn()">장바구니 총가격 갱신</span></button>
									<c:forEach items="${pclist}" var="pcDto">
										<script type="text/javascript">
										var ctnoi = "${pcDto.cartDto.ct_no}";
											function refreshBtn(){
												location.reload();
// 												alert("refreshtest"+ctnoi);
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
										<strong class="text-black" id="totalprice2">${totalcttp} 원</strong><!-- 24 --><!-- totalprice2 id 추가 -->
									</div>
								</div>

								<div class="row">
									<div class="col-md-12">
<%-- 									<c:forEach items="${plist}" var="pDto2"> --%>
<%-- 									<c:forEach items="${ctlist}" var="ctDto2"> --%>
<%-- 									<c:if test="${pDto2.p_num<ctDto2.ct_num}"> --%>
									
<!-- 										<p>구매불가합니다.</p> -->
									
<%-- 									</c:if> --%>
<%-- 									</c:forEach> --%>
<%-- 									</c:forEach> --%>
<!-- 										<form action="./my_pur_list" method="post" > -->
<%-- 										<c:forEach items="${pclist}" var="pcdto1"> --%>
<%-- 											<input type="hidden" id="pclist" name="pclist" value="${pcdto1}"> --%>
<%-- 										</c:forEach> --%>
											<button type="submit" class="btn btn-primary btn-lg py-3 btn-block" onclick="buy1(${totalcttp})" id="checkout1"><span id="checkout2">구매하기</span></button>
<!-- 										</form> -->
									
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</form><!-- form -->
			</div><!-- container -->
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

	<%@include file="../base/footer.jsp"%><!-- 23 -->


</body>
</html>