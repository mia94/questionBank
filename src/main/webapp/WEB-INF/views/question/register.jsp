<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title> 
<link href="${pageContext.request.contextPath}/resources/css/register_select.css" rel="stylesheet"  type="text/css">
<style>
	.form_container{
		 width:1000px;
		 margin: 50px auto; 
		 border:1px solid #ccc;
		 padding: 10px 40px; 
	}
	.form_container h2{
		font-family: 'Righteous', 'Jua';
	}
	.wsm_questionreg{
		margin-top: 10px;
	}
	.wsm_questionreg label{
		width:100px;
		float: left;
		text-align: right;
		margin-right: 10px; 
		color:#A3918F;
	}
	input[name="questionTitle"], input[name="choice1"], input[name="choice2"], input[name="choice3"], input[name="choice4"]{
		width:400px;
	}
	input[type=text]{
		border: none;
		border-bottom: 1px solid #eee;
	}
	input[type=radio]{
		margin: 0 15px; 
	}
	/*라디오 버튼*/
	.checks {
		position: relative;
		display: inline-block;
		width:70px; 
	} 
	.checks input[type="radio"] { 
		position: absolute; 
		width: 1px; 
		height: 1px; 
		padding: 0; 
		margin: -1px; 
		overflow: hidden; 
		clip:rect(0,0,0,0); 
		border: 0; 
	} 
	.checks label{
		font-size: 12px;
	}
	.checks input[type="radio"] + label { 
		display: inline-block; 
		position: relative; 
		padding-left: 30px; 
		cursor: pointer; 
		-webkit-user-select: none; 
		-moz-user-select: none; 
		-ms-user-select: none; 
	} 
	.checks input[type="radio"] + label:before { 
		content: ''; 
		position: absolute; 
		left: 0; 
		top: 2px; 
		width: 15px; 
		height: 15px; 
		text-align: center; 
		background: #fafafa; 
		border: 1px solid #cacece; 
		border-radius: 100%; 
		box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05); 
	} 
	.checks input[type="radio"] + label:active:before, .checks input[type="radio"]:checked + label:active:before { 
		box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1); 
	} 
	.checks input[type="radio"]:checked + label:before { 
		background: #E9ECEE; 
		border-color: #adb8c0; 
	} 
	.checks input[type="radio"]:checked + label:after { 
		content: ''; 
		position: absolute; 
		top: 1px; 
		left: 5px; 
		width: 13px; 
		height: 13px; 
		background: #99a1a7; 
		border-radius: 100%; 
		box-shadow: inset 0px 0px 10px rgba(0,0,0,0.3); 
	}
	/* submit 버튼 */
	button#registerQ, button.registerQ{
		border: none;
		background: white;
		margin-left:20px;
		margin-top:20px;
		font-size: 20px;
		font-family: 'Righteous', cursive;  
		color:#A3918F;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<div class="form_container">
	  <h2>문제 추가</h2>
	  <form  action="register" method="post" enctype="multipart/form-data">
	  	<!-- <p class="wsm_questionreg">
	  		<label>questionCode</label>
	  		<input type="text" name="questionCode">
	  	</p> -->
	  	<p class="wsm_questionreg">
	  		<div class="custom-select">
		  		<select name="year"> 
		  			<option value="">출제 연도</option>
			  		<option value="2018">2018</option> 
			  		<option value="2017">2017</option>
			  		<option value="2016">2016</option>
			  		<option value="2015">2015</option>
			  	</select>
	  		</div>
	  		<div class="custom-select">	
		  		<select name="round">
		  			<option value="">회차</option>
		  			<option value="1">1</option>
		  			<option value="2">2</option> 
		  			<option value="3">3</option>
		  		</select>
	  		</div>
	  		<div class="custom-select">
		  		<select name="subject">
		  			<option value="">과목</option>
		  			<option value="D">데이터통신</option>
		  			<option value="A">전자계산기 구조</option>
		  			<option value="O">운영체제</option>
		  			<option value="S">소프트웨어 공학</option>
		  			<option value="C">데이터 통신</option>
		  		</select>
	  		</div>
	  		<div class="custom-select">
		  		<select name="number">
		  			<option value="">번호</option>
		  			<c:forEach var="cnt" begin="1" end="100" step="1">
		  				<option value='${cnt}'>${cnt}</option>
		  			</c:forEach>
		  		</select>
	  		</div>
	  	</p> 
	  	<p class="wsm_questionreg">
	  		<label>문제</label>
	  		<input type="text" name="questionTitle">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>보기1</label>
	  		<input type="text" name="choice1">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>보기2</label>
	  		<input type="text" name="choice2">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>보기3</label>
	  		<input type="text" name="choice3">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>보기4</label>
	  		<input type="text" name="choice4">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>정답</label>
	  		<div class="checks"> <input type="radio" name="correct" class="ex_rd2" value="1"> <label for="ex_rd2">1</label> </div>
	  		<div class="checks"> <input type="radio" name="correct" class="ex_rd2" value="2"> <label for="ex_rd2">2</label> </div>
	  		<div class="checks"> <input type="radio" name="correct" class="ex_rd2" value="3"> <label for="ex_rd2">3</label> </div>
	  		<div class="checks"> <input type="radio" name="correct" class="ex_rd2" value="4"> <label for="ex_rd2">4</label> </div>
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>상태</label>
	  		<div class="checks"> <input type="radio" name="state" class="ex_rd2" value="정상"> <label for="ex_rd2">정상</label> </div>
	  		<div class="checks"> <input type="radio" name="state" class="ex_rd2" value="요청"> <label for="ex_rd2">요청</label> </div>
	  		<div class="checks"> <input type="radio" name="state" class="ex_rd2" value="보류"> <label for="ex_rd2">보류</label> </div>
	  		<div class="checks"> <input type="radio" name="state" class="ex_rd2" value="오류"> <label for="ex_rd2">오류</label> </div>
	  	</p> 
	  	<p class="wsm_questionreg">
	  		<label>사진 / 예문</label>
	  		<input type="file" name="pictureFile">
	  	</p>
	  	<p>
	        <button type="button" class="registerQ" data-toggle="modal" data-target="#myModal">Submit</button>
	  	</p> 
	  </form>
	  
	  <!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">추가하는 문제 내용을 확인해주세요</h4>
	        </div>
	        <div class="modal-body">
	          <div class="check_question">
	          	
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="submit" id="registerQ" class="btn btn-default">Submit</button>
	          <button type="button" class="registerQ" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<script>
		$(".registerQ").click(function(){
			var year = $("select[name=year]").val();
			var round = $("select[name=round]").val();
			var subject = $("select[name=subject]").val();
			var number = $("select[name=number]").val();
			
			var questionTitle = $("input[name=questionTitle]").val();
			var choice1 = $("input[name=choice1]").val();
			var choice2 = $("input[name=choice2]").val();
			var choice3 = $("input[name=choice3]").val();
			var choice4 = $("input[name=choice4]").val();
			
			var correct = $("input[name=correct]").val();
			var state = $("input[name=state]").val();
			//받아온 값 디스플레이
			$(".check_question").append("<p>"+year+"년 "+round+"회 "+number+"번"+"</p>");
			$(".check_question").append("<p>"+questionTitle+"</p>");
			$(".check_question").append("<p> ① :"+choice1+"</p>");
			$(".check_question").append("<p> ② :"+choice2+"</p>");
			$(".check_question").append("<p> ③ :"+choice3+"</p>");
			$(".check_question").append("<p> ④ :"+choice4+"</p>");
			$(".check_question").append("<p> 정답 :"+correct+"</p>");
			$(".check_question").append("<p> 상태 :"+state+"</p>");
		})
	</script>
	
	<script src="${pageContext.request.contextPath}/resources/js/select.js"></script>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
	
	
</body>
</html>