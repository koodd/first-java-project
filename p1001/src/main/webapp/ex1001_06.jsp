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
		<title>Insert title here</title>
		<style type="text/css">
		  table,th,td{border:1px solid black; border-collapse: collapse;}
		</style>
	</head>
	<body>
	 <table>
	    <tr>
	      <th>학번</th>
	      <th>이름</th>
	      <th>국어점수</th>
	      <th>영어점수</th>
	      <th>수학점수</th>
	      <th>합계</th>
	      <th>평균</th>
	    </tr>
	<%!
	    Connection conn;
	    Statement stmt;
	    ResultSet rs;
	    int stunum,kor,eng,math,total;
	    double avg;
	    String stuname;
	%>
	<% try{
		 Class.forName("oracle.jdbc.driver.OracleDriver");
		 conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:java5","scott","tiger");
		 stmt = conn.createStatement();
		 String sql = "select * from stu_score";
		 rs = stmt.executeQuery(sql);
		 
		 while(rs.next()){
			 stunum = rs.getInt("stunum");
			 stuname = rs.getString("stuname");
			 kor = rs.getInt("kor");
			 eng = rs.getInt("eng");
			 math = rs.getInt("math");
			 total = rs.getInt("total");
			 avg = rs.getDouble("avg");
	%>
	  <!-- html문구가 들어감 -->
	    <tr>
	      <td><%=stunum %></td>
	      <td><%=stuname %></td>
	      <td><%=kor %></td>
	      <td><%=eng %></td>
	      <td><%=math %></td>
	      <td><%=total %></td>
	      <td><%=avg %></td>
	    </tr>
	<%    	
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
	  </table>
	  <button><a href="./form3.jsp">성적입력버튼</a></button>
	</body>
</html>