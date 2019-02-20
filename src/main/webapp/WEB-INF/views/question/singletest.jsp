<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
	$(function(){
		
		$("#test_submit").click(function(){
			var answer = $("input[name=answer]:checked").val();
			var correct = $("input[name=correct]").val();
			if(answer==correct){
				$("#correct_true").show();
				$(".question_wrap").css("background-color","#DAE9FF")
				$("input[name=answer]").attr("readonly","readonly");
				$("input[name=pass]").val(true);
			}else{
				$("#correct_false").show();
				$(".question_wrap").css("background-color","#FFEDED")
				$("input[name=answer]").attr("readonly","readonly");
				$("input[name=pass]").val(false);
			}
		})
		
		$("img[alt*=next]").click(function(){
			$("#wsm_testForm").submit();
		})
		
		//카운트용
		function aahacafeTimer(){
		    var time = new Date();
		    var hours = time.getHours();
		    var mins = time.getMinutes();
		    var secs = time.getSeconds();
		    enterTime = hours*3600 + mins*60 + secs;
		    Timer();
		}
		function compTime() {
		    var count = curTime - enterTime;
		    hour = parseInt(count/3600);
		    min = parseInt((count%3600)/60);
		    min = ((min < 10) ? "0" : "") + min;
		    sec = (count%3600) % 60;
		    sec = ((sec < 10) ? "0" : "") + sec;
		    document.all["counter"].innerHTML = hour + ":" + min + ":" + sec;
		    $("#spendTime").val(count);//초단위로 걸린시간 val에 입력
		    window.setTimeout(Timer,1000);
		}
		
		function Timer(){
		    var time = new Date();
		    var hours = time.getHours(); 
		    var mins = time.getMinutes(); 
		    var secs = time.getSeconds(); 
		    curTime = hours*3600 + mins*60 + secs;
		    compTime();
		}
		
		window.onload = aahacafeTimer;

	})
</script>
<title>Insert title here</title>
<style>
	div.question_wrap{
		width:800px;
		margin:20px auto;
		border:1px solid #ccc;
		padding: 30px 20px;  
	}
	section{
		position: relative;
	}
	.container_wrap{
		margin-top: 40px;
	}
	#counter{
		width:300px;
		position: absolute;
		right: -35px;
		top: 25px;
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
	/*라디오버튼 css*/
	.container {
	  display: block;
	  position: relative;
	  padding-left: 35px;
	  margin-bottom: 12px;
	  cursor: pointer;
	  font-size: 12px;
	  -webkit-user-select: none;
	  -moz-user-select: none;
	  -ms-user-select: none;
	  user-select: none;
	}
	
	.container input {
	  position: absolute;
	  opacity: 0;
	  cursor: pointer;
	}
	.checkmark {
	  position: absolute;
	  top: 0;
	  left: 0;
	  height: 15px;
	  width: 15px;
	  background-color: #eee;
	  border-radius: 50%;
	}
	.container:hover input ~ .checkmark {
	  background-color: #ccc;
	}
	.container input:checked ~ .checkmark {
	  background-color: #F28683;  
	}
	.checkmark:after {
	  content: "";
	  position: absolute;
	  display: none;
	}
	.container input:checked ~ .checkmark:after {
	  display: block;
	}
	.container .checkmark:after {
	 	top: 4.5px;
		left: 4.5px;
		width: 6px;
		height: 6px; 
		border-radius: 50%;
		background: white;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div id="counter" style='font-size:12pt'></div>
	<form action="singletest" method="post" id="wsm_testForm">
		<div class="container_wrap">
				<div class="question_wrap">
					<p>${list.get(1).questionCode}</p>
					<p>${list.get(1).questionTitle}</p>
					<c:if test="${list.get(1).picture.equals('')==false}">
  						<img src="displayFile?filename=${list.get(1).picture }">
  					</c:if>
					<%-- <p><input type="radio" name='answer' value='1' class="answer"> <label> ${list.get(1).choice1} </label></p>
					<p><input type="radio" name='answer' value='2' class="answer"> <label> ${list.get(1).choice2} </label></p>
					<p><input type="radio" name='answer' value='3' class="answer"> <label> ${list.get(1).choice3} </label></p>
					<p><input type="radio" name='answer' value='4' class="answer"> <label> ${list.get(1).choice4} </label></p> --%>
					<!-- 라디오22 -->
					
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
					
					<!-- 히든으로 보내는 값들모음 -->
					<input type="hidden" name='correct' value='${list.get(1).correct}'>
					<input type="hidden" name='pass' value='' id="pass">
					<input type="hidden" name='questionCode' value='${list.get(1).questionCode}'>
					<input type="hidden" name='customerCode' value='${login.customerCode}'>
					<input type="hidden" name='spendTime' value='' id="spendTime">
					<br>
					<p id="correct_true">정답입니다</p>
					<p id="correct_false">오답입니다</p>
				</div>
		</div>
		<button type="button" id="test_submit">정답확인</button>
		<img src="${pageContext.request.contextPath}/resources/images/before.png" alt="before">
		<a href="#"><img src="${pageContext.request.contextPath}/resources/images/next.png" alt="next"></a>
	</form>
	
	
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>















