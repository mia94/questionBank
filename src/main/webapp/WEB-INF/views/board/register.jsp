<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.board_container{
		width:900px;
		margin: 0px auto;
		padding-top: 50px;
	}
	.board_container h3{
		font-family: 'Righteous', 'Jua'; 
		padding-bottom: 50px;
		width: 900px;
		text-align: center;
	}
	.board_container label{
		width:150px;
	}
	.board_container input[name=board_title],.board_container textarea{
		width:700px;
	}
</style>
</head>
<body>

	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<div class="board_container">
		<h3>Board</h3>
		<form action="register" method="post">
			<p>
				<label>제목</label>
				<input type="text" name="board_title">
			</p>
			<p>
				<label>내용</label>
				<textarea rows="10" cols="80" name="content"></textarea>
			</p>
			<button type="button">취소</button>
			<button type="submit">작성</button>
		</form>
	</div>
	

	
	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>