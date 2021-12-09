<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="../base/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>step03</title>

    
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap4/bootstrap.min.css">
    <link rel="stylesheet" href="../css/step03.css">
    <link rel="stylesheet" href="../css/footer.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    

</head>
<body style="margin: 0 auto; width: 1200px;">
  
    <script src="../js/header.js"></script>

    <h2>
        <strong>회원가입</strong>
        <span>회원으로 가입하시면 보다 더 다양한 혜택을 누리실 수 있습니다.</span>
    </h2>

    <div class="stepwrap">
        <div class="stepbox">
            <div class="step">
                <p class="web">step 01</p>
                <p class="txt">약관동의</p>
                
            </div>
            <div class="step">
                <p class="web">step 02</p>
                <p class="txt">가입 정보 입력</p>

            </div>
            <div class="step stepon">
                <p class="web">step 03</p>
                <p class="txt">회원 가입 완료</p>
                <p class="ck">
                    <img src="../images/bg_step.png" alt="">
                </p>
            </div>
        </div>
    </div>
    <div class="membership">
        <img src="../images/membership.png">
    </div>

    
    <div class="btnBox">
        <div class="bCenter">
            <ul>
                <li>
                    <a href="../main" class="back">메인</a>
                </li>
                <li>
                    <a href="#" class="next" id="memberBtn">로그인</a>
                </li>
            </ul>
        </div>
    </div>

  <%@ include file="../base/footer.jsp" %>  
  
</body>
</html>