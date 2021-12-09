<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script type="text/javascript">
		   function sendEmail(){
			   alert("이메일인증 메일을 보냅니다.");
			   $.ajax({
				   url:"sendEmail",
			 		 type:"post",
			 		 data:{
			 			 "id":$("#id").val(),
			 			 "email":$("#email").val()
			 		 },
			 		 success:function(data){   //data : commentDto
			 		    alert("이메일 전송이 완료되었습니다.");
			 			alert("임시비밀번호 : "+data);
			 		    $("#email2").val(data);
			 		 },
			 		 error:function(){
			 			 alert("실패");
			 		 }
			   });
		   }//function
		
		
		
		</script>
		
		
	</head>
	<body>
	  <h2>이메일인증 폼</h2>
	  <form action="" id="formEmail" name="formEmail" >
	     <h3>회원가입</h3>
	     <label>아이디</label>
	     <input type="text" id="id" name="id"><br>
	     <label>이름</label>
	     <input type="text" id="name" name="name"><br>
	     <label>이메일</label>
	     <input type="text" id="email" name="email"><button type="button" onclick="sendEmail()">이메일인증</button><br>
	     <label>이메일확인 번호</label>
	     <input type="text" id="email2" name="email2"><button type="button" onclick="sendCheck()" >번호확인</button><br>
	     <label>연락처</label>
	     <input type="text" id="tel" name="tel"><br>
	     <input type="submit" value="전송">
	  </form>
	
	</body>
</html>