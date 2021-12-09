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
	            	type: 'pie',
	                data : shapeChartData,
	                options: {
	                	  indexAxis: 'y',
	                  },
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
	                            backgroundColor:"#bfdaf9",
	                            borderColor: "#80b6f4",
	                            pointBorderColor: "#80b6f4",
	                            pointBackgroundColor: "#80b6f4",
	                            pointHoverBackgroundColor: "#80b6f4",
	                            pointHoverBorderColor: "#80b6f4",
	                            fill: false, //차트하단 색채우기
	                            borderWidth: 4, //선 두께
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