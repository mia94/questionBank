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
	
	<div id="main_container">
		<ul>
			<li><a href="${pageContext.request.contextPath}/question/moketest">모의고사</a></li><!-- session변수에 perpage담기 -->
			<li><a href="#">과목별 문제풀기</a></li>
			<li><a href="#">한문제씩 풀기</a></li>
			<li><a href="#"></a></li>
		</ul>
	</div>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>