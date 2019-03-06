<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	#main_container div#donutchart{
		width:700px;
		height:500px;
		float: left;
	}
	#main_container div.chart{
		width:300px;
		height:500px;
		float: left;
	}
	#main_container div.chart article{
		clear:both;
		width:300px;
		height: 100px;
		background-color: #eee;
	}
	#main_container div#score{
		width:100px;
		height:100px;
		position: absolute;
		left: 220px;
		top:200px;
		text-align: center; 
	}
	#main_container div#score h4{
		line-height: 80px;  
		font-weight: bold;
	}
	#main_container div#score span{
		font-size: 36px;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<div id="main_container">
		<div id="donutchart"></div>
		<div class="chart">
			<article>
				<table>
					<tr>
						<td>문제</td>
						<td>정답</td>
						<td>입력한 답</td>
					</tr>
					<c:forEach var="item" items="${list}">
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</c:forEach>
				</table>
			
				<c:forEach var="item" items="${list}">
					${item.answer }
				</c:forEach>
			</article>
		</div>
		<div id="score">
			<h4><span>${score }</span>점</h4>
		</div>
	</div> 
	
	<script>
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['Score', '100'],
        ['정답',     11],
        ['오답',      2]
      ]);

      var options = {
        pieHole: 0.4,
      };

      var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
      chart.draw(data, options);
    }
  </script>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>