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
		<title>회원정보수정</title>
	</head>
	<body>
	  <%!
		 Connection conn;
		 PreparedStatement pstmt;
		 ResultSet rs;
		 String id,pw,name,email;
		 String hobby;
		 String[] hobbys;
	  
	  %>
	  <%
	    if(session.getAttribute("session_id")==null){
	  %>  	
	    <script type="text/javascript">
	       alert("로그인을 하셔야 이용가능합니다!");
	       location.href="login.html";
	    </script>	
	  <%  	
	    }
	     try{
	    	  Class.forName("oracle.jdbc.driver.OracleDriver");
			  conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:java5","scott","tiger");
			  String sql = "select * from member where id=?";
			  pstmt = conn.prepareStatement(sql);
			  pstmt.setString(1, (String)session.getAttribute("session_id"));
			  rs = pstmt.executeQuery(); 
			  
			  if(rs.next()){
				  id = rs.getString("id");
				  pw = rs.getString("pw");
				  name = rs.getString("name");
				  email = rs.getString("email");
				  hobby = rs.getString("hobby");
			  }
		%>
		  <h2>회원정보수정</h2>
		  <form action="doModify.jsp" method="post">
		    <label>아이디</label>
		    <span><%=id%></span><br>
		    <input type="hidden" name="id" value="<%=id%>">
		    <%-- <input type="text" name="id" value="<%=id%>" readonly><br> --%>
		    <label>비밀번호</label>
		    <input type="password" name="pw"><span>* 비밀번호를 입력하셔야 수정이 가능합니다.</span><br>
		    <label>이름</label>
		    <input type="text" name="name" value="<%=name%>"><br>
		    <label>이메일</label>
		    <input type="text" name="email" value="<%=email%>"><br>
		    <label>취미</label><br>
		    <input type="checkbox" id="swim" name="hobby" value="swim" <%= hobby.contains("swim")?"checked":"" %>><label for="swim">수영</label>
		    <input type="checkbox" id="run" name="hobby" value="run" <%= hobby.contains("run")?"checked":"" %>><label for="run">조깅</label>
		    <input type="checkbox" id="game" name="hobby" value="game" <%= hobby.contains("game")?"checked":"" %>><label for="game">게임</label>
		    <input type="checkbox" id="golf" name="hobby" value="golf" <%= hobby.contains("golf")?"checked":"" %>><label for="golf">골프</label><br>
		    <br>
		    <input type="submit" value="저장">
		    <input type="reset" value="취소"><br>
		  </form>
		<%	  
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
	</body>
</html>