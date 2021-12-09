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
    <hr>
    <h3 class="h3">${session_nickname} 님의 예약된 현황</h3>
    <span> * ${session_nickname} 님이 신청하신 프로그램의 예약 내역을 확인할수 있습니다.</span>
    <table class="exp_BookList_table">
        <colgroup>
            <col width="15%">
            <col width="15%">
            <col width="10%">
            <col width="15%">
            <col width="9%">
            <col width="18%">
            <col width="18%">
        </colgroup>
        <thead class="exp_Bookthead">
            <tr>
                <td>체험 예약 번호</td>
                <td>예약자</td>
                <td>예약자 연락처</td>
                <td>예약 인원</td>
                <td>결제 금액</td>
                <td>방문 날짜</td>
                <td>신청 예약 날짜</td>
            </tr>
        </thead>
        <tbody class="exp_Booktbody">
            <tr>
                <th>111</th>
                <th><a href="#">최건호</a></th>
                <th>01081213567</th>
                <th>4 명</th>
                <th>2021-11-20</th>
                <th>50000 원</th>
                <th>2021-11-17</th>
            </tr>
        </tbody>
    </table>

    <hr>
    <table class="exp_Book_table">
        <tr>
            <td class="exp_Book_td">
                이번달 체험 예약 건수는 :
            </td>
            <th>
                10 건
            </th>
        </tr>
        
        <tr>
            <td class="exp_Book_td">
               총 결제금액 :
            </td>
            <th>
               50,000 (원)
            </th>
        </tr>
        <!-- 총결제금액의 20% -->
        <!-- 관리자페이지에서는 20% 가격 보여주기 농장주페이지에선 결제금액의 80% -->
        <tr>
            <td class="exp_Book_td">
                체험 프로그램 수익금 :
            </td>
            <th>
               40,000 (원)
            </th>
        </tr>
    </table>

<%@ include file="../base/footer.jsp" %> 
</body>
</html>