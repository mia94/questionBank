<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
	#main_container{
		width:1000px;
		margin: 50px auto 0px;
		height: 500px;
		position: relative;
	}
	#main_container div{
		float: left;
	}
	#main_container div#barchart_values{
		width: 600px; 
		height: 300px;
	}
	#main_container div#score_container{
		width:400px;
		margin-top: 150px;
		position: relative;
	}
	#main_container div#score_container h1,#main_container div#score_container p{
		width:400px;
		text-align: center;
		font-family: 'Jua', sans-serif;
	}
	#main_container div#score_container h1 span{
		font-size: 1.1em;
		font-weight: bold;
	}
	#main_container div#score_container img{
		width:200px;
		position: absolute;
		top:-45px;
		left: 100px;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<script>
		//점수가 60점 이하면 불합격, 이상이면 합격
		$(function(){
			var totalScore = $("h1 span").text();
			if(totalScore<60){
				$("#isPass").text("불합격입니다.");
			}else{
				$("#isPass").text("합격입니다.");
			}
		})
	</script>
	
	<div id="main_container">
		<div id="barchart_values"></div>
		<div id="score_container">
			<h1><span>${scoreList[0] }</span>점</h1>
			<p id="isPass"></p>
			<img src="${pageContext.request.contextPath}/resources/upload/dia_black.png">
		</div>
	</div> 
	
	<script type="text/javascript">
	    google.charts.load("current", {packages:["corechart"]});
	    google.charts.setOnLoadCallback(drawChart);
	    function drawChart() {
	      var data = google.visualization.arrayToDataTable([
	        ["Element", "Density", { role: "style" } ],
	        ["데이터베이스", ${scoreList[1]}, "#5B4149"], 
	        ["전자계산기 구조", ${scoreList[2]}, "#F3C2BA"],
	        ["운영체제", ${scoreList[3]}, "#F6EFEC"],
	        ["소프트웨어 공학", ${scoreList[4]}, "color: #F28683"], 
	        ["데이터 통신", ${scoreList[5]}, "color: #A3918F"] 
	      ]);
	
	      var view = new google.visualization.DataView(data);
	      view.setColumns([0, 1,
	                       { calc: "stringify",
	                         sourceColumn: 1,
	                         type: "string",
	                         role: "annotation" },
	                       2]);
	
	      var options = { 
	        width: 600,
	        height: 400,
	        bar: {groupWidth: "95%"},
	        legend: { position: "none" },
	      };
	      var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
	      chart.draw(view, options);
	  	}
  	</script>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>