<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/radiobutton.css" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/select.css" rel="stylesheet"  type="text/css">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Jua');
	div.question_wrap{
		width:800px;
		margin-left:50px;
		border:1px solid #ccc;
		padding: 15px 20px;  
	}
	section{
		position: relative;
	}
	.container_wrap{
		margin-top: 40px;
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
	.pagination>.active>.wsm_active_a{
		background-color: #A3918F;
		border:1px solid #A3918F;
	}
	.pagination .wsm_active_a{
		color:#A3918F;
	}
</style>
</head>
<body>
	
	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<form action="result" method="post" id="wsm_testForm">
		<div class="custom-select">
			<select name="subject" id="subject">
				<option value="0"> Select Subject </option>
				<option value="D">데이터베이스</option>
				<option value="A">전자계산기 구조</option>
				<option value="O">운영체제</option>
				<option value="S">소프트웨어 공학</option>
				<option value="C">데이터통신</option>
			</select>
		</div>
		<div class="container_wrap">
			<c:forEach var="item" items="${list }">
				<div class="question_wrap">
					<p>${item.questionCode}</p>
					<p>${item.questionTitle}</p>
					<c:if test="${item.picture.equals('')==false}">
  						<img src="displayFile?filename=${item.picture }">
  					</c:if>
					<label class="container"> &nbsp; ${list.get(1).choice1}
					  <input type="radio" name="answer" value='1'>
					  <span class="checkmark"></span>
					</label>
					<label class="container"> &nbsp; ${list.get(1).choice2}
					  <input type="radio" name="answer" value='2'>
					  <span class="checkmark"></span>
					</label>
					<label class="container"> &nbsp; ${list.get(1).choice3}
					  <input type="radio" name="answer" value='3' >
					  <span class="checkmark"></span>
					</label>
					<label class="container"> &nbsp; ${list.get(1).choice4}
					  <input type="radio" name="answer" value='4' >
					  <span class="checkmark"></span>
					</label>
					<p><input type="hidden" name='correct' value='${item.correct}'></p>
				</div>
			</c:forEach>
		</div>
		<button type="submit" id="test_submit">제출하기</button>
	</form>
	
	<script id="template1" type="text/x-handlebars-template"> 
	{{#each.}}
		<div class="question_wrap">
			<p>{{questionCode}}</p>
			<p>{{questionTitle}}</p>
				{{#ifCond picture}}

				{{else}}
    				<img src="displayFile?filename={{picture}}">
				{{/ifCond}}
			<br>
					<label class="container"> &nbsp; {{choice1}}
					  <input type="radio" name="answer" value='1'>
					  <span class="checkmark"></span>
					</label>
					<label class="container"> &nbsp; {{choice2}}
					  <input type="radio" name="answer" value='2'>
					  <span class="checkmark"></span>
					</label>
					<label class="container"> &nbsp; {{choice3}}
					  <input type="radio" name="answer" value='3' >
					  <span class="checkmark"></span>
					</label>
					<label class="container"> &nbsp; {{choice4}}
					  <input type="radio" name="answer" value='4' >
					  <span class="checkmark"></span>
					</label>
			<p><input type="hidden" name='correct' value='{{correct}}'></p>
		</div>
	{{/each}}
	</script>
	
	<script>
	
	function getList(){
		var subject = $("select[name*=subject]").val();
		
		Handlebars.registerHelper('ifCond', function(v1, options) {
			if(v1 === "" || v1 === null) {
			   return options.fn(this);
			}
			return options.inverse(this);
		})
		
		$.ajax({
			url:"${pageContext.request.contextPath}/question/subjecttest/"+subject,
			type:"get",
			dataType:"json",
			success:function(json){
				console.log(json);
				$(".container_wrap").empty(); 
			
			var source = $("#template1").html();
			var f = Handlebars.compile(source);
			var result = f(json);
			$(".container_wrap").append(result);

			}
		})
	}
	</script>
	<script src="${pageContext.request.contextPath}/resources/js/select.js"></script>
	<script>
		$(function(){
			$(".select-items div").click(function(){
				getList();
			})
		})
	</script>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>














