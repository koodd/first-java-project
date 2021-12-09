<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>뷰페이지</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/read.css">
  <script type="text/javascript">
     function boardDelete(){
    	 if(confirm("게시글을 삭제하시겠습니까?")){
    		 //alert("bid : "+${bDto.bid});
    		 location.href="boardDelete.do?bid="+${bDto.bid};
    	 }
     }
  </script>
</head>
<body>
<section>
    <h1>NOTICE</h1>

    <table>
      <colgroup>
        <col width="80%">
        <col width="10%">
        <col width="10%">
        
      </colgroup>
      <tr>
        <th colspan="3">제목</th>
      </tr>
      <tr>
        <td><strong>${bDto.btitle}</strong></td>
        <td>날짜</td>
        <td>${bDto.bdate}</td>
      </tr>
      <tr>
        <td>${bDto.bname}</td>
        <td>조회수</td>
        <td>${bDto.bhit}</td>
      </tr>
      <tr>
        <td colspan="3" class="article">${bDto.bcontent }</td>
      </tr>
        <td colspan="3"><strong>파일이름</strong> <span class="separator">|</span>${bDto.bupload} </td>
      </tr>
      <tr>
        <td colspan="3"><strong>다음글</strong> <span class="separator">|</span><a href="boardView.do?bid=${nextDto.bid}&page=${param.page}&category=${param.category}&searchWord=${param.searchWord}">${nextDto.btitle}</a></td>
      </tr>
      <tr>
        <td colspan="3"><strong>이전글</strong> <span class="separator">|</span><a href="boardView.do?bid=${preDto.bid}&page=${param.page}&category=${param.category}&searchWord=${param.searchWord}">${preDto.btitle}</td>
      </tr>
    </table>

    <a href="boardList.do?page=${param.page}&category=${param.category}&searchWord=${param.searchWord}"><div class="list">목록</div></a>
    <a href="#" onclick="boardDelete()"><div class="list">삭제</div></a>
    <a href="boardModify.do?bid=${bDto.bid}&category=${param.category}&searchWord=${param.searchWord}"><div class="list">수정</div></a>
    <a href="boardReply.do?bid=${bDto.bid}&page=${param.page}&category=${param.category}&searchWord=${param.searchWord}"><div class="list">답변달기</div></a>
  </section>
</body>
</html>