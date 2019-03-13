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
		

	})
</script>
<title>Insert title here</title>
<style>
	/*-----------------------------------------------req부분*/
	#reqUpdate_container table{
		border-collapse: collapse;
		width:900px; 
		font-size: 12px;
	}
	.question_wrap{
		position: relative;
	}
	#modify_btn{
		position: absolute;
		bottom: 20px;
		right: 20px;
		width:120px;
		background:none;
		border:none;
		color:#A3918F;
		font-family: 'Jua', sans-serif;  
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
					<p>이 문제의 정답은 ${vo.correct} 번 입니다</p> 
					<c:if test="${login.employee}">
						<button type="button" id="modify_btn">문제 수정하러 가기!</button> 
					</c:if>
				</div>
		</div>
		<button type="button" id="test_submit">정답확인</button>

	</form>
	
	<!-- 문제에 대한 건의사항 -->
	
	<div id="reqUpdate_container">
		<table id="reqUpdate_table">
			<tr>
				<td>문제코드</td>
				<td>변경사유</td>
				<td>요청정답</td>
				<td>글쓴이</td>
				<td>게시 날짜</td>
				<td>처리 상태</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="8">등록된 게시글이 없습니다.</td>
			</tr>
		</table>
	</div>
	
	<script>
		$(function(){
			getPageList();
			
			//요청사항 상태수정
			$(document).on("click",".modReq",function(){
				confirm("처리상태를 수정하시겠습니까?");
				//수정버튼 완료버튼과 취소버튼으로 바꾸기
				$(this).closest("td").append("<button class='updateReq'>완료</button><button class='cancel'>취소</button>");
				//처리상태 부분 입력가능한 창으로 바꾸기
				$(this).closest("tr").children(".req_state").empty();
				$(this).closest("tr").children(".req_state").append("<input type='text' name='state' size=5 class='state'>");
				//수정버튼 숨기기
				$(this).hide();
			})
			
			//완료클릭시 처리상태 변경
			$(document).on("click",".updateReq",function(){
				var state = $(this).closest("tr").find(".state").val();//children은 바로아래만, 자손까지 찾으려면 find사용
				var reqCode = $(this).closest("tr").find(".reqCode").val();
				$.ajax({
					url:"${pageContext.request.contextPath}/reqUpdate/"+reqCode+"/"+state,
					type:"put",
					dataType:"text",
					success:function(json){
						console.log(json);
						if(json == "success"){
							alert("수정되었습니다.");
						}
						getPageList();
					}
				})
				
			})
			
			//취소클릭시 원래 창으로 돌아오기
			$(document).on("click",".cancel",function(){
				confirm("처리상태 수정작업을 취소 하시겠습니까?");
				var questionCode = "${vo.questionCode}";
				location.href = "${pageContext.request.contextPath}/reqUpdate/check?question="+questionCode;
			})
			
			//문제수정하러가기
			$("#modify_btn").click(function(){
				var questionCode = "${vo.questionCode}";
				location.href = "${pageContext.request.contextPath}/question/modify?questionCode="+questionCode;
			})
			
			//요청사항 작성자가 삭제
			$(document).on("click",".delReq",function(){
				confirm("삭제하시겠습니까?");
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
			<td></td>
		</tr>
		{{#ifCond content}} 
			<tr>
				<td colspan="7">등록된 게시글이 없습니다.</td>
			</tr>
		{{else}}
    		{{#each.}}
				<tr> 
					<td>
						{{question.questionCode}}
						<input type="hidden" value="{{reqCode}}" class="reqCode">
					</td>
					<td>{{content}}</td>
					<td>{{oriCorrect}}</td>
					<td>{{writer.customerCode}}</td>
					<td>{{tempDate moddate}}</td>
					<td class="req_state">{{state}}</td>
					{{#ifWriter writer.customerCode}} 
						<td>
							<button class="delReq">삭제</button>
							<input type="hidden" value="{{reqCode}}" class="reqCode">
						</td>
					{{else}}
    					<td></td>
					{{/ifWriter}}
					{{#isEmployee '${login.employee}'}}  
						<td>
							<button class="modReq">수정</button>
							<input type="hidden" value="{{reqCode}}" class="reqCode">
						</td>
					{{else}}
    					<td></td>
					{{/isEmployee}}
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
	
	Handlebars.registerHelper('isEmployee', function(v1, options) {
			if(v1) {  
			   return options.fn(this);
			}
			return options.inverse(this);
	})
	
	var question = "${vo.questionCode}";
	
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

	
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>















