<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<!-- saved from url=(0054)http://www.wootdali.or.kr/wt_community/notice_list.php -->

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>해피홀팜</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">

</head>

<body>

	<%@ include file="../base/header.jsp"%>



	<section>
		<div class="mainimg">
			<img src="../images/board01.jpg.crdownload">

			<div class="p_message">
				<span><a href="../main">>HOME</a>>커뮤니티>게시글작성</span>
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
					<!-- 	<td><p><a href="#" style="border-left: none;">유저게시판</a></p></td>-->
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
		<div class="wid1200">
			<span class="whiteBar whiteBar400" style="left: 400px;"></span>
		</div>
	</section>
	<!--}TabMenuArea-->
	<!--}상단 이미지 화면~탭메뉴 호출-->


	<section id="contentArea">
		<!--contentArea{-->
		<div class="contentTitle">
			<p>농장주게시판</p>
		</div>


	</section>
	<!--}contentArea-->



	<section id="wholewrite">
		<div class="container">
			<div class="col-lg-3">
				<div class="writearea_md">
					<div id="titlearea">
						<label>제목</label> <input type="text" placeholder="제목을 입력해주세요">
					</div>
					<div id="uploadarea">
						<label>파일명</label> <input type="file">
					</div>
					<div class="contentarea">
						<label>내용</label>
						<textarea placeholder="내용을 입력하세요"></textarea>
					</div>
					<div id="write_logo">
						<img src="./images/logo.png">
					</div>
				</div>
			</div>
		</div>
		<div class="button-04_m">
			<div class="button-4">
				<div class="eff-4"></div>
				<a href="javascript:history.back();"> 취소 </a>
			</div>

			<div class="button-4">
				<div class="eff-4"></div>
				<a href="#"> 등록 </a>
			</div>
		</div>
	</section>




	<%@ include file="../base/footer.jsp"%>

	<link rel="stylesheet" href="../css/board.css">
</body>

</html>



