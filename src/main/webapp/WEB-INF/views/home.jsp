<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<title>Wooooo's QuestionBank</title> 
<style>
	.home_container1{
		width:100%;
		height: 447px;
		margin:20px auto;
		border-radius: 10px;
	}
	.home_container1 img{
		width:100%;
	}
	.home_container2{
		width:100%;
		height: 590px;
		margin:20px auto;
	}
	.home_container>div#color1{
		background-color:#5B4149;/* 진갈색  */
		background-color: F6EFEC; /* 연베이지 */
		background-color:#A3918F;/* 코코아 */
		background-color:#F3C2BA; /* 연핑크 */
		background-color:#F28683; /* 진핑크 */
	}

</style>
</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
	<div class="home_container1">
		<img src="${pageContext.request.contextPath}/resources/images/main.jpg">
	</div>
	<div class="home_container2">
		<img>
	</div>
	<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>
