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
		<title>성적저장</title>
		<style type="text/css">
		  table,th,td{border:1px solid black; border-collapse: collapse;}
		</style>
	</head>
	<body>
	<%!
	    Connection conn;
	    Statement stmt;
	    ResultSet rs;
	    int stunum,kor,eng,math,total;
	    double avg;
	    String stuname;
	%>
	<% 
	   request.setCharacterEncoding("utf-8");
	   stuname = request.getParameter("stuname"); 
	   kor=Integer.parseInt(request.getParameter("kor"));
	   eng=Integer.parseInt(request.getParameter("eng"));
	   math=Integer.parseInt(request.getParameter("math"));
	   total = kor+eng+math;
	   avg = total/3.0;
	
	   try{
		 Class.forName("oracle.jdbc.driver.OracleDriver");
		 conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:java5","scott","tiger");
		 stmt = conn.createStatement();
		 String sql = "insert into stu_score values(stu_seq.nextval,'"+stuname+"',"+kor+","+eng+","+math+","+total+","+avg+")";
		 stmt.executeUpdate(sql);
		 response.sendRedirect("./ex1001_06.jsp");
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