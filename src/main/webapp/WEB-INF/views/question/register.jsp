<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.wsm_questionreg label{
		width:150px;
		float: left;
		text-align: right;
		margin-right: 20px;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="container">
	  <h2>Question form</h2>
	  <form  action="register" method="post" enctype="multipart/form-data">
	  	<!-- <p class="wsm_questionreg">
	  		<label>questionCode</label>
	  		<input type="text" name="questionCode">
	  	</p> -->
	  	<p class="wsm_questionreg">
	  		<label>questionNumber</label>
	  		<input type="text" name="number">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>questionTitle</label>
	  		<input type="text" name="questionTitle" size="70">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>choice1</label>
	  		<input type="text" name="choice1">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>choice2</label>
	  		<input type="text" name="choice2">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>choice3</label>
	  		<input type="text" name="choice3">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>choice4</label>
	  		<input type="text" name="choice4">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>correct</label>
	  		<input type="text" name="correct">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>state</label>
	  		<input type="text" name="state">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>correctRate</label>
	  		<input type="text" name="correctRate">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>Subject</label>
	  		<input type="text" name="subject">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>Year</label>
	  		<input type="text" name="year">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>Round</label>
	  		<input type="text" name="round">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>picture</label>
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