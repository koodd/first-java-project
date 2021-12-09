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
    <title>체험 예약현황</title>

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap4/bootstrap.min.css">
    <link rel="stylesheet" href="../css/exp_Book.css">
    <link rel="stylesheet" href="../css/footer.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body style="margin: 0 auto; width: 1200px;">
    <script src="../js/header.js"></script>
    <h2>체험예약 현황</h2>
    <hr>
    <h3 class="h3">나의 예약 현황</h3>
    <span> * 체험명을 클릭하시면 상세보기 페이지로 이동합니다.</span>
    <table class="exp_BookList_table">
        <colgroup>
            <col width="9%">
            <col width="9%">
            <col width="10%">
            <col width="15%">
            <col width="10%">
            <col width="15%">
            <col width="12%">
            <col width="12%">
            <col width="8%">
        </colgroup>
        <thead class="exp_Bookthead">
            <tr>
                <td>예약자</td>
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
        <tbody class="exp_Booktbody">
            <tr>
                <th>최건호</th>
                <th>4</th>
                <th><a href="#">딸기체험</a></th>
                <th>50,000</th>
                <th>3 시간</th>
                <th>01081213567</th>
                <th>2021-11-17</th>
                <th>2021-11-20</th>
                <th><button type="button" id="cancelBtn">취소</button></th>
            </tr>
        </tbody>
    </table>

    <hr>

  <%@ include file="../base/footer.jsp" %> 
</body>
</html>