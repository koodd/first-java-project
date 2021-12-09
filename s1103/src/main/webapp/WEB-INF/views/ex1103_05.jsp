<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>form</title>
	</head>
	<body>
	  <h2>form_@requestParam,List</h2>
	  <form action="ex1103_06" method="post">
	    <label>id</label>
	    <input type="text" id="id" name="id"><br>
	    <label>pw</label>
	    <input type="password" id="pw" name="pw"><br>
	    <label>취미</label><br>
	    <input type="checkbox" id="swim" name="hobby" value="swim">
	    <label for="swim">수영</label> 
	    <input type="checkbox" id="golf" name="hobby" value="golf">
	    <label for="golf">골프</label> 
	    <input type="checkbox" id="run" name="hobby" value="run">
	    <label for="run">조깅</label> 
	    <input type="checkbox" id="game" name="hobby" value="game">
	    <label for="game">게임</label> 
	    <br>
	    <input type="submit" value="전송"><br>
	    
	  </form>
	
	</body>
</html>