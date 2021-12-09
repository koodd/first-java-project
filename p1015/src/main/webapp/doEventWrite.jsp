<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>파일저장</title>
	</head>
	<body>
	  <script type="text/javascript">
	    if(${result}==1){
		    alert("파일이 정상적으로 저장되었습니다.");
		    location.href="eventList.do";
	    }else{
		    alert("파일이 정상적으로 저장되지 않았습니다. 다시 입력하세요!");
		    location.href="eventWrite.do";
	    }
	  </script>
	
	</body>
</html>