<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="managerindex.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>체험 프로그램 목록</title>

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap4/bootstrap.min.css">
    <link rel="stylesheet" href="../css/exp_List.css">
    <link rel="stylesheet" href="../css/footer.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body style="margin: 0 auto; width: 1200px;">

    <script src="../js/header.js"></script>

    <h2>체험 수정/등록 리스트</h2>
    <hr>
    <div class="wrapper">
        <form action="" name="search" id="search" method="post">
            <select name="category" id="category">
                <option value="all">전체</option>
                <option value="e_name">제목</option>
                <option value="e_details">내용</option>
            </select>
            <input type="text" name="searchWord" id="searchWord" size="16">
            <button class="searchbtn" type="submit">검색</button>            
        </form>
    </div>

    <table class="exp_BookList_table">
        <colgroup>
            <col width="15%">
            <col width="15%">
            <col width="20%">
            <col width="10%">
            <col width="20%">
            <col width="10%">
            <col width="10%">
        </colgroup>
        <thead class="exp_Bookthead">
            <tr>
                <td>체험 번호</td>
                <td>농장주 명</td>
                <td>농장주 연락처</td>
                <td>체험제공기간</td>
                <td>체험등록일</td>
                <td>게시글 승인여부</td>
                <td>게시글 자세히보기</td>
            </tr>
        </thead>
        <tbody class="exp_Booktbody">
            <tr>
                <th>111</th>
                <th><a>최건호</a></th>
                <th>01081213567</th>
                <th>3시간</th>
                <th>2021-11-14</th>
                <th>0</th>
                <th><button type="button" class="managerBtn" onclick="location.href='/manager/exp_View_Manager'">자세히보기</button></th>
            </tr>
        </tbody>
    </table>
    
    
    
<!-- 페이징 넘버링 -->


    <ul class="page-num">
        <li class="first"></li>
        <li class="prev"></li>
        <li class="num"><div>1</div></li>
        <li class="next"></li>
        <li class="last"></li>
    </ul>


</body>
</html>