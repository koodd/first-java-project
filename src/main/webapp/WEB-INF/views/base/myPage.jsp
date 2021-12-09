<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>농장 상세보기</title>

    <!-- Fontfaces CSS-->
    <link href="../css/font-face.css" rel="stylesheet" media="all">
    <link href="../vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="../vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="../vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="../vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="../vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="../vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="../vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="../vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="../vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="../vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="../vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="../css/theme.css" rel="stylesheet" media="all">

    <style>
        
    </style>

    
</head>
<body>
    <%@include file="../base/header.jsp" %>
    <!-- 사이드 바 -->
    <aside class="menu-sidebar d-none d-lg-block" style="margin-top: 100px;">
        <div>
            <nav class="navbar-sidebar">
                <h2><a href="./my_index?u_no=${session_uno}">마이페이지</a></h2>
                <ul class="list-unstyled navbar__list">
                    <li class="has-sub">
                        <a class="js-arrow" href="#">회원정보</a>
                        <ul class="list-unstyled navbar__sub-list js-sub-list">
                            <li>
                                <a href="../member/my_checkPw">회원정보 수정</a>
                            </li>
                            <li>
                                <a href="../member/my_withdrawal?u_no=${session_uno}">회원탈퇴</a>
                            </li>
                            <li>
                                <a href="../member/my_board_list">나의 게시글</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="js-arrow" href="#">상품</a>
                        <ul class="list-unstyled navbar__sub-list js-sub-list">
                            <li>
                                <a href="../member/my_pur_list">상품 구매내역</a>
                            </li>
                            <li>
                                <a href="../member/my_cart">장바구니</a>
                            </li>
                        </ul>
                    </li>
                    <!-- 사용자 -->
                    <c:if test="${session_ucno==1 }">
                    <li>
                        <a class="js-arrow" href="#">예약내역</a>
                        <ul class="list-unstyled navbar__sub-list js-sub-list">
                            <li>
                                <a href="../member/my_farm_Reser_List?u_no=${session_uno}">농장 예약 내역</a>
                            </li>
                            <li>
                                <a href="../member/my_exp_myBook?u_no=${session_uno}">체험 예약 내역</a>
                            </li>
                        </ul>
                    </li>
                    </c:if>
                    <!-- 농장주 -->
                    <c:if test="${session_ucno==2 }">
                    <li>
                        <a class="js-arrow" href="#">농장&체험 수정</a>
                        <ul class="list-unstyled navbar__sub-list js-sub-list">
                            <li>
                                <a href="../member/my_farm_Updet?s_uno=${session_uno }">농장 정보 수정</a>
                            </li>
                            <li>
                                <a href="../member/my_exp_regmodify?u_no=${session_uno}">체험 정보 수정</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="js-arrow" href="#">농장&체험 관리</a>
                        <ul class="list-unstyled navbar__sub-list js-sub-list">
                            <li>
                                <a href="../member/my_farm_Reser_Now?u_no=${session_uno}">농장 예약 현황</a>
                            </li>
                            <li>
                                <a href="../member/my_exp_book?u_no=${session_uno}">체험 예약 현황</a>
                            </li>
                        </ul>
                    </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </aside>
</body>
<!-- Jquery JS-->
<script src="../js/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JS-->
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<!-- Vendor JS       -->
<script src="../js/animsition.min.js"></script>
<script src="../js/Chart.bundle.min.js"></script>

    <!-- 메인 스크립트-->
    <script>
        (function ($) {
            // 없으면 안 됨
            "use strict";
            var navbars = ['header', 'aside'];
            var hrefSelector = 'a:not([target="_blank"]):not([href^="#"]):not([class^="chosen-single"])';
            var linkElement = navbars.map(element => element + ' ' + hrefSelector).join(', ');
            $(".animsition").animsition({
              inClass: 'fade-in',
              outClass: 'fade-out',
              inDuration: 900,
              outDuration: 900,
              linkElement: linkElement,
              loading: true,
              loadingParentElement: 'html',
              loadingClass: 'page-loader',
              loadingInner: '<div class="page-loader__spin"></div>',
              timeout: false,
              timeoutCountdown: 5000,
              onLoadEvent: true,
              browser: ['animation-duration', '-webkit-animation-duration'],
              overlay: false,
              overlayClass: 'animsition-overlay-slide',
              overlayParentElement: 'html',
              transition: function (url) {
                window.location.href = url;
              }
            });
          
          
          })(jQuery);
        
          //왼쪽 메뉴 바
        (function ($) {
          // USE STRICT
          "use strict";
          try {
            var arrow = $('.js-arrow');
            arrow.each(function () {
              var that = $(this);
              that.on('click', function (e) {
                e.preventDefault();
                that.find(".arrow").toggleClass("up");
                that.toggleClass("open");
                that.parent().find('.js-sub-list').slideToggle("250");
              });
            });
        
          } catch (error) {
            console.log(error);
          }
        })(jQuery);
            </script>

</html>