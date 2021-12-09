<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../base/managerbase.jsp" %>

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
  <section id="contentArea">
        <!--contentArea{-->
        <div class="contentTitle">
            <p>정보 게시글 관리</p>
        </div>
        <!-- 게시판 삽입 -->



        <!--게시판 시작-->


        <div id="boardArea">
            <!--boardArea{-->
            <section class="b_table">
                <!--b_table{-->
		
                <div class="b_tr">
                    <!--b_tr{-->
                    <div class="b_th pboardnum">번호</div>
                    <div class="b_th pboardtitle">제목</div>
                    <div class="b_th pboarddate">등록일</div>
                    <div class="b_th pboardhit">조회</div>

                </div>
                <!--}b_tr-->
                <div class="b_tr">
                    <div class="b_td">1</div>
                    <div class="b_td b_title"><a href="#">제목 </a></div>
                    <div class="b_td b_dates">2021.09.24</div>
                    <div class="b_td b_dates">1</div>

                </div>
	
				
            </section>
            <!--}b_table-->
				<div class="manage_btn">
					<button type="button" onclick="location.href='boardWriteMg'">글작성</button>
				</div>

        </div>
        <!--}boardArea-->
      
      
        <!-- 게시판 삽입 -->
    </section>
 
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



	<link rel="stylesheet" href="../css/board.css">
</body>

</html>



