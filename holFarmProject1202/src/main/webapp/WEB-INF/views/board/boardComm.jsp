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
		
	<%@ include file="header.jsp" %>


    <script src="./js/header.js"></script>

  
    <section id="contentArea">
        <!--contentArea{-->
        <div class="contentTitle">
            <p>유저 게시판</p>
        </div>

        <div id="content_view">
            <div class="content_view_top">
                <div id="content_view_title">나는야 밀림의왕</div>
                <!-- 날짜, hit 값 들어감 -->
                <div id="content_view_date"><span
                        style="padding-right: 20px; border-right: 1px solid #666;">2021-11-17</span><span
                        style="padding-left: 20px;">조회수 : </span><span>1</span></div>
            </div>
            <div>

            </div>

			<div id="content_view_mid">나는 밀림의 왕 사자다!</div>
			<div class="board_btn">
				<button type="button" id="content_btn_report">신고하기</button>
			</div>
			<div class="coment_view_comm_view">
                <div class="content_view_comm_top">
                    [유저]농사초보 <span>[2021.11.10]</span>
                </div>
                <div id="content_view_comm_textarea">
                    <textarea>이건 뭐에요??</textarea>
                    <button type="button">취소</button>
                    <button type="button">저장</button>
                </div>
                </div>

            <div class="coment_view_comm_view">
                <div class="content_view_comm_top">
                    [유저]농사초보 <span>[2021.11.10]</span>
                </div>
                <div id="coment_view_comm_modify">
                    이건 뭐에요??/*검색 부분*/
.nav {position:relative; clear:both;}

                 </div>

                <button type="button">삭제</button>
                <button type="button">수정</button>
                
            </div>

            <div id="content_view_comm_write">
                <div id="content_view_comm_input">
                    <textarea placeholder="댓글을 입력하세요"></textarea>
                    <button type="button">등록</button>

                </div>
            </div>


            <div id="content_view_bottom1">

                <label>이전글</label>
                <div id="content_view_prev">
                    <a href="#">멋쟁이 토마토 토마토!</a>
                </div>
            </div>
            <div id="content_view_bottom2">
                <label>다음글</label>
                <div id="content_view_next"><a href="#">
                        나는야! 쥬스될꺼야
                    </a></div>
            </div>
            <dib>

            </dib>
            <div class="board_btn">
                <button type="button" class="content_btn">목록</button>
               </div>
        </div>



            

    </section>











  

	<%@ include file="footer.jsp" %>





<link rel="stylesheet" href="./css/board.css">
</body>

</html>



