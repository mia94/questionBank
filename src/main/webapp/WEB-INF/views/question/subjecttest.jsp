<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/radiobutton.css" rel="stylesheet"  type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/select.css" rel="stylesheet"  type="text/css">
<title>Insert title here</title>
<script>
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
</script>
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
	#counter{
		width:300px;
		position: absolute;
		right: 105px;
		top: -20px;
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
	aside {
		width:240px;
		height:180px; 
		position: fixed;
		right: 270px;  
		top: 280px;
	}
	aside article{
		width:30px;  
		height: 25px;
		float: left;
		text-align: center;
		border:0.3px solid #F6EFEC;
		font-size: 12px;
		color:#A3918F;
		line-height: 25px;
	}
	#test_submit{ 
		border: 3px solid #A3918F;
		border-radius:5px; 
		padding:5px;
		width:240px;
		text-align:center;
		background: white;
		font-size: 16px;
		font-family: 'Jua', sans-serif;
		color:#A3918F;
		position: absolute;
		bottom: 0;
		left: 0;
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
		<div id="counter" style='font-size:12pt'></div>
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
					<input type="hidden" name='isChecked' value='false'>
					<input type="hidden" name='thisCode' value=''>
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
		<aside>
			<c:forEach var="i" begin="1" end="20" step="1">
				<article>
					${i}
				</article>
				<article class="answer_article">
					
				</article>
			</c:forEach>
			<button type="submit" id="test_submit">제출하기</button>
		</aside>
	
	<%-- 과목에 페이지가 필요없을듯?? 
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
	</div> --%>
	
	<script id="template1" type="text/x-handlebars-template"> 
	{{#each.}}
		<div class="question_wrap">
			<input type="hidden" name='isChecked' value='false'>
			<p class='code'>{{questionCode}}</p>
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
			
			//문제코드를 저장한 배열
			var qArray = new Array();
			/* for(var j=0;j<20;j++){
				qArray[j] = document.getElementsByClassName("code")[j].innerHTML;
			} */
			//정답을 저장할 배열(길이20) 선언, 초기에 모두 0으로 값 입력
			var aArray = new Array();
			for(var i=0;i<20;i++){
				aArray[i]=0;
			}
			
			//값 선택시 배열에 저장
			$(document).on("click","input[name=answer]",function(){
				//선택한 보기 라디오버튼 색 변경
				$(this).next().css("background-color","#F28683");
				//선택한 번호 답안지에 기입
				var answer = $(this).val();
				var thisDiv = $(this).closest("div");//현재 div
				var check = thisDiv.children("input[name=answer]").val();
				alert(check);
				var questionDiv = document.getElementsByClassName("question_wrap");//div 배열
				var index = -1;
				/* alert(thisDiv); */
				for(var i=0;i<20;i++){
					if(thisDiv == questionDiv[i]){
						index = i;//i는 현재div의 인덱스
					}
				}
				/* alert(index); */
				document.getElementsByClassName("answer_article")[index].style.backgroundColor = 'red';
				
				
				//값 넘겨주기(resulttest_code는 자동, customer(코드), answer, correct, spendTime, pass, question(코드))
				var customer = $("input[name=customer]").val();
				var correct = $(this).closest("div").children("input[name=correct]").val();
				var pass = false;
				if(correct==answer){ //정답이면 pass로 바꾸기
					pass = true;
				}
				var question = $(this).closest("div").children("input[name*=question]").val();
				var spendTime = 0;//아직처리못함
				
				//받은 값을 배열에 저장해서 보내기
				
			})
			
			//라디오버튼 선택시 insert, 답안변경시 update처리
			/* $("input[name=answer]").on("click",function(){
				//만약 이미 선택했던 답안이 있을 경우 insert문이 아닌 update문으로 처리
				var isChecked = $(this).closest("div").children("input[name=isChecked]").val();
				var codeNum = $(this).closest("div").children("input[name*=thisCode]").val();
				if(isChecked=='true'){
					alert("이미체크된 문제");
					//체크된 보기 표시 변경
					$(this).closest("div").find("span").css("background-color","#eee");//뒤에나오는 css가 덮어씌운댔는데ㅠㅠㅠ왜 안되는고양고양 !important도 안됨
					$(this).next("span").css("background-color","#F28683");
					
					//update처리
					var customer = $("input[name=customer]").val();
					var answer = $("input[name=answer]:checked").val();
					var correct = $(this).closest("div").children("input[name=correct]").val();
					var pass = false;
					if(correct==answer){ //정답이면 pass로 바꾸기
						pass = true;
					}
					var question = $(this).closest("div").children("input[name*=question]").val();
					var spendTime = 0;//아직처리못함
					
					var jsonBody = {answer:answer, correct:correct, pass:pass, spendTime:spendTime};
					//수정은 동일한 주소 put으로 보내기
					$.ajax({
						url:"${pageContext.request.contextPath}/question/subjecttest/"+customer+"/"+question,
						type:"put",
						headers:{
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"POST"
						},
						data:JSON.stringify(jsonBody),//JSON.stringify는 {bno:bno, replyer:replyer, replytext:replytext}이런 스트링으로 변환
						dataType:"text",//String으로 반환되면 객체가 아니기때문에 json이 아닌 text로 받아야함
						success:function(json){
							console.log(json);
							if(json=="success"){
								alert("수정하였습니다.");// 확인용, 나중에 변경할 것
							}
						}
					})
				}else{
					//선택한 보기 라디오버튼 색 변경 & isChecked 값 true로 변경
					$(this).next().css("background-color","#F28683");
					$(this).closest("div").children("input[name=isChecked]").val('true');
					//값 넘겨주기(resulttest_code는 자동, customer(코드), answer, correct, spendTime, pass, question(코드))
					var customer = $("input[name=customer]").val();
					var answer = $("input[name=answer]:checked").val();
					var correct = $(this).closest("div").children("input[name=correct]").val();
					var pass = false;
					if(correct==answer){ //정답이면 pass로 바꾸기
						pass = true;
					}
					var question = $(this).closest("div").children("input[name*=question]").val();
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
						data:JSON.stringify(jsonBody),//JSON.stringify는 {bno:bno, replyer:replyer, replytext:replytext}이런 스트링으로 변환
						dataType:"text",//String으로 반환되면 객체가 아니기때문에 json이 아닌 text로 받아야함
						success:function(json){
							console.log(json);
							$(this).closest("div").children("input[name*=thisCode]").val(json);
						}
					})
				}
			}) */
		})
	</script>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>














