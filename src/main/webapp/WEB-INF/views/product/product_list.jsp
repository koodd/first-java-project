<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../base/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품</title>
	
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	
	<link rel="stylesheet" href="../css/product.css">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	</script>

</head>
<body>
	<section>
		<div id="maindiv">
			<div id="menubar">
				<br>
				<h2>홀팜 shop</h2>
				<br>
				<form action="product_list" name="search" method="get">
					<input type="hidden" name="category" id="category" value="all"><br>
					<input type="text" id="searchword" name="searchword">
					<button type="submit" id="glassbutton1">
						<img src="../images/glass1.jpg" alt="" id="searchicon1">
					</button>
					<br>
				</form>
				<div id="category1">
					<h2>카테고리</h2>
					<br>
					<table id="categorytable1">
						<tr>
							<th><a
								href="product_list?category=${map.nDto.category}&searchword=${map.nDto.searchword}&page=1&pc_no=0">전체</a></th>
							<td>${c1+c2+c3+c4}</td>
						</tr>
						<tr>
							<th><a
								href="product_list?category=${map.nDto.category}&searchword=${map.nDto.searchword}&page=1&pc_no=1">농기구</a></th>
							<td>${c1}</td>
						</tr>
						<tr>
							<th><a
								href="product_list?category=${map.nDto.category}&searchword=${map.nDto.searchword}&page=1&pc_no=2">씨앗</a></th>
							<td>${c2}</td>
						</tr>
						<tr>
							<th><a
								href="product_list?category=${map.nDto.category}&searchword=${map.nDto.searchword}&page=1&pc_no=3">모종</a></th>
							<td>${c3}</td>
						</tr>
						<tr>
							<th><a
								href="product_list?category=${map.nDto.category}&searchword=${map.nDto.searchword}&page=1&pc_no=4">기타</a></th>
							<td>${c4}</td>
						</tr>
					</table>
				</div>
				<br> <a href="../board/board_trade"><img
					class="leftboardeal" src="../images/userTrade.jpg"
					alt="usertrade1.jpg" id="leftboardeal"></a><br>
				<!-- 29 -->
			</div>
			<div id="rightarea">
				<div id="productlist">
					<c:forEach items="${map.list}" var="pDto">
						<div class="products">
							<a
								href="./product_view?p_no=${pDto.p_no}&p_name=${pDto.p_name}&p_way=${pDto.p_way}&p_num=${pDto.p_num}&p_term=${pDto.p_term}
								&pc_no=${pDto.pc_no}&p_price=${pDto.p_price}&p_info=${pDto.p_info}&p_pic=${pDto.p_pic}&p_picd=${pDto.p_picd}
								&p_picd2=${pDto.p_picd2}&p_picd3=${pDto.p_picd3}&p_picd4=${pDto.p_picd4}&p_picd5=${pDto.p_picd5}">
								<img class="productsimg" src="../upload/${pDto.p_pic}"
								alt="${pDto.p_pic}" id="pwicon1">
							</a>
							<p id="pname">${pDto.p_name}</p>
							<div id="pinfowidth">
								<p id="pinfo">${pDto.p_info}</p>
							</div>
							<!-- 29 -->
							<p id="pname">
								<fmt:formatNumber value="${pDto.p_price}" pattern="#,###"/> 원
							</p>
						</div>
					</c:forEach>
				</div>
				<div id="productlistnum">

					<c:if test="${map.nDto.page<=1}">
						<div>처음</div>
					</c:if>
					<c:if test="${map.nDto.page>1}">
						<div>
							<a class="productlistnumorder"
								href="product_list?category=${map.nDto.category}&searchword=${map.nDto.searchword}&page=1&pc_no=${map.nDto.pc_no}">처음</a>
						</div>
					</c:if>
					<c:if test="${map.nDto.page<=1}">
						<div>이전</div>
					</c:if>
					<c:if test="${map.nDto.page>1}">
						<div>
							<a class="productlistnumorder"
								href="product_list?category=${map.nDto.category}&searchword=${map.nDto.searchword}&page=${map.nDto.page-1}&pc_no=${map.nDto.pc_no}">이전</a>
						</div>
					</c:if>
					<c:forEach begin="${map.nDto.startpage}" end="${map.nDto.endpage}"
						var="nowpage">
						<c:if test="${nowpage==map.nDto.page}">
							<div>${nowpage}</div>
						</c:if>
						<c:if test="${nowpage!=map.nDto.page}">
							<div id="productlistnumpage">
								<a class="productlistnumorder"
									href="product_list?category=${map.nDto.category}&searchword=${map.nDto.searchword}&page=${nowpage}&pc_no=${map.nDto.pc_no}">${nowpage}</a>
							</div>
						</c:if>
					</c:forEach>
					<c:if test="${map.nDto.page<map.nDto.maxpage}">
						<div>
							<a class="productlistnumorder"
								href="product_list?category=${map.nDto.category}&searchword=${map.nDto.searchword}&page=${map.nDto.page+1}&pc_no=${map.nDto.pc_no}">다음</a>
						</div>
					</c:if>
					<c:if test="${map.nDto.page>=map.nDto.maxpage}">
						<div>다음</div>
					</c:if>

					<c:if test="${map.nDto.page<map.nDto.maxpage}">
						<div>
							<a class="productlistnumorder"
								href="product_list?category=${map.nDto.category}&searchword=${map.nDto.searchword}&page=${map.nDto.maxpage}&pc_no=${map.nDto.pc_no}">끝</a>
						</div>
					</c:if>
					<c:if test="${map.nDto.page>=map.nDto.maxpage}">
						<div>끝</div>
					</c:if>

				</div>
				<!-- numberling -->
			</div>
			<!--right area  -->
		</div>
	</section>
	<%@include file="../base/footer.jsp"%>
</body>
</html>