<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../base/myPage.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>체험 예약현황</title>

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap4/bootstrap.min.css">
    <link rel="stylesheet" href="../css/exp_Book.css">
    <link rel="stylesheet" href="../css/footer.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	   $(function(){
	      var now = new Date();
	      var year = now.getFullYear();
	      var month = now.getMonth()+1;
	      var date = now.getDate();
	      if(date<10){
	    	  date = "0"+date;
	      }
	      var today = year+"-"+month+"-"+date;

	      if($("#visitdate").text() >= today){

	      }else{
	         $("#cancelBtn").css({"display":"none"});
	      }    
	   });
	   
	   function expCancelBtn(eno){
			if(confirm("정말 예약을 취소하시겠습니까?")){
				location.href="./cancelExpReser?e_no="+eno+"&u_no=${session_uno}"
/* 				$("#cancelExpReser").submit(); */
			}else{
				return false;
			}
	   }
	</script>
    
</head>
<body style="margin: 0 auto; width: 1200px;">
    <script src="../js/header.js"></script>
    <h2>체험예약 현황</h2>
    <hr>
    <h3 class="h3">나의 예약 현황</h3>
    <span> * 체험명을 클릭하시면 상세보기 페이지로 이동합니다.</span>
    <form action="./cancelExpReser" name="cancelExpReser" id="cancelExpReser" method="post">    
    	<input type="hidden" name="u_no" value="${session_uno}">
	    <table class="exp_BookList_table">
	        <colgroup>
	            <col width="10%">
	            <col width="11%">
	            <col width="16%">
	            <col width="11%">
	            <col width="16%">
	            <col width="13%">
	            <col width="14%">
	            <col width="9%">
	        </colgroup>
	        <thead class="exp_Bookthead">
	            <tr>
	                <td>예약 인원</td>
	                <td>체험 명</td>
	                <td>이용 요금</td>
	                <td>체험 제공 기간</td>
	                <td>농장주 연락처</td>
	                <td>신청 예약 날짜</td>
	                <td>방문 날짜</td>
	                <td>예약 취소</td>
	            </tr>
	        </thead>
	        <c:forEach items="${map.list}" var="eDto">
		        <tbody class="exp_Booktbody">
		            <tr>
		                <th>${eDto.er_people}</th>
		                <th><a href="../exp/exp_View?e_no=${eDto.e_no}">${eDto.e_name}</a></th>
		                <th><fmt:formatNumber value="${eDto.py_price}" pattern="#,###"/> 원</th>
		                <th>${eDto.e_term} 시간</th>
		                <th>${eDto.u_phone}</th>
		                <th>${eDto.er_resdate}</th>
		                <th id="visitdate">${eDto.er_visitdate}</th>
		                <th><button type="button" id="cancelBtn" onclick="expCancelBtn(${eDto.e_no})">취소</button></th>
		            </tr>
		        </tbody>
	        </c:forEach>
	    </table>
	</form>
    <hr>

  <%@ include file="../base/footer.jsp" %> 
</body>
</html>