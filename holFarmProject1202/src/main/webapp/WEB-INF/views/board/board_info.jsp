<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<!-- saved from url=(0054)http://www.wootdali.or.kr/wt_community/notice_list.php -->
<html>

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>해피홀팜</title>
    <style>

    </style>
</head>

<body>



    <%@ include file="../base/header.jsp" %>

 


    <section>
        <div class="mainimg">
            <img src="../images/board01.jpg.crdownload">

            <div class="p_message">
                <span><a href="../main" style="color: blue;">HOME</a>>커뮤니티>정보게시판</span>
            </div>
        </div>
    </section>





    <section id="tabMenuArea">
        <!--TabMenuArea{-->
        <table class="tabMenu">
            <!--tabMenu{-->
            <colgroup>
                <col width="25%">
                <col width="25%">
                <col width="25%">
                <col width="25%">

            </colgroup>
            <tbody>
               <tr>
							<td>
								<p>
									<a href="board_trade?bc_no=4" style="border-right: none;">유저거래</a>
								</p>
							</td>
							<td class="on">
								<p>
									<a href="board_info" style="border: none;">정보게시판</a>
								</p>
							</td>
								<c:if test="${session_ucno==1}">
							
							 	<td  "><p><a href="board_user?bc_no=2" style="border-left: none;">유저게시판</a></p></td>
							</c:if>
							<c:if test="${session_ucno==2}">
							<td>
								<p>
								 	<a href="board_farm?bc_no=3" style="border-left: none;">농장주게시판</a>
								</p>
							</td>
							</c:if>
							<td>
								<p>
									<a href="board_free?bc_no=1" style="border-left: none;">자유게시판</a>
								</p>
							</td>
						</tr>
            </tbody>
        </table>
        <!--}tabMenu-->
        <div class="wid1200"><span class="whiteBar whiteBar400" style="left: 400px;"></span></div>
    </section>
    <!--}TabMenuArea-->
    <!--}상단 이미지 화면~탭메뉴 호출-->


    <section id="contentArea">
        <!--contentArea{-->
        <div class="contentTitle">
            <p>정보게시판</p>
        </div>
    </section>

    <!-- Post -->
    <section class="bg0 ">
        <div class="container">    
                    <div class="row">
                    	<c:forEach items="${map.list}" var="bDto">
                        <div class="col-sm-6 ">
                            <!-- Item latest -->
                            <div class="board_info">
                                <a href="board_public_view" class="boardinfo_img">
                                <div>
                                    <img src="../images/main3.jpg" alt="IMG">
                                </div>
                                </a>

                                <div class="board_info_l">
                                    <h5 class="board_info_m">
                                        <a href="board_public_view" class="board_info_s ">${bDto.bn_title }</a>
                                    </h5>

                                    <span class="board_info_date">
                                        
                                            ${bDto.bn_date }

                                        <span class="board_info_hit">
                                            조회수 : ${bDto.bn_hit }
                                        </span>
                                    </span>
                                </div>
                            </div>
                        </div>
						</c:forEach>
						
                        <!-- <div class="col-sm-6 ">
                            Item latest
                            <div class="board_info">
                                <a href="board_public_view" class="boardinfo_img ">
                                  <div>
                                    <img src="../images/main3.jpg" alt="IMG">
                                </div>
                                </a>

                                <div class="board_info_l">
                                    <h5 class="board_info_m">
                                        <a href="board_public_view" class="board_info_s ">
                                           이것은 매우 좋다.
                                        </a>
                                    </h5>

                                    <span class="board_info_date">
                                        
                                            2021-11-17

                                        <span class="board_info_hit">
                                            조회수 :
                                        </span>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 ">
                            Item latest
                            <div class="board_info">
                                <a href="#" class="boardinfo_img ">
                                   <div>
                                    <img src="../images/main3.jpg" alt="IMG">
                                </div>
                                </a>

                                <div class="board_info_l">
                                    <h5 class="board_info_m">
                                        <a href="#" class="board_info_s ">
                                           이것은 매우 좋다.
                                        </a>
                                    </h5>

                                    <span class="board_info_date">
                                        
                                            2021-11-17

                                        <span class="board_info_hit">
                                            조회수 :
                                        </span>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 ">
                            Item latest
                            <div class="board_info">
                                <a href="#" class="boardinfo_img">
                                <div>
                                    <img src="../images/logo.png" alt="IMG">
                                </div>
                                </a>

                                <div class="board_info_l">
                                    <h5 class="board_info_m">
                                        <a href="#" class="board_info_s ">
                                           이것은 매우 좋다.
                                        </a>
                                    </h5>

                                    <span class="board_info_date">
                                        
                                            2021-11-17

                                        <span class="board_info_hit">
                                            조회수 :
                                        </span>
                                    </span>
                                </div>
                            </div>
                        </div> -->
                </div>
                <div class="pageMove03">
                    <ul class="pageNumber03">
                        <li class="btn_next"><a href="#"><img src="../images/page_right3_new.gif" alt="이전"></a>
                        </li>
                        <li class="first"><a href="#"><span class="current">1</span></a>
                        </li>
                        <li class=""><a href="#"><span class="link_page">2</span></a></li>
                        <li class=""><a href="#"><span class="link_page">3</span></a></li>
                        <li class=""><a href="#"><span class="link_page">4</span></a></li>
                        <li class=""><a href="#"><span class="link_page">5</span></a></li>
                        <li class=""><a href="#"><span class="link_page">6</span></a></li>
                        <li class=""><a href="#"><span class="link_page">7</span></a></li>
                        <li class=""><a href="#"><span class="link_page">8</span></a></li>
                        <li class=""><a href="#"><span class="link_page">9</span></a></li>
                        <li class="last"><a href="#"><span class="link_page">10</span></a></li>
                        <li class="btn_next"><a href="#"><img src="../images/page_right1_new.gif" alt="다음"></a>
                        </li>
                    </ul>
                </div>

            </div>
        
    </section>
    



	 <%@ include file="../base/footer.jsp" %>

	<link rel="stylesheet" href="../css/board.css">

    


</body>

</html>




