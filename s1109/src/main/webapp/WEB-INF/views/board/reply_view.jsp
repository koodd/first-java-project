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
     function replyBtn(){
	  	if(confirm("답변 글을 등록하시겠습니까?")){
	  		$("#reply").submit();
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

    <form action="reply" name="reply" id="reply" method="post" enctype="multipart/form-data">
      <table>
      <input type="hidden" name="bid" value="${map.bDto.bid}">
      <input type="hidden" name="bgroup" value="${map.bDto.bgroup}">
      <input type="hidden" name="bstep" value="${map.bDto.bstep}">
      <input type="hidden" name="bindent" value="${map.bDto.bindent}">
        <colgroup>
          <col width="15%">
          <col width="85%">
        </colgroup>
        <tr>
          <th>작성자</th>
          <td>
            <input type="text" name="bname">
          </td>
        </tr>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="btitle" value="<답변> ${map.bDto.btitle}">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
<textarea name="bcontent" cols="50" rows="10">

---------------------------
[답글]
${map.bDto.bcontent }
</textarea>
          </td>
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
        <button type="button" onclick="replyBtn()" class="write">답변완료</button>
        <button type="button" class="cancel" onclick="javascript:location.href='list'">취소</button>
      </div>
    </form>

  </section>

</body>
</html>