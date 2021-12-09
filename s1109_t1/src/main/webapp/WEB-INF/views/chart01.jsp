<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
		<style type="text/css">
			#graph{boarder:1px solid black; width:80%; margin:30px; }
			#canvas{height: 350px; width: 600px;}
		
		</style>
		<script type="text/javascript">
			function chartBtn){
				alert("차트생성");
				var chartLabels=[];	//x축 데이터 
				var chartData=[];	//y축 데이터 
				$.ajax({
					url:"/chart01Send",
					data:{
						//controller에 보낼 데이터 		
					},
					dataType:"json",// 받는 데이터 타입
					type:"post" ,
					success: function(data){
						
					},
					error:function(){
						alert("error");
						
					});
					
				})
				
				
				
			}	
		
		
		</script>

	</head>
	<body>
		<h2>차트그리기</h2>
		<br>
		
		<div id="graph";>
			<button type="button" onclick="chartBtn()">차트생성</button>
		</div>
		
		
		<div id="graph";>
		
		</div>
</body>
</html>