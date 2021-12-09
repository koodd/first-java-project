<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>글수정</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/write.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script type="text/javascript">
     function updateBtn(){
    	 if(confirm("수정하시겠습니까?")){
    		 $("#modify").submit();
    		 //document.modify.submit();
    	 }else{
    		 return false;
    	 }
     }
  </script>
</head>
<body>
<section>
    <h1>게시글수정</h1>
    <hr>

    <form action="./modify" name="modify" id="modify" method="post" enctype="multipart/form-data">
      <table>
      <input type="hidden" name="bid" value="${map.bDto.bid}">
      <input type="hidden" name="bupload" value="${map.bDto.bupload}">
        <colgroup>
          <col width="15%">
          <col width="85%">
        </colgroup>
        <tr>
          <th>작성자</th>
          <td>
            <input type="text" name="bname" value="${map.bDto.bname}" readonly>
          </td>
        </tr>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="btitle" value="${map.bDto.btitle}">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
            <textarea name="bcontent" cols="50" rows="10">${map.bDto.bcontent}</textarea>
          </td>
        </tr>
        <tr>
          <th>파일이름</th>
          <td>${map.bDto.bupload }</td>
        </tr>
        <tr>
          <th>이미지 표시</th>
          <td>
            <input type="file" name="file" id="file">
          </td>
        </tr>
      </table>
      <hr>
      <div class="button-wrapper">
        <button type="button" class="write" onclick="updateBtn()">수정완료</button>
        <button type="button" class="cancel" onclick="javascript:location.href='./list'">취소</button>
      </div>
    </form>

  </section>

</body>
</html>