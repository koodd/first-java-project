<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jstl태그</title>
		<style type="text/css">
		  table,th,td{border:1px solid black; border-collapse: collapse;}
		</style>
	</head>
	<body>
	<!-- for문 for(int i=1;i<=10;i++) -->
	   <table>
          <tr>
            <th>단</th>
            <th>*</th>
            <th>수</th>
            <th>=</th>
            <th>값</th>
          </tr>	   
	<c:forEach var="i" begin="1" end="9"  step="1" >
          <tr>
            <td>2</td>
            <td>*</td>
            <td>${i}</td>
            <td>=</td>
            <td>${2*i}</td>
          </tr>	   
	</c:forEach>
	   </table>
	
	
	
	<hr>
	<!-- switch문 같음 -->
	<c:set var="bname" value="유관순" />
	<c:set var="chk" value="5" />
	<c:choose>
	 <c:when test="${ chk%2==0 }">
	    <h2>이름은 홍길동 : ${bname} 입니다.</h2>
	 </c:when>
	 <c:otherwise>
	    <h2>이름은 그외 : ${bname},${chk} 입니다.</h2>
	 </c:otherwise>
	</c:choose>
	
	
	
	<hr>
	<!-- if문 -->
	<c:if test="${chk%2==0}">
	  <h2>짝수입니다.</h2>
	</c:if>
	<c:if test="${chk%2!=0}">
	  <h2>홀수입니다.</h2>
	</c:if>
	<hr>
	
	
	</body>
</html>