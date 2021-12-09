<%@page import="java.net.URLEncoder"%>
<%@page import="java.beans.Encoder"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<%!
		   Connection conn;
		   PreparedStatement pstmt;
		   ResultSet rs;
		   String id,pw,name,email;
		   String hobby;
		   String[] hobbys;
		%>
		<%
		  //한글처리
		  request.setCharacterEncoding("utf-8");
		  id = request.getParameter("id");
		  out.println("id : "+id);
		  pw = request.getParameter("pw");
		  name = request.getParameter("name");
		  email = request.getParameter("email");
		  out.println("id : "+email);
		  hobbys = request.getParameterValues("hobby");
		  hobby="";
		  for(int i=0;i<hobbys.length;i++){
			  if(i==0){
				  hobby += hobbys[i];
			  }else{
				  hobby += ","+ hobbys[i];  //swim,run,game,golf
			  }
		  }
		  try{
			  //db연결
			  Class.forName("oracle.jdbc.driver.OracleDriver");
			  conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:java5","scott","tiger");
			  String sql="insert into member values(?,?,?,?,?)";
			  out.println("sql : "+sql);
			  pstmt = conn.prepareStatement(sql);
			  pstmt.setString(1, id);
			  pstmt.setString(2, pw);
			  pstmt.setString(3, name);
			  pstmt.setString(4, email);
			  pstmt.setString(5, hobby);
			  int result = pstmt.executeUpdate();
			  out.println("result : "+result);
			  if(result == 1){
				  //저장성공
				  out.println("성공");
				  response.sendRedirect("loginSuccess.jsp?id="+id+"&name="+URLEncoder.encode(name,"utf-8"));  
			  }else{
				  //저장실패
			  %>	  
				<script type="text/javascript">
				  alert("회원가입이 정상적으로 되지 않았습니다. 다시 입력하세요!");
				  location.href="join.html";
				</script>
			  <%	  
			  }
		  }catch(Exception e){
			  e.printStackTrace();
		  }finally{
			  try{
				  if(rs!=null) rs.close();
				  if(pstmt!=null) pstmt.close();
				  if(conn!=null) conn.close();
			  }catch(Exception e2){
				  e2.printStackTrace();
			  }
		  }
		%>
	</head>
	<body>
	
	</body>
</html>