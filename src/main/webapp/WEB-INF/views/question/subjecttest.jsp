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
	.custom-select {
	  float: right;
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
					<input type="hidden" name='correct' value='${item.correct}'>
					<input type="hidden" name='customer' value='${login.customerCode}'>
					<input type="hidden" name='questionCode' value='${item.questionCode}'>
				</div>
			</c:forEach>
		</div>
		<button type="submit" id="test_submit">제출하기</button>
	
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev }">
				<li><a href="${pageContext.request.contextPath}/question/subjectlist?page=${pageMaker.startPage-1}">&laquo;</a></li>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<li ${pageMaker.cri.page == idx ? 'class="active"': ''} ><a href="${pageContext.request.contextPath}/question/subjectlist?page=${idx}" class="wsm_active_a">${idx}</a></li>
			</c:forEach>
			<c:if test="${pageMaker.next }">
				<li><a href="${pageContext.request.contextPath}/question/subjectlist?page=${pageMaker.endPage+1}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
	
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
			<input type="hidden" name='correct' value='{{correct}}'>
			<input type="hidden" name='customer' value='{{login.customerCode}}'>
			<input type="hidden" name='question' value='{{questionCode}}'>
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
			//과목선택시 문제리스트 해당과목에 맞게 출력
			$(".select-items div").click(function(){
				getList();
			})
			
			//라디오버튼 선택시 insert, 답안변경시 update처리
			$("input[name=answer]").on("click",function(){
				//값 넘겨주기(resulttest_code는 자동, customer(코드), answer, correct, spendTime, pass, question(코드))
				var customer = $("input[name=customer]").val();
				var answer = $("input[name=answer]:checked").val();
				var correct = $("input[name=correct]").val();
				var pass = false;
				if(correct==answer){ //정답이면 pass로 바꾸기
					pass = true;
				}
				var question = $("input[name*=question]").val();
				var spendTime = 0;//아직처리못함

				//@RequestBody를 사용했기때문에
				var jsonBody = {answer:answer, correct:correct, pass:pass, spendTime:spendTime};
				//@RequestBody를 사용했으면headers, JSON.stringify를 반드시 사용해야함
				$.ajax({
					url:"${pageContext.request.contextPath}/question/subjecttest/"+customer+"/"+question,
					type:"post",
					headers:{
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"POST"
					},
					data:JSON.stringify(jsonBody),/*JSON.stringify는 {bno:bno, replyer:replyer, replytext:replytext}이런 스트링으로 변환*/
					dataType:"text",/*String으로 반환되면 객체가 아니기때문에 json이 아닌 text로 받아야함*/
					success:function(json){
						console.log(json);
						if(json=="success"){
							alert("등록하였습니다.");
						}
					}
				})
			})
		})
	</script>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>














