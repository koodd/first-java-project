<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
  <%
     session.invalidate();
  %>
  <script type="text/javascript">
     alert("로그아웃 되었습니다.!!");
     location.href="../index";
  </script>

</body>
</html>