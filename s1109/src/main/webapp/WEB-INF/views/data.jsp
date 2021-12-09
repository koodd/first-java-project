<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	    <script type="text/javascript">
	      function apiBtn(){
	    	  alert("공공데이터 가져오기");
	    	  $.ajax({
    			 url:"./dataApi",
    	 		 type:"post",
    	 		 dataType:"json",  //xml일때는 xml로 변경
    	 		 data:{
    	 			 "pageNo":1
    	 		 },
    	 		 success:function(data){   
    	 		     alert("갤러리 포토그래퍼 : "+data.response.body.items.item[0].galPhotographer);
    	 		 },
    	 		 error:function(){
    	 			 alert("실패");
    	 		 }
	    	});//ajax
	      }//function
	    </script>
	</head>
	<body>
	  <h2>공공데이터</h2>
	  <button onclick="apiBtn()">공공데이터 가져오기</button>
	
	</body>
</html>