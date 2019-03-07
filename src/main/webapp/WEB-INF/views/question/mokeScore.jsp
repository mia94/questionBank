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
	#main_container #score{
		width:400px;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<div id="main_container">
		<div id="barchart_values" style="width: 600px; height: 300px;"></div>
		<div id="score">
			총점 : ${score }
		</div>
	</div> 
	
	<script type="text/javascript">
	    google.charts.load("current", {packages:["corechart"]});
	    google.charts.setOnLoadCallback(drawChart);
	    function drawChart() {
	      var data = google.visualization.arrayToDataTable([
	        ["Element", "Density", { role: "style" } ],
	        ["데이터베이스", 8, "#5B4149"], 
	        ["전자계산기 구조", 10, "#F3C2BA"],
	        ["운영체제", 19, "#F6EFEC"],
	        ["소프트웨어 공학", 18, "color: #F28683"], 
	        ["데이터 통신", 20, "color: #A3918F"] 
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