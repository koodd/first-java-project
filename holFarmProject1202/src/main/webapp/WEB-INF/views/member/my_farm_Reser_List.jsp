<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../base/myPage.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
</head>
<body>
    <section class="f_res_list">
        <div>
            <h3>예약 내역</h3>
			<c:forEach items="${map.list }" var="fDto">
            <!-- 예약 내역 -->
            <div class="f_res_ll">
                <!-- 이미지 영역 -->
                <div class="f_res_img">
                    <img src="../images/farmSum.jpg" alt="">
                </div>
                <!-- 예약정보 영역 -->
                <div class="f_res_info">
                    <h3>${fDto.fr_name }</h3>
                    <h4>예약 신청일 : <span class="res_info_data">${fDto.frs_resdate }</span></h4>
                    <h4>사용 시작일 : <span class="res_info_data">${fDto.frs_startdate }</span></h4>
                    <h4>농장 주소 : <span class="res_info_data">${fDto.fr_addr }</span></h4>
                    <h4>농장주 연락처 : <span class="res_info_data">${fDto.u_phone }</span></h4>
                    <h4>예약한 구좌 번호 : <span class="res_info_data">${fDto.frs_account}</span></h4>
                </div>
                <!-- 가격정보 및 예약 취소 -->
                <div class="f_res_can">
                    <h4 class="yogum">요금 요약</h4>
                    <p><span class="hap">합계</span><span class="won">${fDto.py_price}원</span></p>
                    <button>예약취소</button>
                </div>
            </div>
            </c:forEach>
        </div>
    </section>
    <%@ include file="../base/footer.jsp" %>
    
</body>
<link rel="stylesheet" href="../css/farmregi.css">
</html>