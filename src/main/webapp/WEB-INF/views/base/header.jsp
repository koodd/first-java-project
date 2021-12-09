<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>해피홀팜</title>
    <link rel="stylesheet" href="../css/header.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style type="text/css">
    .h_body h1{margin:0;}
    .webMenu{margin:0;}
    </style>
</head>

<body>
    <header>
        <!--header{-->
        <section class="h_body">
            <h1><a href="../main"><img src="../images/logo.png" alt="웃다리문화촌 로고"></a></h1>
            <ol class="webMenu">
                <!--webMenu{-->
                <li><a href="#" id="atagt1">커뮤니티</a>
                    <ul class="headerList">
                        <li id="li1"><a href="../board/board_trade?bc_no=4" id="atag1">거래게시판</a></li>
                        <li><a href="../board/board_info" id="atag2">정보게시판</a></li>
                        <c:if test="${session_ucno==1 }">
                        <li><a href="../board/board_user?bc_no=2" id="atag4">유저게시판</a></li>
                        </c:if>
						<c:if test="${session_ucno==2 }">
                        <li><a href="../board/board_farm?bc_no=3">농장주게시판</a></li>
                        </c:if>
                        <li><a href="../board/board_free?bc_no=1" id="atag3">자유게시판</a></li>
                    </ul>
                </li>
                <li><a href="#" id="atagt2">농장</a>
                    <ul class="headerList">
                        <li><a href="../farm/farm_list" id="atag5">농장 목록</a></li>
                        <li><a href="../exp/exp_List" id="atag6">체험 프로그램</a></li>
                    </ul>
                </li>
                <li><a href="#" id="atagt3">판매상품</a>
                    <ul class="headerList">
                        <li><a href="../product/product_list" id="atag7">판매상품 목록</a></li>
                    </ul>
                </li>
                <li><a href="#" id="atagt4">고객센터</a>
                    <ul class="headerList">
                        <li><a href="../board/board_public" id="atag8">공지사항</a></li>
                        <li><a href="../customer/inquiry" id="atag9">1:1 문의</a></li>
                        <li><a href="../customer/faq" id="atag10">FAQ</a></li>
                    </ul>
                </li>
            </ol>
            <!--}webMenu-->
            <span class="headerUserSpan">
            <c:if test="${session_id == null }">
                <a href="../member/login" class="headerUser" id="atag11">로그인</a>
                <a href="../member/step01" class="headerUser" id="atag12">회원가입</a>
            </c:if>
            <c:if test="${session_id != null }">
                <a href="../member/my_index?u_no=${session_uno}" class="headerUser" style="background: none; border: none; font-size: 20px;">마이페이지</a>
                <a href="../member/logout" class="headerUser" style="background: none; border: none; font-size: 20px;">로그아웃</a>
            </c:if>
            <c:if test="${session_ucno == 3 }">
            	<a href="../manager/manager_index" class="headerUser" style="background: none; border: none; font-size: 20px;">관리자</a>
            </c:if>
            </span>
        </section>
    </header>
    <!--}header-->
    <script src="../js/header.js"></script>
</body>

</html>