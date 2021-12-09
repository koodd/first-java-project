<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>글쓰기</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <link rel="stylesheet" href="../css/style.css">
  <link rel="stylesheet" href="../css/write.css">
  <link rel="stylesheet" href="../css/summernote/summernote-lite.css">
  <script src="../js/summernote/summernote-lite.js"></script> 
  <script src="../js/summernote/lang/summernote-ko-KR.js"></script> 
  <script type="text/javascript">
	  //Jquery구문
      $(function(){
    	  //입력창 상단 아이콘 생성
    	  $("#summernote").summernote({
	    	  height: 300,                 // 에디터 높이
			  minHeight: null,           // 에디터 최소 높이
			  maxHeight: null,          // 에디터 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",	         // 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
			  //  추가 부분
              toolbar: [
			  // [groupName, [list of button]]
			  ['fontname', ['fontname']],
			  ['fontsize', ['fontsize']],
			  ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			  ['color', ['forecolor','color']],
			  ['table', ['table']],
			  ['para', ['ul', 'ol', 'paragraph']],
			  ['height', ['height']],
			  ['insert',['picture','link','video']],
			  ['view', ['fullscreen', 'help']]
			  ],
			  fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			  fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
    	      callbacks: {
    	    	  onImageUpload: function(files, editor, welEditable) {
    	    	              for (var i = files.length - 1; i >= 0; i--) {
    	    	                sendFile(files[i], this);
    	    	              }
    	    	  }//onImageUpload
    	      }//callbacks
			  
    	  });//summernote
	  });//function
  
	  //파일업로드 실행메소드
	  function sendFile(file,el){
		  var form_data = new FormData();
	      form_data.append('file', file);
	      $.ajax({
	        data: form_data,
	        type: "POST",
	        url: 'summerUpload',
	        cache: false,
	        contentType: false,
	        enctype: 'multipart/form-data',
	        processData: false,
	        success: function(img_name) { //성공시 url이 입력됨.
	        $(el).summernote('editor.insertImage', img_name);
	        }
	      });
	  }//sendFile
  
     //글쓰기 함수
     function writeBtn(){
		 if(confirm("게시글을 저장하시겠습니까?")){
			 $("#write").submit();
		 }else{
			 return false;
		 }
	 } 
  </script>	 
</head>
<body>
<section>
    <h1>관리자 글쓰기</h1>
    <hr>

    <form action="./write" name="write" id="write" method="post" enctype="multipart/form-data">
      <table>
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
            <input type="text" name="btitle">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
            <textarea id="summernote" name="bcontent" cols="50" rows="10"></textarea>
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
        <button type="button" onclick="writeBtn()" class="write">작성완료</button>
        <button type="button" class="cancel" onclick="javascript:location.href='./list'">취소</button>
      </div>
    </form>

  </section>

</body>
</html>