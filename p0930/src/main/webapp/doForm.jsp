<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<% request.setCharacterEncoding("utf-8");
		   String[] hobby = request.getParameterValues("hobby");
		   String hobbys="";
		   for(int i=0;i<hobby.length;i++){
			   //golf,game,run
			   if(i==0){
			     hobbys = hobbys+hobby[i];
			   }else{
     			 hobbys = hobbys+","+hobby[i];
			   }
		   }
		   
		   String id = request.getParameter("id");
		   String pw = request.getParameter("pw");
		   String name = request.getParameter("name");
		%>
	
	</body>
</html>