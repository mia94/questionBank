<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="container">
	  <h2>Question form</h2>
	  <form  action="register" method="post" enctype="multipart/form-data">
	  	<p>
	  		<label>questionCode</label>
	  		<input type="text" name="questionCode">
	  	</p>
	  	<p>
	  		<label>questionTitle</label>
	  		<input type="text" name="questionTitle" size="70">
	  	</p>
	  	<p>
	  		<label>choice1</label>
	  		<input type="text" name="choice1">
	  	</p>
	  	<p>
	  		<label>choice2</label>
	  		<input type="text" name="choice2">
	  	</p>
	  	<p>
	  		<label>choice3</label>
	  		<input type="text" name="choice3">
	  	</p>
	  	<p>
	  		<label>choice4</label>
	  		<input type="text" name="choice4">
	  	</p>
	  	<p>
	  		<label>correct</label>
	  		<input type="text" name="correct">
	  	</p>
	  	<p>
	  		<label>state</label>
	  		<input type="text" name="state">
	  	</p>
	  	<p>
	  		<label>correctRate</label>
	  		<input type="text" name="correctRate">
	  	</p>
	  	<p>
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