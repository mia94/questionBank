<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/radiobutton.css" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/select.css" rel="stylesheet"  type="text/css">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Jua');
	div.question_wrap{
		width:800px;
		margin:0px auto;
		border:1px solid #ccc;
		padding: 15px 20px;  
	}
	section{
		position: relative;
	}
	.custom-select,button#test_select{
		float: left;
		margin-top: 30px;
		margin-bottom: 20px;
	}
	.custom-select:first-child{ 
		margin-left: 300px;
	}
	button#test_select{ 
		height: 37px;
		width:100px;
		background-color: #F3C2BA; 
		border:3px solid #F3C2BA;
		color:#5B4149; 
		font-family: 'Jua', sans-serif; 
		font-size: 16px;
		line-height: 16px;
	}
	.container_wrap{
		margin-top: 40px;
		clear: both;
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
	
	<div class="custom-select">
		<select name="year" id="year">
			<option value="0"> Select Year </option>
			<option value="2018"> 2018 </option>
		</select>
	</div>
	
	<div class="custom-select">
		<select name="round" id="round">
			<option value="0"> Select Round </option>
			<option value="3"> 3 </option>
			<option value="2"> 2 </option>
		</select>
	</div>
	
	<button id="test_select">선택</button>
	
	<form action="result" method="post" id="wsm_testForm">
		<div class="container_wrap">
			<c:forEach var="item" items="${list }">
				<div class="question_wrap">
					<p>${item.questionCode}</p>
					<p>${item.questionTitle}</p>
					<c:if test="${item.picture.equals('')==false}">
  						<img src="displayFile?filename=${item.picture }">
  					</c:if>
					<label class="container"> &nbsp; ${item.choice1}
					  <input type="radio" name="answer" value='1'>
					  <span class="checkmark"></span>
					</label>
					<label class="container"> &nbsp; ${item.choice2}
					  <input type="radio" name="answer" value='2'>
					  <span class="checkmark"></span>
					</label>
					<label class="container"> &nbsp; ${item.choice3}
					  <input type="radio" name="answer" value='3' >
					  <span class="checkmark"></span>
					</label>
					<label class="container"> &nbsp; ${item.choice4}
					  <input type="radio" name="answer" value='4' >
					  <span class="checkmark"></span>
					</label>
					<p><input type="hidden" name='correct' value='${item.correct}'></p>
				</div>
			</c:forEach>
		</div>
		<button type="submit" id="test_submit">제출하기</button>
	</form>
		<div class="text-center">
			<ul class="pagination">
				<c:if test="${pageMaker.prev }">
					<li><a href="${pageContext.request.contextPath}/question/list?page=${pageMaker.startPage-1}">&laquo;</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					<li ${pageMaker.cri.page == idx ? 'class="active"': ''} ><a href="${pageContext.request.contextPath}/question/list?page=${idx}" class="wsm_active_a">${idx}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next }">
					<li><a href="${pageContext.request.contextPath}/question/list?page=${pageMaker.endPage+1}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/select.js"></script>
	
	<script id="template1" type="text/x-handlebars-template"> 
	{{#each.}}
		<div class="question_wrap">
			<p class="code">{{questionCode}}</p>
			<p>{{questionTitle}}</p>
				{{#ifCond picture}}

				{{else}}
    				<img src="displayFile?filename={{picture}}">
				{{/ifCond}}
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
  	
 		$(function(){
  			$("#test_select").click(function(){
  				getList();
  			});
  		}) 	
 	
 	</script>
	
	<script>
		function getList(){
			var year = $("#year").val();
			var round = $("#round").val();
			
			Handlebars.registerHelper('ifCond', function(v1, options) {
				if(v1 === "" || v1 === null) {
				   return options.fn(this);
				}
				return options.inverse(this);
			})
			
			$.ajax({
				url:"${pageContext.request.contextPath}/question/listJson/"+year+"/"+round,
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
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
  	
</body>
</html>













