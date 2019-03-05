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
<link href="${pageContext.request.contextPath}/resources/css/singleAndCheck.css" rel="stylesheet"  type="text/css">
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
		//다음버튼 이미지 클릭시 다음랜덤 문제로 넘어감
		$("img[alt*=next]").click(function(){
			var customerCode = $("input[name=customerCode]").val();
			if(customerCode==""){
				alert("로그인창으로 이동합니다."); 
				location.href="${pageContext.request.contextPath}/user/login";
			}else{
				$("#wsm_testForm").submit();
			}
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
	/*----------------------------------------카운터*/
	#counter{
		width:300px;
		position: absolute; 
		right: -75px; 
		top: 5px;
	}
	/*-------------------------------------------------------reqUpdate 부분*/
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

</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div id="counter" style='font-size:12pt'></div>
	<form action="singletest" method="post" id="wsm_testForm">
		<div class="container_wrap">
				<div class="question_wrap">
					<span class="subject"></span>
					<p class="code">${list.get(1).questionCode}</p>
					<p>${list.get(1).questionTitle}</p>
					<c:if test="${list.get(1).picture.equals('')==false}">
  						<img src="displayFile?filename=${list.get(1).picture }">
  					</c:if>
					<br>
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
		<%-- <a href="#"><img src="${pageContext.request.contextPath}/resources/upload/before.png" alt="before"></a> --%>
		<a href="#"><img src="${pageContext.request.contextPath}/resources/upload/next.png" alt="next"></a>
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
				<td>처리상태</td>
			</tr>
			<tr>
				<td colspan="6">등록된 게시글이 없습니다.</td>
			</tr>
		</table>
	</div>
	
	<script>
	$(function(){
		getPageList();
		
		$("#reqUpdate_register").click(function(){
			//수정요청 작성시
			var reqCorrect = $("select").val();
			var content = $("textarea").val();
			var question = "${list.get(1).questionCode}"; 
			var oriCorrect = "${list.get(1).correct}";
			var state = "요청";
			var writer = "${login.customerCode}";
			
			//@RequestBody를 사용했기때문에
			var jsonBody = {reqCorrect:reqCorrect, content:content, question:{questionCode:question}, oriCorrect:oriCorrect,state:state, writer:{customerCode:writer}};
			//@RequestBody를 사용했으면headers, JSON.stringify를 반드시 사용해야함
			$.ajax({
				url:"${pageContext.request.contextPath}/reqUpdate/register",
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
						$("textarea").val("");
						alert("등록하였습니다.");
						getPageList();
					}
				}
			})
		})
		
		$(document).on("click",".delReq",function(){
			alert("삭제확인용");
			var reqCode = $(this).next(".reqCode").val();
			$.ajax({
				url:"${pageContext.request.contextPath}/reqUpdate/"+reqCode,
				type:"delete",
				dataType:"text",
				success:function(json){
					console.log(json);
					if(json == "success"){
						alert("삭제되었습니다.");
					}
					getPageList();
				}
			})
		})
		
	})
	</script>
	
	<script id="template1" type="text/x-handlebars-template"> 
		<tr>
			<td>문제코드</td>
			<td>변경사유</td>
			<td>요청정답</td>
			<td>글쓴이</td>
			<td>게시 날짜</td>
			<td>처리상태</td>
			<td></td>
		</tr>
		{{#ifCond question.questionCode}} 
			<tr>
				<td colspan="7">등록된 게시글이 없습니다.</td>
			</tr>
		{{else}}
    		{{#each.}}
				<tr> 
					<td>{{question.questionCode}}</td>
					<td>{{content}}</td>
					<td>{{oriCorrect}}</td>
					<td>{{writer.customerCode}}</td>
					<td>{{tempDate moddate}}</td>
					<td>{{state}}</td>
					{{#ifWriter writer.customerCode}} 
						<td>
							<button class="delReq">삭제</button>
							<input type="hidden" value="{{reqCode}}" class="reqCode">
						</td>
					{{else}}
    					<td></td>
					{{/ifWriter}}
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
		
	Handlebars.registerHelper('ifWriter', function(v1, options) {
			if(v1 == '${login.customerCode}') {  
			   return options.fn(this);
			}
			return options.inverse(this);
		})
	
	var question = "${list.get(1).questionCode}";
	
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
	
	<script src="${pageContext.request.contextPath}/resources/js/select.js"></script>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>















