<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Jua');
	div.question_wrap{
		width:800px;
		float:left;
		border:1px solid #ccc;
		padding: 30px 10px;
	}
	section{
		position: relative;
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
		font-size: 20px;
		font-family: 'Jua', sans-serif;
		color:#A3918F;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<form action="result" method="post" id="wsm_testForm">
		<div class="container">
		</div>
		<button type="submit" id="test_submit">제출하기</button>
	</form>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
	
	 <script>
	  function getPageList(){
		  $.ajax({
				url:"${pageContext.request.contextPath}/question/listJson",
				type:"get",
				dataType:"json",
				success:function(json){
					console.log(json);
					$(".container").empty();//안에만 비우기
					var source = $("#template1").html();
					var f = Handlebars.compile(source);  
					var result = f(json);
					$(".container").append(result);
				}
			})
	  }
	  
	  $(function(){
		  getPageList();
	  })
  </script>
	
	<script id="template1" type="text/x-handlebars-template">   
	{{#each.}}
		<div class="question_wrap">
			<p>{{questionCode}}</p>
			<p>{{questionTitle}}</p>
			<p><input type="radio" name='answer' value='1'> <!--①--> {{choice1}}</p>
			<p><input type="radio" name='answer' value='1'> <!--②--> {{choice2}}</p>
			<p><input type="radio" name='answer' value='1'> <!--③--> {{choice3}}</p>
			<p><input type="radio" name='answer' value='1'> <!--④--> {{choice4}}</p>
			<p><input type="hidden" name='correct' value='{{correct}}'></p>
		</div>
	{{/each}}
  	</script>

  	<c:if test="${picture!=null}">
  	
  	</c:if>
  	
  	
</body>
</html>