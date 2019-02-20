<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	.container{
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
		<div class="container">
			<c:forEach var="item" items="${list }">
				<div class="question_wrap">
					<p>${item.questionCode}</p>
					<p>${item.questionTitle}</p>
					<c:if test="${item.picture.equals('')==false}">
  						<img src="displayFile?filename=${item.picture }">
  					</c:if>
					<p><input type="radio" name='answer' value='1'> <!--①--> ${item.choice1} </p>
					<p><input type="radio" name='answer' value='2'> <!--②--> ${item.choice2} </p>
					<p><input type="radio" name='answer' value='3'> <!--③--> ${item.choice3} </p>
					<p><input type="radio" name='answer' value='4'> <!--④--> ${item.choice4} </p>
					<p><input type="hidden" name='correct' value='${item.correct}'></p>
				</div>
			</c:forEach>
		</div>
		<button type="submit" id="test_submit">제출하기</button>
	</form>
	
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>