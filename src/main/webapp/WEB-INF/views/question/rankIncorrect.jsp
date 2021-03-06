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
		padding: 25px 25px;
	}
	section{
		position: relative;
	}
	div#select_subject{
		margin-top: 30px;
		padding-top: 30px;
	}
	div#select_subject>p{
		color:#666;
		font-size: 12px;
		line-height: 10px;
	}
	/*------------------------------------------------과목 select*/
	div#select_subject{
		width:800px;
		margin: 0 auto;
	}
	div#select_subject ul{
		width:800px;
		list-style: none; 
	}
	div#select_subject ul li{
		float: left;
		width:160px;
		height:40px;
		border:1px solid #F6EFEC;
		line-height: 40px;
		text-align: center;
		font-family: 'Jua', sans-serif; 
		color:#A3918F;
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
		<div id="select_subject">
			<p> 과목을 선택해주세요</p>
			<p> 많이 틀린문제의 채점결과는 '나의 학습'에 반영되지 않습니다.</p>
			<ul>
				<li><input type="hidden" value="D">데이터베이스</li>
				<li><input type="hidden" value="A">전자계산기 구조</li>
				<li><input type="hidden" value="O">운영체제</li>
				<li><input type="hidden" value="S">소프트웨어 공학</li>
				<li><input type="hidden" value="C">데이터통신</li>
			</ul>
		</div>
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
					<p><input type="hidden" name="correct" value="${item.correct}"></p>
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
			<input type="hidden" name="correct" value="{{correct}}">
		</div>
	{{/each}}
	</script>
	
	<script>
		$(function(){
			$("#select_subject li").click(function(){
				//클릭한 과목 정보 가져오기
				var subject = $(this).children("input[type=hidden]").val();
				
				Handlebars.registerHelper('ifCond', function(v1, options) {
					if(v1 === "" || v1 === null) {
					   return options.fn(this);
					}
					return options.inverse(this);
				})
				
				//ajax
				$.ajax({
					url:"${pageContext.request.contextPath}/question/rankIncorrect/"+subject,
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
				
			})
			
		//문제 정답여부 판별
		$(document).on("click","input[name=answer]",function(){
			//라디오버튼 색 바꾸기
			$(this).next().css("background-color","#F28683");
			//정답판별
			var answer = $(this).val();
			var correct = $(this).closest(".question_wrap").children("input[name=correct]").val();
			if(answer==correct){
				$(this).closest(".question_wrap").css("background-color","rgba(218,233,255,0.4)");  
			}else{
				$(this).closest(".question_wrap").css("background-color","rgba(255,237,237,0.4)");
				//정답display 아직 처리X
				
			}
		})
		})
	</script>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
  	
</body>
</html>













