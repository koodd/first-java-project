<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<%@ include file="../base/managerbase.jsp" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>상품관리</title>
		
		<link rel="stylesheet" href="../css/bootstrap.min.css">
		
		<link rel="stylesheet" href="../css/productm.css">
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		  <script type="text/javascript">
		  	$(function(){	
				$("#request1").click(function(){
					location.href="./man_product_reg";
				});
		  	});
		  </script>
		  
	</head>
	<body>
	
		<section>
			<div id="maindiv">
				<div id="menubar">
				<br>
					<h2>상품 관리</h2><br>
					<form action="man_product_list" name="search" method="get">
						<input type="hidden" name="category" id="category" value="all"><br>
						<input type="text" id="searchword" name="searchword">
				  		<button type="submit" id="searchicon2"><img src="../images/glass1.jpg" alt="" id="searchicon1"></button><br>
				     </form>
					<div id="category1">
						<h2>카테고리</h2><br>
						<table id="categorytable1">
							<tr>
								<th><a href="man_product_list?category=${map.nDto.category}&searchword=${map.nDto.searchword}&page=1&pc_no=0">전체</a></th>
								<td>${c1+c2+c3+c4}</td>
							</tr>
							<tr>
								<th><a href="man_product_list?category=${map.nDto.category}&searchword=${map.nDto.searchword}&page=1&pc_no=1">농기구</a></th>
								<td>${c1}</td>
							</tr>
							<tr>
								<th><a href="man_product_list?category=${map.nDto.category}&searchword=${map.nDto.searchword}&page=1&pc_no=2">씨앗</a></th>
								<td>${c2}</td>
							</tr>
							<tr>
								<th><a href="man_product_list?category=${map.nDto.category}&searchword=${map.nDto.searchword}&page=1&pc_no=3">모종</a></th>
								<td>${c3}</td>
							</tr>
							<tr>
								<th><a href="man_product_list?category=${map.nDto.category}&searchword=${map.nDto.searchword}&page=1&pc_no=4">기타</a></th>
								<td>${c4}</td>
							</tr>
						</table>
						
					</div><br>
						<a href="../board/board_trade"><img class="leftboardeal" src="../images/m1.jpg" alt="e1_main.jpg" id="leftboardeal"></a><br>
					<div id="num3">
						<button type="button" class="btn btn-primary btn-sm btn-block" id="request1">
							<span id="request2">등록</span>
						</button>
					</div>
					
					
				</div>
				
				<div id="rightarea">
					<div id="productlist">
						<c:forEach items="${map.list}" var="pDto">
							<div class="products">
								<a href="./man_product_del?p_no=${pDto.p_no}">
								<img class="productsimg" src="../upload/${pDto.p_pic}" alt="${pDto.p_pic}" id="pwicon1"></a>
								<p id="pname">${pDto.p_name}</p>
								<div id="pinfowidth"><p id="pinfo">${pDto.p_info}</p></div>
								<p id="pname">${pDto.p_price} 원</p>
							</div>
						</c:forEach>
					</div><!-- productlist -->
					<div id="productlistnum">
							<c:if test="${map.nDto.page<=1}">
								<div>처음</div>
							</c:if>
							<c:if test="${map.nDto.page>1}">
								<div><a class="productlistnumorder" href="man_product_list?category=${map.nDto.category}&searchword=${map.nDto.searchword}&page=1&pc_no=${map.nDto.pc_no}">처음</a></div>
							</c:if>
							<c:if test="${map.nDto.page<=1}">
								<div>이전</div>
							</c:if>
							<c:if test="${map.nDto.page>1}">
								<div><a class="productlistnumorder" href="man_product_list?category=${map.nDto.category}&searchword=${map.nDto.searchword}&page=${map.nDto.page-1}&pc_no=${map.nDto.pc_no}">이전</a></div>
							</c:if>
						      <c:forEach begin="${map.nDto.startpage}" end="${map.nDto.endpage}" var="nowpage">
						      	<c:if test="${nowpage==map.nDto.page}">
							      <div>${nowpage}</div>
						      	</c:if>
						      	<c:if test="${nowpage!=map.nDto.page}">
									<div id="productlistnumpage">
										<a class="productlistnumorder" href="man_product_list?category=${map.nDto.category}&searchword=${map.nDto.searchword}&page=${nowpage}&pc_no=${map.nDto.pc_no}">${nowpage}</a>
									</div>
						      	</c:if>
						      </c:forEach>							
					      	<c:if test="${map.nDto.page<map.nDto.maxpage}">
								<div>
									<a class="productlistnumorder" href="man_product_list?category=${map.nDto.category}&searchword=${map.nDto.searchword}&page=${map.nDto.page+1}&pc_no=${map.nDto.pc_no}">다음</a>
								</div>
					      	</c:if>
					      	<c:if test="${map.nDto.page>=map.nDto.maxpage}">
					      		<div>다음</div>
					      	</c:if>
					      	<c:if test="${map.nDto.page<map.nDto.maxpage}">							
								<div>
									<a class="productlistnumorder" href="man_product_list?category=${map.nDto.category}&searchword=${map.nDto.searchword}&page=${map.nDto.maxpage}&pc_no=${map.nDto.pc_no}">끝</a>
								</div>
							</c:if>
					      	<c:if test="${map.nDto.page>=map.nDto.maxpage}">
					      		<div>끝</div>
					      	</c:if>
					</div><!-- numberling -->
				</div><!--right area  -->
			</div>
		</section>

	</body>
</html>