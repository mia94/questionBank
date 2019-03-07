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
		width:600px;
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
	}
	#main_container div.chart article table{ 
		border-collapse: collapse;
		width:300px;
		text-align: center;
		font-size: 12px;
	}
	#main_container div.chart article table tr:hover{
		background-color: #eee;
	}
	#main_container div.chart article table tr:first-child:hover{
		background:none;
	}
	#main_container div.chart article table td{
		border:1px solid #A3918F;
		width:100px;
		height: 23px;  
	}
	#main_container div#score{
		width:100px;
		height:100px;
		position: absolute;
		left: 185px;
		top:200px;
		text-align: center; 
		color:#5B4149;
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
						<td>입력한 답</td>
						<td>정답</td>
					</tr>
					<c:forEach var="item" items="${list}" varStatus="status">
						<tr>
							<td>${status.count }번</td>
							<td class="td_answer">${item.answer }</td>
							<td class="td_correct">${item.correct }</td>
						</tr>
						<input type="hidden" value="${item.question.questionCode }">
					</c:forEach>
				</table>
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
        ['Score', '100' ],
        ['정답률',     ${score }],
        ['오답률',      100-${score }] 
      ]); 

      var options = {
        pieHole: 0.6, 
        slices: [{color: '#A3918F'},{color: '#F28683'}] 
      };

      var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
      chart.draw(data, options);
    }
  </script>
		
	<jsp:include page="../include/footer.jsp"></jsp:include>
	
	<script>
		$(function(){
			//오답 배경색으로 표시
			for(var i=0;i<20;i++){
				var answer = $(".td_answer").eq(i).text();
				var correct = $(".td_correct").eq(i).text();
				if(answer!=correct){ 
					$("tr").eq(i+1).css("backgroundColor","rgba(243,194,186,0.3)"); 
				}
			}
			//tr클릭 시 해당 문제가 있는 페이지로 이동
			$("tr").click(function(){
				var questionCode = $(this).next().val();
				location.href="${pageContext.request.contextPath}/reqUpdate/check?question="+questionCode;
			})
		})
	</script>
</body>
</html>



















