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
		font-family: 'Jua', sans-serif;
	}
	#main_container div{
		float: left;
	}
	#main_container #columnchart_values{
		width: 600px; 
		height: 400px;
	}
	#main_container>div:last-child {
		width:400px;
		height: 400px;
		padding-top: 30px;
	}
	#main_container>div:last-child h3{
		color:#A3918F;
	}
	/*--------------------------------------table*/
	table{
		border-collapse: collapse;
		width:400px;
	}
	table tr:first-child{
		text-align: center;
		background-color: #A3918F;
	}
	table td{
		border:1px solid #F6EFEC; 
		height: 40px;
		padding: 5px;
		text-align: center; 
		color:#5B4149;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<div id="main_container">
		<div id="columnchart_values"></div>
		<div>
			<h3>${login.customerName }님의 기록</h3>
			<table>
				<tr>
					<td>과목명</td>
					<td>푼 문제 수</td>
					<td>정답 수</td>
					<td>정답률</td>
				</tr>
				<tr>
					<td>데이터베이스</td>
					<td>${list[0].totalCount }개</td>
					<td>${list[0].correctCount }개</td>
					<td>${list[0].rate }%</td>
				</tr>
				<tr>
					<td>전자계산기 구조</td>
					<td>${list[1].totalCount }개</td>
					<td>${list[1].correctCount }개</td>
					<td>${list[1].rate }%</td>
				</tr>
				<tr>
					<td>운영체제</td>
					<td>${list[2].totalCount }개</td>
					<td>${list[2].correctCount }개</td>
					<td>${list[2].rate }%</td>
				</tr>
				<tr>
					<td>소프트웨어 공학</td>
					<td>${list[3].totalCount }개</td>
					<td>${list[3].correctCount }개</td>
					<td>${list[3].rate }%</td>
				</tr>
				<tr>
					<td>데이터 통신</td>
					<td>${list[4].totalCount }개</td>
					<td>${list[4].correctCount }개</td>
					<td>${list[4].rate }%</td>
				</tr>
			</table>
		</div>
	</div> 
	
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	    google.charts.load("current", {packages:['corechart']});
	    google.charts.setOnLoadCallback(drawChart);
	    function drawChart() {
	      var data = google.visualization.arrayToDataTable([
	        ["Element", "Density", { role: "style" } ],
	        ["데이터베이스", ${list[0].rate }, "#A3918F"],
	        ["전자계산기 구조", ${list[1].rate }, "#F28683"],
	        ["운영체제", ${list[2].rate }, "#F6EFEC"],
	        ["소프트웨어 공학", ${list[3].rate }, "color: #F3C2BA"],
	        ["데이터통신", ${list[4].rate }, "color: #5B4149"] 
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
	      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
	      chart.draw(view, options);
	  }
	  </script>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>