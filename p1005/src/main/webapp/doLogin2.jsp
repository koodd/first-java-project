<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%!
		   DataSource ds;
		   Connection conn;
		   PreparedStatement pstmt;
		   ResultSet rs;
		   String id,pw;
		%>
		<%
		  id = request.getParameter("id");
		  pw = request.getParameter("pw");
		
		  try{
			  
			  
			  //Class.forName("oracle.jdbc.driver.OracleDriver");
			  //conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:java5","scott","tiger");
			  Context context = new InitialContext();
			  //context.lookup("java:comp/env/설정이름")
			  ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			  conn = ds.getConnection();
			  
			  String sql = "select * from member where id=? and pw=?";
			  pstmt = conn.prepareStatement(sql);
			  pstmt.setString(1, id);
			  pstmt.setString(2, pw);
			  rs = pstmt.executeQuery();
			  
			  //id와 pw가 회원가입할때 입력받은 id,pw와 일치하면 로그인성공, 로그인실패  
			  if(rs.next()){
				  //id,pw가 있는 경우
				  session.setAttribute("session_id", id);
			  %>	  
				<script type="text/javascript">
				    var chkId = "<%=id %>";
				    alert(chkId +"님 로그인 성공!");
				    location.href="index.jsp";
				</script>
			  <%	  
			  }else{
				  //id,pw가 없는 경우
			   %>
                <script type="text/javascript">
                  alert("아이디 또는 패스워드가 일치하지 않습니다. 다시 입력하세요!");
                  location.href="login.html";
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
		<meta charset="UTF-8">
		<title>로그인 체크</title>
	</head>
	<body>
	
	</body>
</html>