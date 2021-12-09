<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>Dashboard</title>

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

</head>

<body class="animsition">
    <div class="page-wrapper">
        <!-- 메뉴 바 -->
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="./manager_index">
                    <img src="../images/logo.png" alt="Cool Admin" />
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-table"></i>게시판관리</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="man_board_list">커뮤니티 게시판 관리</a>
                                </li>
                                <li>
                                    <a href="man_public_board_list">공지사항 관리</a>
                                </li>
                                <li>
                                    <a href="man_info_board">정보 게시글 관리</a>
                                </li>
                                <li>
                                    <a href="man_board_report_list">게시글 신고 내역</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a class="js-arrow" href="#">
                                <i class=" fas fa-table"></i>농장 & 체험 목록</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="./man_farm_list">모든 농장 목록</a>
                                </li>
                                <li>
                                    <a href="./man_exp_list">모든 체험 목록</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a class="js-arrow" href="#">
                                <i class="far fa-check-square"></i>등록 & 수정 신청 내역</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="./man_farm_regi_list">농장 등록 & 수정 신청</a>
                                </li>
                                <li>
                                    <a href="./man_exp_regi_list">체험 등록 & 수정 신청</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="./man_product_list">
                                <i class="fas fa-calendar-alt"></i>판매 상품 관리</a>
                        </li>
                        <li>
                            <a href="./man_pur_list">
                                <i class="fas fa-calendar-alt"></i>주문 취소 관리</a>
                        </li>
                        <li>
                            <a class="js-arrow" href="#">
                                <i class="fas fa-calendar-alt"></i>이용자 예약 내역</a>
                            <ul class="list-unstyled navbar__sub-list js-sub-list">
                                <li>
                                    <a href="./man_farm_reser_list">농장 예약</a>
                                </li>
                                <li>
                                    <a href="../manager/man_exp_book">체험 예약</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="./man_user_inquiry">
                                <i class="fas fa-copy"></i>1:1문의 내역</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>
        <!-- 메뉴 바 -->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap account2">
                            <!-- 헤더부분 -->
                            <a href="../main" style="font-size: 25px;">관리자 페이지 닫기</a>
                        </div>
                    </div>
                </div>
            </header>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>

    </div>

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
  // USE STRICT
  "use strict";

  try {
    // 월별 매출 현황
    const brandProduct = 'rgba(0,181,233,0.8)'
    const brandService = 'rgba(0,173,95,0.8)'

    var elements = 10
    //이 부분을 건드려볼 것
    var data1 = [52, 60, 55, 50, 65, 80, 57, 70, 105, 115, 30, 50]
    var data2 = [102, 70, 80, 100, 56, 53, 80, 75, 65, 90, 60, 120]

    var ctx = document.getElementById("recent-rep-chart");
    if (ctx) {
      ctx.height = 250;
      var myChart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
          datasets: [
            {
              label: '예약매출액',
              backgroundColor: brandService,
              borderColor: 'transparent',
              pointHoverBackgroundColor: '#fff',
              borderWidth: 0,
              data: data1

            },
            {
              label: '상품매출액',
              backgroundColor: brandProduct,
              borderColor: 'transparent',
              pointHoverBackgroundColor: '#fff',
              borderWidth: 0,
              data: data2

            }
          ]
        },
        options: {
          maintainAspectRatio: true,
          legend: {
            display: false
          },
          responsive: true,
          scales: {
            xAxes: [{
              gridLines: {
                drawOnChartArea: true,
                color: '#f2f2f2'
              },
              ticks: {
                fontFamily: "Poppins",
                fontSize: 12
              }
            }],
            yAxes: [{
              ticks: {
                beginAtZero: true,
                maxTicksLimit: 5,
                stepSize: 50,
                max: 150,
                fontFamily: "Poppins",
                fontSize: 12
              },
              gridLines: {
                display: true,
                color: '#f2f2f2'

              }
            }]
          },
          elements: {
            point: {
              radius: 0,
              hitRadius: 10,
              hoverRadius: 4,
              hoverBorderWidth: 3
            }
          }


        }
      });
    }

    // 매출 비율 차트
    var ctx = document.getElementById("percent-chart");
    if (ctx) {
      ctx.height = 280;
      var myChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
          datasets: [
            {
              label: "My First dataset",
              data: [60, 20, 40],
              backgroundColor: [
                '#00b5e9',
                '#fa4251',
                '#00ad5f'
              ],
              hoverBackgroundColor: [
                '#00b5e9',
                '#fa4251',
                '#00ad5f'
              ],
              hoverBorderColor: [
                'transparent',
                'transparent',
                'transparent'
              ]
            }
          ],
          labels: [
            '상품판매',
            '농장예약',
            '체험예약'
          ]
        },
        options: {
          maintainAspectRatio: false,
          responsive: true,
          cutoutPercentage: 55,
          animation: {
            animateScale: true,
            animateRotate: true
          },
          legend: {
            display: false
          },
          tooltips: {
            titleFontFamily: "Poppins",
            xPadding: 15,
            yPadding: 10,
            caretPadding: 0,
            bodyFontSize: 16
          }
        }
      });
    }
  } catch (error) {
    console.log(error);
  }
})(jQuery);



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

</body>

</html>
<!-- end document-->
