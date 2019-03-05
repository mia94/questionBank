<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	
</style>
</head>
<body>

	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<div class="board_container">
		<form action="register" method="post">
			<p>
				<label>제목</label>
				<input type="text">
			</p>
			<p>
				<label>내용</label>
				<textarea rows="5" cols="80"></textarea>
			</p>
		</form>
	</div>
	

	
	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>