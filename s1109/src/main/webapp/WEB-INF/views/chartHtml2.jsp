<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
       <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>
    </head>
	<script>
	//jquery
	   $(function() {
	        var chartLabels = []; // 받아올 데이터를 저장할 배열 선언
	        var chartData = []; 
	        
	        //차트그리기 https://www.chartjs.org/docs/latest/
	        function createChart() {
	            var ctx = document.getElementById("canvas").getContext("2d");
	            var myChart = new Chart(ctx, {
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
	        }//createChart
	        
	      //버튼을 클릭하면 차트가 그려진다. createChart()함수를 안에다 선언해야지 차트값을 받더라...
	        $('#chartBtn').click(function(){
	            chartLabels = [];
	            chartData=[];
	            
	            //getJson으로 데이터 
	            $.getJSON("./chartIncome", {
	                //ino : ino,
	                //imonth : imonth
	            }, function(data) {
	                $.each(data, function(key, value) {
	                    chartLabels.push(value.imonth);
	                    chartData.push(value.iincome);
	                });
	                
	                shapeChartData = {
	                        labels : chartLabels,
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
	                            	borderWidth: 1,
	                            data : chartData
	                        } ]
	                    }
	                createChart();
	            });//data
	        });//chartBtn
	     });//jquery
	</script>
	<body>
	    <div class="row">
	        <div class="container">
	            <div style="margin-top:20px; margin-left:80px">
	                <button id="chartBtn">년도별 수입차트 보기</button>
	            </div>
	        </div>
	        <div id="graph" style="width: 80%; margin: 30px;">
	            <div>
	                <canvas id="canvas" height="350" width="600"></canvas>
	            </div>
	        </div>
	    </div>
	</body>
</html>