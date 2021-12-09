<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정 완료</title>
</head>
<body>

  <script type="text/javascript">
     alert("회원 정보 수정이 완료되었습니다!");
     location.href="../member/my_index?u_no=${session_uno}";
  </script>

</body>
</html>