<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<title>Wooooo's QuestionBank</title> 
<style>
	.home_container{
		width:100%;
		height: 590px;
		margin:20px auto;
		border-radius: 10px;
		background-color: F6EFEC;
	}
	.home_container>div{
		width:200px;
		height: 10px;
		margin: 20px;
		display: block;
		z-index: 100;
	}
	.home_container>div#color1{
		background-color:#5B4149;
	}
	.home_container>div#color2{
		background-color:#A3918F;
	}
	.home_container>div#color3{
		background-color:#F3C2BA;
	}
	.home_container>div#color4{
		background-color:#F28683;
	}
</style>
</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
	<div class="home_container">
		<div id="color1"></div>
		<div id="color2"></div>
		<div id="color3"></div>
		<div id="color4"></div>
	</div>
	<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>
