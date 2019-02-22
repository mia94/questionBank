<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title> 
<style>
	.form_container{
		 width:900px;
		 margin: 30px auto;
	}
	.form_container h2{
		font-family: 'Righteous', 'Jua';
	}
	.wsm_questionreg label{
		width:150px;
		float: left;
		text-align: right;
		margin-right: 20px;
	}
	input[name="questionTitle"], input[name="choice1"], input[name="choice2"], input[name="choice3"], input[name="choice4"]{
		width:400px;
	}
	/*select 버튼용*/
	
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<script>
	$(function(){
		for(var i = 1;i<101;i++){
			$("#selectNumber").append("<option value='"+i+"'> "+i+" </option>");
		}
	})
	</script>
	
	<div class="form_container">
	  <h2>문제 추가</h2>
	  <form  action="register" method="post" enctype="multipart/form-data">
	  	<!-- <p class="wsm_questionreg">
	  		<label>questionCode</label>
	  		<input type="text" name="questionCode">
	  	</p> -->
	  	<p class="wsm_questionreg">
	  		<label>연도/회차 /과목/번호</label>
		  	<select name="year" id="select-profession"> 
		  		<option value="2018">2018</option>
		  		<option value="2017">2017</option>
		  		<option value="2016">2016</option>
		  		<option value="2015">2015</option>
		  	</select>
	  		<select name="round">
	  			<option value="1">1</option>
	  			<option value="2">2</option> 
	  			<option value="3">3</option>
	  		</select>
	  		<select name="subject">
	  			<option value="D">데이터통신</option>
	  			<option value="A">전자계산기 구조</option>
	  			<option value="O">운영체제</option>
	  			<option value="S">소프트웨어 공학</option>
	  			<option value="C">데이터 통신</option>
	  		</select>
	  		<select name="number" id="selectNumber">
	  		</select>
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
			<input type="radio" name="correct"> 1
			<input type="radio" name="correct"> 2
			<input type="radio" name="correct"> 3
			<input type="radio" name="correct"> 4
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>상태</label>
	  		<input type="radio" name="state" value="정상"> 정상
	  		<input type="radio" name="state" value="수정요청"> 수정요청
	  		<input type="radio" name="state" value="보류"> 보류
	  		<input type="radio" name="state" value="오류"> 오류
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>사진 / 보기 / 예문</label>
	  		<input type="file" name="pictureFile">
	  	</p>
	  	<p>
	        <button type="submit" id="registerQ">Submit</button>
	  	</p>
	  </form>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
	
	
</body>
</html>