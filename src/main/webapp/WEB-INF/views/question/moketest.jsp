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
<script>
	$(function(){
		makeArray();
	})
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
	.custom-select,button#test_select{
		float: left;
		margin-top: 30px;
		margin-bottom: 20px;
	}
	.custom-select:first-child{ 
		margin-left: 150px;
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
	aside{
		width:170px; 
		height: 566px;
		position: fixed;
		top:190px; 
		right: 330px;  
	}
	aside article{
		width:34px; 
		height: 26px;
		border: 0.5px solid #F6EFEC; 
		float: left;
		text-align: center;
		font-size: 12px;
		line-height: 26px;
		color:#A3918F; 
	}
	aside div{
		width:170px;
		height: 40px;
		line-height:40px;
		text-align: center;
		margin-top: 2px;
		background-color: #A3918F;
		color:white; 
		border-radius:5px;
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
					<p class="code">${item.questionCode}</p>
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
	
	<aside>
		<c:forEach var="i" begin="1" end="100" step="1">
			<article>
				${i}
			</article>
		</c:forEach>
		<div>제출하기</div>
	</aside>
	
		<div class="text-center">
			<ul class="pagination">
				<c:if test="${pageMaker.prev }">
					<li><a href="${pageContext.request.contextPath}/question/moketest?page=${pageMaker.startPage-1}">&laquo;</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					<%-- <li ${pageMaker.cri.page == idx ? 'class="active"': ''} ><a href="${pageContext.request.contextPath}/question/moketest?page=${idx}" class="wsm_active_a">${idx}</a></li> --%>
					<li ${pageMaker.cri.page == idx ? 'class="active"': ''} ><a href="#" class="wsm_active_a">${idx}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next }">
					<li><a href="${pageContext.request.contextPath}/question/moketest?page=${pageMaker.endPage+1}">&raquo;</a></li>
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
 			//페이지 선택시 ajax를 이용하여 넘어가도록 처리하기
 			$(".wsm_active_a").click(function(){
 				var num = $(this).text();
 				getPageList(num);
 			})
 			
			//연도,회차 선택시 해당 리스트 불러오기
  			$("#test_select").click(function(){
  				getPageList(1)
  				makeArray();
  			});
  			
  			//라디오버튼 클릭 시(정답체크시)
  			$(document).on("click","input[type=radio]",function(){
  				//체크한 라디오버튼 배경색주기
  				$(this).next().css("background-color","#F28683");
  				//체크한 문제는 article에 표시
  				var code = $(this).closest("div").children(".code").text();//questionCode풀네임
  				var num = code.substring(7,10);//번호 출력
  				var index = num-1;
  				document.getElementsByTagName( 'article' )[index].style.backgroundColor = "#F6EFEC"; 
  				//체크한 정답 배열에 저장
  				qArray[index]=code;//해당 인덱스 qArray에 문제코드 저장
  				var value = $(this).val();//선택한 정답
  				aArray[index]=value;//선택한 정답 정답배열 해당index에 넣기
  				
  			})
  		}) 	
 	
 	</script>
	
	<script>
		/* page처리가 ajax아닐때 쓴 함수 
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
		} */
		
		//페이지 ajax처리하기
		function getPageList(page){
			var year = $("#year").val();
			var round = $("#round").val();
			
			Handlebars.registerHelper('ifCond', function(v1, options) {
				if(v1 === "" || v1 === null) {
				   return options.fn(this);
				}
				return options.inverse(this);
			})
			
			$.ajax({
				url:"${pageContext.request.contextPath}/question/listJson/"+year+"/"+round+"/"+page,
				type:"get",
				dataType:"json",
				success:function(json){
					console.log(json);
					$(".container_wrap").empty(); 
				
				var source = $("#template1").html();
				var f = Handlebars.compile(source);
				var result = f(json.list);
				$(".container_wrap").append(result);

				}
			})
		}
		
		//배열 길이와 기초값 저장해두는 함수
		function makeArray(){
			//문제코드를 저장한 배열
			var qArray = new Array();
			//첫코드에서 연도와 회차 빼오기
			var code = $(".code").text();
			var yearRound = code.substr(2,5);
			
			for(var j=0;j<100;j++){
				var str = "00"+(j+1);
				str = str.slice(-3);
				if(j<20){
					aArray[j]="QD"+yearRound+str;
				}else if(i<40){
					aArray[j]="QA"+yearRound+str;
				}else if(i<60){
					aArray[j]="QO"+yearRound+str;
				}else if(i<80){
					aArray[j]="QS"+yearRound+str;
				}else{
					aArray[j]="QC"+year+round+str;
				}
			}
			//정답을 저장할 배열(길이100) 선언, 초기에 모두 0으로 값 입력
			var aArray = new Array();
			for(var i=0;i<100;i++){
				aArray[i]=0;
			}
		}
	</script>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
  	
</body>
</html>













