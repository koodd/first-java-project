<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<!-- saved from url=(0054)http://www.wootdali.or.kr/wt_community/notice_list.php -->
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <title>해피홀팜</title>
        <link rel="stylesheet" href="../css/bootstrap.min.css">
    
				
				<script src="javascript">
				function btn("#findid"){ alert('아이디찾기'); } 
				</script>

				
     
    </head>

<body>


    	<%@ include file="../base/header.jsp" %>

			
		
 
        <section>
            <div class="login_find_id">
                <div class="login_find_id_title">
                 <strong> 아이디 찾기</strong> <br> 
                 <div class="login_find_id_input">
                    Email &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text">&nbsp;&nbsp;&nbsp;@&nbsp;&nbsp;
                    <select>
                        <option>naver.com</option>
                        <option>daum.net</daum></option>
                        <option>gmail.com</option>
                        <option>nate.com</option>
                    </select><br>
                    <button type="button" id="findid">아이디 찾기</button>
                </div>
                </div>
            </div>
        </section>



         

 <%@ include file="../base/footer.jsp" %>

	<link rel="stylesheet" href="../css/board.css">


</body>

</html>



