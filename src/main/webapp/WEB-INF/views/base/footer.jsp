<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="../css/footer.css">
    

</head>

<body>
    <footer class="site-footer border-top">
        <div class="container">
            <div class="row">
                <div class="f_contents">
                    <div class="row">
                        <div class="f_contents_tit">
                            <h3>컨텐츠</h3>
                        </div>
                        <div class="t_box">
                            <ul class="cumu">
                                <li><a href="../board/board_trade?bc_no=4" id="atag1">거래게시판</a></li>
                                <li><a href="../board/board_info" id="atag2">정보게시판</a></li>
                                <c:if test="${session_ucno==1 }">
                                <li><a href="../board/board_user?bc_no=2" id="atag4">유저게시판</a></li>
                                </c:if>
                                <c:if test="${session_ucno==2 }">
                                <li><a href="../board/board_farm?bc_no=3">농장주게시판</a></li>
                                </c:if>
                                <li><a href="../board/board_free?bc_no=1" id="atag3">자유게시판</a></li>
                            </ul>
                        </div>
                        <div class="t_box">
                            <ul class="cumu">
                                <li><a href="../farm/farm_list" id="atag5">농장 목록</a></li>
                                <li><a href="../exp/exp_List" id="atag6">체험 프로그램</a></li>
                            </ul>
                        </div>
                        <div class="t_box">
                            <ul class="cumu">
                                <li><a href="../product/product_list" id="atag7">판매상품 목록</a></li>
                            </ul>
                        </div>
                        <div class="t_box">
                            <ul class="cumu">
                                <li><a href="../board/board_public" id="atag8">공지사항</a></li>
                                <li><a href="../customer/inquiry" id="atag9">1:1 문의</a></li>
                                <li><a href="../customer/faq" id="atag10">FAQ</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="f_contents_main">
                    <h3 class="footer-heading mb-4">해피홀팜</h3>
                    <a href="../main" class="block-6"> <!-- 22 -->
                        <img src="../images/logo.png" alt="해피홀팜" class="img-fluid rounded mb-4">
                        <h3 class="font-weight-light  mb-0">경험을 쌓는 주말농장</h3>
                        <p>주말농장 since 2021.11</p>
                    </a>
                </div>
                <div class="f_contents_main">
                    <div class="block-5 mb-5">
                        <h3 class="">문의사항</h3>
                        <ul class="cumu">
                            <li class="address">서울 구로구 디지털로34길 27 대륭포스트타워 3차 한국직업전문학교</li>
                            <li class="phone">한희태, 황선필, 김영환, 최건호</li>
                            <li class="email">cnksncks0411@naver.com</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body>

</html>