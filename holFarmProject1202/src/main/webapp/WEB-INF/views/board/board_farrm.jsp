<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- saved from url=(0054)http://www.wootdali.or.kr/wt_community/notice_list.php -->

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>해피홀팜</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    


</head>

<body>

 <%@ include file="../base/header.jsp" %>
 

    <section>
        <div class="mainimg">
            <img src="../images/board01.jpg.crdownload">

            <div class="p_message">
                <span><a href="../main" style="color: black;">HOME</a>>커뮤니티>농장주게시판</span>
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
									<a href="board_trade" style="border-right: none;">유저거래</a>
								</p>
							</td>
							<td>
								<p>
									<a href="board_info" style="border: none;">정보게시판</a>
								</p>
							</td>
							 <!--  	<td  "><p><a href="#" style="border-left: none;">유저게시판</a></p></td>-->
							<td class="on">
								<p>
									<a href="board_farrm" style="border-left: none;">농장주게시판</a>
								</p>
							</td>
							<td>
								<p>
									<a href="board_free" style="border-left: none;">자유게시판</a>
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
                    <p>농장주게시판</p>
                </div>

                <!-- 게시판 삽입 -->



                <!--게시판 시작-->


                <div id="boardArea">
                    <!--boardArea{-->
                    <section class="b_table">
                        <!--b_table{-->

                        <div class="b_tr">
                            <!--b_tr{-->
                            <div class="b_th boardnum">번호</div>
                            <div class="b_th boardtitle">제목</div>
                            <div class="b_th boardwriter">글쓴이</div>
                            <div class="b_th boarddate">등록일</div>
                            <div class="b_th boardhit">조회</div>

                        </div>
                        <!--}b_tr-->
                        <div class="b_tr">
                            <div class="b_td">1</div>
                            <div class="b_td b_title"><a href=board_comm>제목 </a></div>
                            <div class="b_td b_dates">김영환</div>
                            <div class="b_td b_dates">2021.09.24</div>
                            <div class="b_td b_dates">1</div>

                        </div>



                    </section>
                    <!--}b_table-->


                </div>
                <!--}boardArea-->

                <!-- 게시판 삽입 -->
                <div class="board_btn">
                    <div><button type="button" id="user_write_btn" onclick="location.href='board_write'">글쓰기</button></div>
                   </div>
            </section>
            <!--}contentArea-->
            <section>

                <div class="pageMove03">
                    <ul class="pageNumber03">
                        <li class="btn_next"><a href="#"><img src="../images/page_right3_new.gif" alt="이전"></a></li>
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
                        <li class="btn_next"><a href="#"><img src="../images/page_right1_new.gif" alt="다음"></a></li>
                    </ul>
                </div>

                <div class="nav">
                    <div class="s_search">
                        <div class="s_down">
                            <div id="search_box_type">
                                <select name="searchTitle" id="" style="border: none;">
                                    <option value="title">제목&nbsp;&nbsp;&nbsp;</option>
                                    <option value="title">내용&nbsp;&nbsp;&nbsp;</option>
                                    <option value="title">글쓴이&nbsp;&nbsp;&nbsp;</option>
                                </select>
                            </div>
                        </div>
                        <div class="s_search_btn">
                            <input name="search" type="text" value="" class="s_sch">
                            <input type="image" src="../images/btn_s_sch.gif">
                        </div>
                    </div>
                </div>

            </section>







 <%@ include file="../base/footer.jsp" %>

	<link rel="stylesheet" href="../css/board.css">


</body>

</html>




