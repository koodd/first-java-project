<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>뷰페이지</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/read.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script type="text/javascript">
	 function deleteBtn(bid){
		 if(confirm("해당 게시글을 삭제하시겠습니까?")){
			 location.href="./delete?bid="+bid;
		 }else{
			 return false;
		 }
	 }   
  </script>
</head>
<body>
<section>
    <h1>NOTICE</h1>

    <table>
      <colgroup>
        <col width="15%">
        <col width="65%">
        <col width="15%">
        <col width="15%">
      </colgroup>
      <tr>
        <th>제목</th>
        <th colspan="3"><span class="separator">|</span>${map.bDto.btitle}</th>
      </tr>
      <tr>
        <td><strong>작성자</strong></td>
        <td><span class="separator">|</span>${map.bDto.bname}</td>
        <td><strong>조회수</strong></td>
        <td>${map.bDto.bhit}</td>
      </tr>
      <tr>
        <td colspan="4" class="article">${map.bDto.bcontent}</td>
      </tr>
      <!-- 파일이 있는 경우 -->
      <c:if test="${map.bDto.bupload != null }">
         <tr>
	        <td colspan="4" class="article">
	          <img src="../upload/${map.bDto.bupload}">
	        </td>
	      </tr>
	      <tr>
	        <td><strong>이미지다운로드</strong></td>
	        <td colspan="3"><span class="separator">|</span>
	        <a href="../upload/${map.bDto.bupload}" download>${map.bDto.bupload}</a>
	        </td>
	      </tr>
	      <tr>
	        <td><strong>파일이름</strong></td>
	        <td colspan="3"><span class="separator">|</span>${map.bDto.bupload}</td>
	      </tr>
      </c:if>
      <!-- 파일이 없는 경우 -->
      <c:if test="${map.bDto.bupload == null}">
         <tr>
	        <td colspan="4" class="article">
	        </td>
	      </tr>
	      <tr>
	        <td><strong>이미지다운로드</strong></td>
	        <td colspan="3"><span class="separator">|</span>
	        </td>
	      </tr>
	      <tr>
	        <td><strong>파일이름</strong></td>
	        <td colspan="3"><span class="separator">|</span></td>
	      </tr>
      </c:if>
      <tr>
        <td><strong>다음글</strong></td>
        <td colspan="3"><span class="separator">|</span><a href="./content_view?bid=${map.nextDto.bid}&page=${nDto.page}&category=${nDto.category}&searchWord=${nDto.searchWord}">[공지]${map.nextDto.btitle}</a></td>
      </tr>
      <tr>
        <td><strong>이전글</strong></td>
        <td colspan="3"><span class="separator">|</span><a href="./content_view?bid=${map.preDto.bid}&page=${nDto.page}&category=${nDto.category}&searchWord=${nDto.searchWord}">[공지]${map.preDto.btitle}</a></td>
      </tr>
    </table>

    <a href="./list?page=${nDto.page}&category=${nDto.category}&searchWord=${nDto.searchWord}"><div class="list">목록</div></a>
    <a href="#"><div class="list" onclick="deleteBtn(${map.bDto.bid})" >삭제</div></a>
    <a href="./modify_view?bid=${map.bDto.bid}"><div class="list">수정</div></a>
    <a href="./reply_view?bid=${map.bDto.bid}"><div class="list">답변달기</div></a>
  </section>
</body>
</html>