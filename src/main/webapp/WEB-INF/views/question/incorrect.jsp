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
	div.question_wrap, div#select_subject{
		width:800px;
		margin: 0 auto;
	}
	div.question_wrap{
		border:1px solid #ccc;
		padding: 15px 20px;  
	}
	section{
		position: relative;
	}
	div#select_subject ul{
		width:800px;
		list-style: none; 
	}
	div#select_subject ul li{
		float: left;
		width:160px;
		height:40px;
		border:1px solid #eee;
		line-height: 40px;
		text-align: center;
	}
	div#select_subject ul li:hover{
		background-color: #F6EFEC;
	}
	/*----------------------------------------------------------문제 리스트*/
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

	
	<form action="result" method="post" id="wsm_testForm">
		<div class="container_wrap">
		<div id="select_subject">
			<ul>
				<li>데이터베이스</li>
				<li>전자계산기 구조</li>
				<li>운영체제</li>
				<li>소프트웨어 공학</li>
				<li>데이터통신</li>
			</ul>
		</div>
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
	<script>
		$("select_subject li").click(function(){
			
		})
	</script>
	<script src="${pageContext.request.contextPath}/resources/js/select.js"></script>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
  	
</body>
</html>





