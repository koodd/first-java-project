
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

	<title>구매내역</title>
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
	
	<link rel="stylesheet" href="../css/purchaselist.css">
	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
				//29
				//예비용
				$(function(){
					
				});
				function cancelBtn(py_no){
					location.href="my_pur_write?py_no="+py_no;
				}
				function returnBtn(py_no){
					location.href="my_pur_write2?py_no="+py_no;
				}
				function exchangeBtn(py_no){
					location.href="my_pur_write3?py_no="+py_no;
				}
	</script>
</head>
<body>

	<%@ include file="../base/myPage.jsp"%>

	<div class="site-wrap">
		<div class="bg-light py-3"></div>

		<div class="site-section" id="section1">
			<div class="container">
				<hr>
				<div id="title1">상품 구매내역</div>
				<hr>
				<div id="title2">주문 목록</div>
				<br>
				<div class="row mb-5">
					<form class="col-md-12" method="post">
						<div class="site-blocks-table">
							<table class="table table-bordered">
								<!-- 리스트 제목부분 -->
								<thead>
									<tr>
										<th class="product-thumbnail">날짜/주문번호</th>
										<th class="product-name">배송지</th>
										<th class="product-price">상품명</th>
										<th class="product-quantity">상품금액/수량</th>
										<th class="product-total">주문상태</th>
									</tr>
								</thead>
								<tbody>
									<!-- 리스트 반복 -->
									<c:forEach items="${ppplist}" var="pppdto">
										<tr id="${pppdto.payDto.py_no}">
											<td class="product-name">
												<div id="height1">
													<div id="num2" class="fontsize1">${pppdto.payDto.py_date}</div>
													<br>
													<div id="num1" class="fontsize1">${pppdto.payDto.py_no}</div>
													<br>
													<c:if test="${pppdto.pppDtos[0].purchaseListDto.pl_status==1}">
														<div id="num3" class="fontsize1">
															<button type="button"
																class="btn btn-primary btn-sm btn-block" id="request1"
																onclick="cancelBtn(${pppdto.payDto.py_no})">
																<span id="request2">취소 신청</span>
															</button>
														</div>
													</c:if>
													<c:if test="${pppdto.pppDtos[0].purchaseListDto.pl_status==2}">
														<div id="num3" class="fontsize1">
															<button type="button"
																class="btn btn-primary btn-sm btn-block" id="request1"
																onclick="returnBtn(${pppdto.payDto.py_no})">
																<span id="request2">반품 신청</span>
															</button>
														</div>
														<br>
														<div id="num4" class="fontsize1">
														
																<button type="button"
																	class="btn btn-primary btn-sm btn-block" id="request1"
																	onclick="exchangeBtn(${pppdto.payDto.py_no})">
																	<span id="request2">교환 신청</span>
																</button>
														</div>
													</c:if>
													<c:if test="${pppdto.pppDtos[0].purchaseListDto.pl_status==3}">
														<div id="num3" class="fontsize1">
															<button type="button"
																class="btn btn-primary btn-sm btn-block" id="request1"
																onclick="returnBtn(${pppdto.payDto.py_no})">
																<span id="request2">반품 신청</span>
															</button>
														</div>
														<br>
														<div id="num4" class="fontsize1">
																<button type="button"
																	class="btn btn-primary btn-sm btn-block" id="request1"
																	onclick="exchangeBtn(${pppdto.payDto.py_no})">
																	<span id="request2">교환 신청</span>
																</button>
														</div>
													</c:if>
												</div>
											</td>
											<td><div class="fontsize1" id="height1">${pppdto.pppDtos[0].purchaseListDto.pl_delivery}</div></td>
											<td class="product-thumbnail"><c:forEach
													items="${pppdto.pppDtos}" var="pldto">
													<div>
														<div id="height2">
															<img src="../upload/${pldto.productDto.p_pic}"
																alt="Image" class="img-fluid">
														</div>
														<hr>
														<div id="font1">${pldto.productDto.p_name}</div>
														<hr>
													</div>
												</c:forEach></td>
											<td>
												<c:forEach items="${pppdto.pppDtos}" var="pldto">
													<div class="fontsize1" id="height3">
														<fmt:formatNumber value="${pldto.productDto.p_price}" pattern="#,###"/>
														원 / ${pldto.purchaseListDto.pl_num} 개
													</div>
													<hr>
												</c:forEach>
											</td>
											<td>
												<c:if test="${pppdto.pppDtos[0].purchaseListDto.pl_status==1}">
													<div class="fontsize1" id="height3">구매결정</div>
												</c:if> 
												<c:if test="${pppdto.pppDtos[0].purchaseListDto.pl_status==2}">
													<div class="fontsize1" id="height3">배송중</div>
												</c:if> 
												<c:if test="${pppdto.pppDtos[0].purchaseListDto.pl_status==3}">
													<div class="fontsize1" id="height3">구매확정</div>
												</c:if> 
												<c:if test="${pppdto.pppDtos[0].purchaseListDto.pl_status==4}">
													<div class="fontsize1" id="height3">처리중</div>
												</c:if> 
												<c:if test="${pppdto.pppDtos[0].purchaseListDto.pl_status==5}">
													<div class="fontsize1" id="height3">처리완료</div>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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