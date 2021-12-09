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
    <script type="text/javascript">/* 01 */
    
    	$(function(){
    		var upwck = "${upwck}";
    		var u_no = "${u_no}";
    		var u_non = Number(u_no);
			var upwinput = $("#u_pw").val();
			$("#ch_pw_btn").click(function(){
				if($("#u_pw").val()==upwck){
					alert("비밀번호가 일치합니다.");
					if(confirm("정말로 삭제하시겠습니까?")==true){
						location.href="./my_withdrawal_do?u_no="+u_non;
					}
				}else{
					alert("비밀번호가 틀렸습니다. 다시 입력해주세요!");
				}
			});
    	});
    
    </script>
    
</head>
<body>
    <section>
        <div id="wrap_ch_pw">
            <form action="#">
                <h2 id="ch_pw_h2">비밀번호 확인</h2><br>
                <h5>* 개인정보 보안을 위해 비밀번호를 한번더 입력해주세요.</h5><!--01  -->
                <div id="wrap_submit">
                	<input type="password" id="u_pw" value="">
                	<input type="button" id="ch_pw_btn" value="확인">
                </div>
            </form>
        </div>
    </section>
    <%@ include file="../base/footer.jsp" %> 
</body>
</html>