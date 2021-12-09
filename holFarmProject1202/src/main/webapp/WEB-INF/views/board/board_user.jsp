<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<!-- saved from url=(0054)http://www.wootdali.or.kr/wt_community/notice_list.php -->
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>해피홀팜</title>

<%-- <c:if test="${session_id ==null }">
  <script type="text/javascript">
     alert("로그인을 하셔야 서비스가 가능합니다.");
     history.back();
  </script>
</c:if> --%>

<%-- 			
			  <script type="text/javascript">
			  	var sessioncno = "${session_ucno}";
			  	
			  	if(sessioncno==1){
			  		
			     alert("로그인을 하셔야 서비스가 가능합니다.");
			     history.back();	  		
			  	}
			  </script>
		  --%>


</script>


</head>

<body>


	<%@ include file="../base/header.jsp"%>

	<section>
		<div class="mainimg">
			<img src="../images/board01.jpg.crdownload">

			<div class="p_message">
				<span><a href="../main"style="color: blue;">HOME</a>>커뮤니티>유저게시판</span>
			</div>
		</div>
	</section>



	<section>
		<div id="boardmargin">
			<!--wrapper{-->

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
							<td>
								<p>
									<a href="board_info?bc_no=2" style="border: none;">정보게시판</a>
								</p>
							</td>
								 	<td  class="on"><p><a href="board_user?bc_no=2" style="border-left: none;">유저게시판</a></p></td>
						<!--	<td>
								<p>
							 	<a href="board_farm?bc_no=3" style="border-left: none;">농장주게시판</a> 
								</p>
							</td>-->
							<td>
								<p>
									<a href="board_free?bc_no=1" style="border-left: none;">자유게시판</a>
								</p>
							</td>
						</tr>
					</tbody>
				</table>
				<!--}tabMenu-->
				<div class="wid1200">
					<span class="whiteBar whiteBar400" style="left: 400px;"></span>
				</div>
			</section>
			<!--}TabMenuArea-->
			<!--}상단 이미지 화면~탭메뉴 호출-->


			<section id="contentArea">
				<!--contentArea{-->
				<div class="contentTitle">
					<p>유저게시판</p>
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
							<div class="b_th boardwriter">닉네임</div>
							<div class="b_th boarddate">등록일</div>
							<div class="b_th boardhit">조회</div>
						</div>

				
						<!--}b_tr-->
					
						
					<c:forEach items="${map.list}" var="bTDto">
						
						<div class="b_tr">
							<div class="b_td">${bTDto.boardDto.bt_no}</div>
							<div class="b_td b_title">
							<c:forEach begin="1" end="${bTDto.boardDto.bt_indent}">
								>			
							</c:forEach>
								<a href="/board/board_comm?bc_no=${map.nDto.bc_no}&bt_no=${bTDto.boardDto.bt_no}&page=${map.nDto.page}&category=${map.nDto.category}&searchword=${map.nDto.searchword}">${bTDto.boardDto.bt_title}</a>								
							</div>
							<div class="b_td b_dates">${bTDto.memberDto.u_nickname}</div>
							<div class="b_td b_dates">${bTDto.boardDto.bt_date }</div>
							<div class="b_td b_dates">${bTDto.boardDto.bt_hit} </div>

						</div>

					</c:forEach>	




					</section>
					<!--}b_table-->


				</div>
				<!--}boardArea-->
				<div class="board_btn">
					<div>
						<button type="button" id="user_write_btn" onclick="location.href='board_write?bc_no=${map.nDto.bc_no}'" >글쓰기</button>
					</div>
				</div>

				<!-- 게시판 삽입 -->
			</section>
			<!--}contentArea-->
<ul class="page-num">
	
      <a href="board_user?bc_no=2&page=1&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><li class="first"></li></a>
      <c:if test="${map.nDto.page<=1}">
         <li class="prev"></li>
      </c:if>
      <c:if test="${map.nDto.page>1}">
         <a href="board_user?bc_no=2&page=${map.nDto.page-1}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><img src="../images/page_right3_new.gif" alt="이전"></a>
      </c:if>
      <c:forEach var="nowpage" begin="${map.nDto.startpage}" end="${map.nDto.endpage}">
         <li class="num">
           <c:if test="${map.nDto.page!=nowpage}">
             <a href="board_user?bc_no=2&page=${nowpage}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><div>${nowpage}</div></a>
           </c:if>
           <c:if test="${map.nDto.page==nowpage}">
             <div>${nowpage}</div>
           </c:if>
         </li>
      </c:forEach>
      <c:if test="${map.nDto.page<map.nDto.maxpage}">
        <a href="board_user?bc_no=2&page=${map.nDto.page+1}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"><img src="../images/page_right1_new.gif" alt="다음"></li></a>
      </c:if>
      <c:if test="${map.nDto.page>=map.nDto.maxpage}">
        <li class="next"></li>
      </c:if>
       <a href="board_user?bc_no=2&page=${map.nDto.maxpage}&category=${map.nDto.category}&searchword=${map.nDto.searchword}"></a>
   		 </ul>
        
        
     <!--    <div class="pageMove03">
            <ul class="pageNumber03">
                <li class="btn_next"><a href="#"><img src="../images/page_right3_new.gif" alt="이전"></a></li>
                <li class="first"><a href="#"><span class="current">1</span></a></li>

                <li class="btn_next"><a href="#"><img src="../images/page_right1_new.gif" alt="다음"></a></li>
            </ul>
        </div> -->

    <form action="./board_user" name="search" method="get">
        <div class="nav">
            <div class="s_search">
                <div class="s_down">
                    <div id="search_box_type">
                  
                       <input type="hidden" name="bc_no" value="2"> 
                  		
                        <select name="category" id="category" style="border: none;">
                            <option value="bt_title">제목&nbsp;&nbsp;&nbsp;</option>
                            <option value="bt_content">내용&nbsp;&nbsp;&nbsp;</option>    
                      </select>	
                    </div>
                </div>
                <div class="s_search_btn">
                    <input name="searchword" type="text" class="s_sch" id="searchword">
                    <button type="submit" style=""><img src="../images/btn_s_sch.gif"></button> 
               
                </div>
            </div>
        </div>
   </form> 

		



			<%@ include file="../base/footer.jsp"%>

			<link rel="stylesheet" href="../css/board.css">
</body>

</html>



