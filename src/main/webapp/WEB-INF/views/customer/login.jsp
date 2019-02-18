<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	.login_container{
		width:300px;
		margin: 0px auto;
		padding-top: 200px;
	}
	.login_container label{
		width: 100px;
		float: left;
		color:#5B4149;
		text-align: right;
		padding-right: 20px;
	}
	.login_container input{
		border-radius: 5px;
		border:1px #A3918F solid;
	}
	.login_container button{
		border: none;
		background: white;
		margin-left:120px;
		margin-top:20px;
		font-size: 20px;
		font-family: 'Righteous', cursive; 
		color:#A3918F;
	}
	.login_container button:hover{
		color:5B4149;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<form action="login" method="post" id="wsm_loginForm">
		<div class="login_container">
			<p>
				<label>ID</label>
				<input type="text" name="id">
			</p>
			<p>
				<label>PASSWORD</label>
				<input type="password" name="password">
			</p>
			<button type="submit"><span>Login</span></button>
		</div>		
	</form>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>