<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../base/managerbase.jsp"%>

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

<script type="text/javascript">
    	function deleteBtn(bn_no){
    		if(confirm("해당 게시글을 삭제 하시겠습니까?")){
    			location.href="./delete_board_info?bn_no="+bn_no;
    		}else{
    			return false;
    		
    		}
    		
    	}
 
    </script>


</head>

<body>



	<section id="contentArea">
		<!--contentArea{-->
		<div class="contentTitle">
			<p>정보게시판</p>
		</div>

		<div id="content_view">
			<div class="content_view_top">
				<div id="content_view_title">${map.bDto.bn_title}</div>
				<!-- 날짜, hit 값 들어감 -->
				<div id="content_view_date">
					<span style="padding-right: 20px; border-right: 1px solid #666;">${map.bDto.bn_date}</span>
					<span style="padding-left: 20px;">조회수 : </span><span>${map.bDto.bn_hit}</span>
				</div>
			</div>
			<div></div>

			<div id="content_view_mid">
				<c:if test="${map.bDto.bn_upload != null }">
					<tr>
						<td colspan="4" class="article">
							<div style="margin: 0 auto;">
								<img src="../upload/${map.bDto.bn_upload}"
									style="max-height: 1000px; max-width: 600px; margin: 0 auto;">
							</div>
						</td>
					</tr>
				</c:if>
				<p>${map.bDto.bn_content}</p>
			</div>

			<c:if test="${map.bDto.bn_upload != null }">
				<tr>
					<td><strong>이미지다운로드</strong></td>
					<td colspan="3"><span class="separator">|</span> <a
						href="../upload/${map.bDto.bn_upload}" download>${map.bDto.bn_upload}</a>
					</td>
				</tr>
				<tr>
					<td><strong>파일이름</strong></td>
					<td colspan="3"><span class="separator">|</span>${map.bDto.bn_upload}</td>
				</tr>
			</c:if>
			<!-- 파일이 없는 경우 -->
			<c:if test="${map.bDto.bn_upload == null}">
				<tr>
					<td colspan="4" class="article"></td>
				</tr>
				<tr>
					<td><strong>이미지다운로드</strong></td>
					<td colspan="3"><span class="separator">|</span></td>
				</tr>
				<tr>
					<td><strong>파일이름</strong></td>
					<td colspan="3"><span class="separator">|</span></td>
				</tr>
			</c:if>


			<div id="content_view_bottom1">

				<div id="content_view_bottom2">
					<label>다음글</label>
					<div id="content_view_next">
						<a
							href="./man_info_board_view?bn_no=${map.preDto.bn_no}&page=${nDto.page}&category=${nDto.category}&searchword=${nDto.searchword}">${map.preDto.bn_title}</a>
					</div>
				</div>
				<label>이전글</label>
				<div id="content_view_prev">
					<a
						href="./man_info_board_view?bn_no=${map.nextDto.bn_no}&page=${nDto.page}&category=${nDto.category}&searchword=${nDto.searchword}">${map.nextDto.bn_title}</a>
				</div>
			</div>

			<div class="board_btn">
				<button type="submit" class="content_btn managerbuttoncss"
					onclick="location.href='man_info_board_list?page=${nDto.page}&category=${nDto.category}&searchword=${nDto.searchword}'">목록</button>
				<button type="button" class="content_btn2 managerbuttoncss"
					onclick="deleteBtn(${map.bDto.bn_no})">삭제</button>
				<button type="submit" class="content_btn2 managerbuttoncss"
					onclick="location.href='man_info_modify_view?bn_no=${map.bDto.bn_no}'">수정</button>
			</div>


		</div>


	</section>


	<link rel="stylesheet" href="../css/board.css">
</body>

</html>



