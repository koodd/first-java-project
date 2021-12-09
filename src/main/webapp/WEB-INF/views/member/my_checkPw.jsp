<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="../base/myPage.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        section{width: 1200px; margin: 0 auto;}
        #wrap_ch_pw{margin-top: 200px; text-align: center; margin-bottom: 300px;}
        #ch_pw_h2{font-size: 40px;}
        #u_pw{font-size: 30px; padding: 5px 10px; border:1px solid black;}
        #u_pw:focus{border:2px solid black;}
        #ch_pw_btn{font-size: 30px; padding: 5px 10px; cursor: pointer; border:1px solid black;}
        #wrap_submit{margin-top:40px;}
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$("#ch_pw_btn").click(function(){
			    	  $.ajax({
			     		 url:"./checkPw",
			     		 type:"post",
			     		 data:{
			     			 "u_pw":$("#u_pw").val()
			     		 },
			     		 success:function(data){
			     			 if(data==1){
			     				 /* alert("비밀번호가 일치합니다"); */
			     				 location.href="../member/my_info_updet?u_no=${session_uno}";
			     			 }else{
			     				 alert("PW가 일치 하지 않습니다. 다시 입력하세요");
			     			 }
			     		 },
			     		 error:function(textStatus){
			     			 alert("error : "+textStatus);
			     		 }
			     	  });
    		});
    	});
    </script>		
    
</head>
<body>
    <section>
        <div id="wrap_ch_pw">
            <form action="">
                <h2 id="ch_pw_h2">비밀번호 확인</h2><br>
                <span> * 개인정보 보안을 위해 비밀번호를 한번더 입력해주세요.</span>
                <div id="wrap_submit">
                	<input type="password" id="u_pw">
                	<input type="submit" id="ch_pw_btn" value="확인">
                </div>
            </form>
        </div>
    </section>
    <%@ include file="../base/footer.jsp" %> 
</body>
</html>