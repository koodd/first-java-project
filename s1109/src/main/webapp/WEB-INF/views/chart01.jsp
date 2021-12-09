<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
		<title>Insert title here</title>
		<style type="text/css">
		  #graph{border:1px solid black; width:80%; margin:30px;}
		  #canvas{height:350px; width:600px;}
		</style>
		<script type="text/javascript">
		   function chartBtn(){
			   alert("차트생성");
			   var chartLabels=[]; //y축 데이터 
			   var chartData=[];   //x축 데이터
			   $.ajax({
				  url:"/chart01Send",
				  data:{
					  //controller에 보낼 데이터
				  },
				  dataType:"json", //받는데이터 타입
				  type:"post",
				  success:function(data){
					  $.each(data,function(key,value){
						  chartLabels.push(value.imonth); //x축 하단단위글
						  chartData.push(value.iincome);  //그래프 데이터 값
					  });//each
					  
					  alert(chartLabels);
					  
					  //option부분 들어갈 내용
	                  shapeChartData = {
	                        labels : chartLabels, //x축 하단단위글
	                        datasets : [ {
	                            label : "년도별 수입",
	                            backgroundColor: [ 
	                                'rgba(255, 99, 132, 0.2)', 
	                                'rgba(54, 162, 235, 0.2)', 
	                                'rgba(255, 206, 86, 0.2)', 
	                                'rgba(75, 192, 192, 0.2)', 
	                                'rgba(153, 102, 255, 0.2)', 
	                                'rgba(255, 159, 64, 0.2)' 
	                                ], 
	                                borderColor: [ 
		                            	'rgba(255,99,132,1)', 
		                            	'rgba(54, 162, 235, 1)', 
		                            	'rgba(255, 206, 86, 1)', 
		                            	'rgba(75, 192, 192, 1)', 
		                            	'rgba(153, 102, 255, 1)', 
		                            	'rgba(255, 159, 64, 1)' 
		                            	], 
	                            pointBorderColor: "#80b6f4",
	                            pointBackgroundColor: "#80b6f4",
	                            pointHoverBackgroundColor: "#80b6f4",
	                            pointHoverBorderColor: "#80b6f4",
	                            fill: false, //차트하단 색채우기
	                            borderWidth: 4, //선 두께
	                            data : chartData 
	                        } ]
	                  }//shapeChartData
	                  
	                  //html 그리기
	                  var ctx = document.getElementById("canvas").getContext("2d");
	  	              myChart = new Chart(ctx, {
	  	            	type:'bar',
	  	                data : shapeChartData,
	  	                options : {
	  	                    scales : {
	  	                        yAxes : [ {
	  	                            ticks : {
	  	                                beginAtZero : true
	  	                            }
	  	                        } ]
	  	                    }
	  	                }
	  	              });
					  
				  },
				  error:function(){
					  alert("error");
				  }
				   
			   });
			   
			   
			   
			   
		   }
		</script>
		
		
		
	</head>
	<body>
	  <h2>차트그리기</h2>
	  <br>
	  <button type="button" onclick="chartBtn()">차트생성</button>
	  
	  <div id="graph">
	     <div>
	        <canvas id="canvas"></canvas>
	     </div>
	    
	  </div>
	
	</body>
</html>