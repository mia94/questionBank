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
				$(".question_wrap").css("background-color","#DAE9FF");
				$("input[name=answer]").attr("readonly","readonly");//안먹히는 중
				$("input[name=pass]").val(true);
			}else{
				$("#correct_false").show();
				$("#correct_true").hide();
				$(".question_wrap").css("background-color","#FFEDED");
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
	#reqUpdate_form{
		width:850px;
		margin: 0 auto;
		position: relative;
	}
	#reqUpdate_container #reqUpdate_form label{
		width:80px; 
		float: left; 
		color:#A3918F; 
	}
	#reqUpdate_container #reqUpdate_form button{
		background-color: #F6EFEC;
		color:#5B4149;
		border:2px solid #A3918F;
		border-radius: 3px;
		padding: 3px;
		font-size: 12px;
		width:60px;
		height:60px;
		position: absolute;
		bottom: 5px; 
		right: 30px; 
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
		<div id="reqUpdate_form">
			<p>
				<label>요청정답</label>
				<div class="custom-select">
					<select name="reqCorrect">
						<option value="">선택안함</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
					</select>
				</div>
			</p>
			<p>
				<label>변경사유</label>
				<textarea rows="3" cols="90"></textarea>
				<button id="reqUpdate_register">write</button> 
			</p>
		</div>
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
	

	


	
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>















