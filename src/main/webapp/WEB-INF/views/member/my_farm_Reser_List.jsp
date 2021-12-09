<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../base/myPage.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
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
    		var stDate = $("#startDate").text();
    		if(stDate <= today){
    			$("#cancelBtn").css({"display":"none"});
    		}
    	});
    </script>
</head>
<body>
    <section class="f_res_list">
        <div>
            <h3 style="margin-left:100px; margin-bottom:30px;">예약 내역</h3>
			<c:forEach items="${map.list }" var="fDto">
            <!-- 예약 내역 -->
            <div class="f_res_ll">
                <!-- 이미지 영역 -->
                <div class="f_res_img">
                    <img src="../upload/${fDto.fr_thumb }" alt="">
                </div>
                <!-- 예약정보 영역 -->
                <div class="f_res_info">
                    <h3 id="fr_name">${fDto.fr_name }</h3>
                    <h4>예약 신청일 : <span class="res_info_data">${fDto.frs_resdate }</span></h4>
                    <h4>사용 시작일 : <span class="res_info_data" id="startDate">${fDto.frs_startdate }</span></h4>
                    <h4>농장 주소 : <span class="res_info_data">${fDto.fr_addr }</span></h4>
                    <h4>농장주 연락처 : <span class="res_info_data">${fDto.u_phone }</span></h4>
                    <h4>예약한 구좌 번호 : <span class="res_info_data" id="frs_account">${fDto.frs_account}</span></h4>
                </div>
                <input type="hidden" id="py_no" value="${fDto.py_no }">
                <!-- 가격정보 및 예약 취소 -->
                <div class="f_res_can">
                    <h4 class="yogum">요금 요약</h4>
                    <p><span class="hap">합계</span><span class="won"><fmt:formatNumber value="${fDto.py_price}" pattern="#,###"/>원</span></p>
                    <c:if test="${fDto.frs_status=='true' }">
                    <button type="button" id="cancelBtn">예약취소</button>
                    </c:if>
                    <c:if test="${fDto.frs_status=='false' }">
                    <button type="button" id="cancelBtn2">예약이 취소된 농장</button>
                    </c:if>
                </div>
            </div>
            </c:forEach>
        </div>
        <script type="text/javascript">
        $(function(){
        	 $("#cancelBtn").click(function(){
        		 var py_no = $("#py_no").val();
        		 
        		 if(confirm("정말 예약을 취소하시겠습니까?")){
        		 	alert("예약 취소가 정상처리 되었습니다."); 
        			location.href="./my_farm_res_cancel?py_no="+py_no+"&u_no=${session_uno}";
        		 }else{
        			 return false;
        		 }
    		});
        });
        </script>
    </section>
    <%@ include file="../base/footer.jsp" %>
    
</body>
<link rel="stylesheet" href="../css/farmregi.css">
</html>