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
		<title>회원정보수정</title>
		<%!
		   Connection conn;
		   PreparedStatement pstmt;
		   ResultSet rs;
		   String id,pw,chkPw,name,email;
		   String hobby;
		   String[] hobbys;
		   int result;
		   
		%>
		<%
		  //한글처리
		  request.setCharacterEncoding("utf-8");
		  id = request.getParameter("id");
		  pw = request.getParameter("pw");
		  name = request.getParameter("name");
		  email = request.getParameter("email");
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
			  
			  String sql="select * from member where id=?";
			  pstmt = conn.prepareStatement(sql);
			  pstmt.setString(1, id);
			  rs = pstmt.executeQuery();
			  if(rs.next()){
				  chkPw = rs.getString("pw");
				  out.println("chkPw : "+chkPw);
			  }
			  //입력한 pw와 검색한 pw가 일치하는지 확인
			  if(pw.equals(chkPw)){
				  //pw가 일치하면 update실행
				  sql="update member set pw=?,name=?,email=?,hobby=? where id=?";
				  pstmt = conn.prepareStatement(sql);
				  pstmt.setString(1, pw);
				  pstmt.setString(2, name);
				  pstmt.setString(3, email);
				  pstmt.setString(4, hobby);
				  pstmt.setString(5, id);
				  result = pstmt.executeUpdate();
				  
			  }else{
				  //일치하지 않으면 
			  %>	
                <script type="text/javascript">
                  alert("패스워드가 일치하지 않습니다. 패스워드를 확인해주세요!");
                  //location.href="modify.jsp";
                  window.history.back();
                  return;
                </script>	  
			  <%
			  }
			  
			  // db에 데이터를 업데이트 성공여부 확인
			  if(result == 1){
				  //저장성공
			  %>
			     <script type="text/javascript">
				  alert("회원정보수정이 완료되었습니다!");
				  location.href="index.jsp";
				</script>
			  <%	  
			  }else{
				  //저장실패
			  %>	  
				<script type="text/javascript">
				  alert("회원수정이 제대로 되지 않았습니다. 다시 수정해 주시기 바랍니다!");
				  location.href="modify.jsp";
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