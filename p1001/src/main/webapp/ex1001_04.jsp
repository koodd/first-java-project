<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>db연결</title>
	</head>
	<body>
	  <%!
	     Connection conn;
	     Statement stmt;
	     ResultSet rs;
	     String id,pw,name,email,hobby;
	  %>
	  <%
	     try{
	    	 String checkid="aaa"; 
		     //oracle로드
		     Class.forName("oracle.jdbc.driver.OracleDriver");
		     //db 로그인
		     conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:java5","scott","tiger");
		     //statement객체 실행해서 sql구문 실행
		     stmt = conn.createStatement();
		     //db정보 가져오기
		     String sql="select * from member";
		     //select * from member where id='aaa'
		     rs = stmt.executeQuery(sql);
		     
		     while(rs.next()){
		    	 id = rs.getString("id");
		    	 // rs.getInt("id");
		    	 pw = rs.getString("pw");
		    	 name = rs.getString("name");
		    	 email = rs.getString("email");
		    	 hobby = rs.getString("hobby");
		    	 out.println("아이디 : "+id+" 패스워드 : "+pw+" 이름 : "+name+" 이메일 : "+email+" 취미 : "+hobby+"<br>");
		     }
	     }catch(Exception e){
	    	 e.printStackTrace();
	     }finally{
	    	 try{
	    		 if(rs!=null) rs.close();
	    		 if(stmt!=null) stmt.close();
	    		 if(conn!=null) conn.close();
	    	 }catch(Exception e2){
	    		 e2.printStackTrace();
	    	 }
	     }
		  %>
	  
	  
	    
	
	
	
	</body>
</html>