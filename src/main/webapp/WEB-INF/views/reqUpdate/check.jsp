<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/radiobutton.css" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/register_select.css" rel="stylesheet"  type="text/css">
<script>
	$(function(){
		//test용
		/* var x = document.getElementsByClassName("container");
		var i;
		for (i = 0; i < x.length; i++) {
		  console.log(x[i]);
		} */
		//번호, 과목 display용
		var code = $(".code").text();
		var numCode = code.substring(7,10);
		var subject = code.substr(1,1);
		var year = code.substr(2,4);
		var round = code.substr(6,1);
		
		switch (subject) {
		  case 'D'   : $(".subject").text("데이터베이스");
		               break;
		  case 'A'   : $(".subject").text("전자계산기 구조");
		               break;
		  case 'O'  : $(".subject").text("운영체제");
		               break;
		  case 'S'  : $(".subject").text("소프트웨어 공학");
          				break;
		  default    : $(".subject").text("데이터 통신");
		               break;
		}
		
		$(".code").text(year+"년도 "+round+"회  "+numCode+"번");
		
		//submit용(insert)
		$("#test_submit").click(function(){
			var answer = $("input[name=answer]:checked").val();
			var correct = $("input[name=correct]").val();
			if(answer==correct){
				$("#correct_true").show();
				$("#correct_false").hide();
				$(".question_wrap").css("background-color","rgba(218,233,255,0.4)");
				$("input[name=answer]").attr("readonly","readonly");//안먹히는 중
				$("input[name=pass]").val(true);
			}else{
				$("#correct_false").show();
				$("#correct_true").hide();
				$(".question_wrap").css("background-color","rgba(255,237,237,0.4)");
				$("input[name=answer]").attr("readonly","readonly");
				$("input[name=pass]").val(false);
				//정답display
				var x = document.getElementsByClassName("container");//보기 span태그 4개 배열로 가져오기
				x[correct-1].style.color = "#F28683";
			}
		})
		

	})
</script>
<title>Insert title here</title>
<style>
	div.question_wrap{
		width:900px; 
		margin:30px auto; 
		border:1px solid #ccc;
		padding: 30px 20px;  
	}
	section{
		position: relative;
	}
	.container_wrap{
		margin-top: 40px;
	}
	span.subject{
		font-size: 17px;
		font-weight: bold;
		color:#ccc; 
	}
	p.code{
		font-weight: bold;
		color:#A3918F;
	}
	form{
		position: relative;
	}
	form img[alt*=before], form img[alt*=next]{
		width:50px;
	}
	form img[alt*=before]{
		position: absolute;
		left: 70px;
		top:120px;
	}
	form img[alt*=next]{
		position: absolute;
		right: 75px;
		top:120px;
	} 
	div.answerSheet{
		width: 200px;
		height:400px;
		background-color: #eee;
		position: fixed;
		top: 50px;  
		right: 50px; 
	}
	form #test_submit{
		border: none;
		background: white;
		font-size: 16px;
		font-family: 'Jua', sans-serif;
		color:#A3918F;
		float: right;
		padding-right: 200px;
	}
	#correct_true, #correct_false{
		display: none;
		position: absolute;
		right: 230px;
		bottom: 20px;
		font-family: 'Jua', sans-serif;
	}
	.pagination>.active>.wsm_active_a{
		background-color: #A3918F;
		border:1px solid #A3918F;
	}
	.pagination .wsm_active_a{
		color:#A3918F;
	}
	/*-------------------------------------------------------reqUpdate 부분*/
	#reqUpdate_container{
		width:900px; 
		margin:70px auto 40px;
	}
	#reqUpdate_container table{
		border-collapse: collapse;
		width:900px; 
		font-size: 12px;
	}
	table tr{
		border: 0.5px solid #ddd;
	}
	table td{
		padding: 5px 10px;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div id="counter" style='font-size:12pt'></div>
	<form action="singletest" method="post" id="wsm_testForm">
		<div class="container_wrap">
				<div class="question_wrap">
					<span class="subject"></span>
					<p class="code">${vo.questionCode}</p>
					<p>${vo.questionTitle}</p>
					<c:if test="${vo.picture.equals('')==false}">
  						<img src="displayFile?filename=${vo.picture }">
  					</c:if>
					<br>
					<label class="container"> &nbsp; ${vo.choice1}
					  <input type="radio" name="answer" value='1'>
					  <span class="checkmark"></span>
					</label>
					<label class="container"> &nbsp; ${vo.choice2}
					  <input type="radio" name="answer" value='2'>
					  <span class="checkmark"></span>
					</label>
					<label class="container"> &nbsp; ${vo.choice3}
					  <input type="radio" name="answer" value='3' >
					  <span class="checkmark"></span>
					</label>
					<label class="container"> &nbsp; ${vo.choice4}
					  <input type="radio" name="answer" value='4' >
					  <span class="checkmark"></span>
					</label>
					
					<!-- 히든으로 보내는 값들모음 -->
					<input type="hidden" name='correct' value='${vo.correct}'>
					<input type="hidden" name='pass' value='' id="pass">
					<input type="hidden" name='questionCode' value='${vo.questionCode}'>
					<input type="hidden" name='customerCode' value='${login.customerCode}'>
					<input type="hidden" name='spendTime' value='' id="spendTime">
					<br>
					<p>정답 : ${vo.correct} </p>

				</div>
		</div>
		<button type="button" id="test_submit">정답확인</button>
	</form>
	
	<!-- 문제에 대한 건의사항 -->
	
	<div id="reqUpdate_container">
		<table id="reqUpdate_table">
			<tr>
				<td>문제코드</td>
				<td>변경사유</td>
				<td>요청정답</td>
				<td>글쓴이</td>
				<td>게시 날짜</td>
			</tr>
			<tr>
				<td colspan="5">등록된 게시글이 없습니다.</td>
			</tr>
		</table>
	</div>
	
	<script>
		$(function(){
			getPageList();
		})
	</script>
	
	<script id="template1" type="text/x-handlebars-template"> 
		<tr>
			<td>문제코드</td>
			<td>변경사유</td>
			<td>요청정답</td>
			<td>글쓴이</td>
			<td>게시 날짜</td>
		</tr>
		{{#ifCond question.questionCode}} 
			<tr>
				<td colspan="5">등록된 게시글이 없습니다.</td>
			</tr>
		{{else}}
    		{{#each.}}
				<tr>
					<td>{{question.questionCode}}</td>
					<td>{{content}}</td>
					<td>{{oriCorrect}}</td>
					<td>{{writer.customerCode}}</td> 
					<td>{{tempDate moddate}}</td>
				</tr>
			{{/each}}
		{{/ifCond}}
	</script>
	
	<script>
	Handlebars.registerHelper("tempDate", function(value){
		var date = new Date(value);
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var day = date.getDate();
		
		return year+"."+month+"."+day
	})
	
	Handlebars.registerHelper('ifCond', function(v1, options) {
			if(v1 == '') {  
			   return options.fn(this);
			}
			return options.inverse(this);
		})
	
	var question = "${vo.questionCode}";
	
	function getPageList(){
		$.ajax({
			url:"${pageContext.request.contextPath}/reqUpdate/"+question,
			type:"get",
			dataType:"json",
			success:function(json){
				console.log(json);
				$("#reqUpdate_table").empty();//테이블 안 비우기
			
				var source = $("#template1").html();
				var f = Handlebars.compile(source);
				var result = f(json);
				$("#reqUpdate_table").append(result);
			}
		})
	}
	</script>

	
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>















