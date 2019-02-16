<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	.signup_container{
		width:300px;
		margin: 0px auto;
		padding-top: 200px;
	}
	.signup_container label{
		width: 100px;
		float: left;
		color:#5B4149;
		text-align: right;
		padding-right: 20px;
	}
	.signup_container input{
		border-radius: 5px;
		border:1px #A3918F solid;
	}
	.signup_container button{
		border: none;
		background: white;
		margin-left:120px;
		padding-top:20px;
		font-size: 20px;
		font-family: 'Righteous', cursive; 
		color:#A3918F;
	}
	.signup_container button:hover{
		color:5B4149;
	}
</style>
</head>
<body>

	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<form action="signup" method="post" id="wsm_signupForm">
		<div class="signup_container">
			<p>
				<label>NAME</label>
				<input type="text" name="customerName">
			</p>
			<p>
				<label>ID</label>
				<input type="text" name="id">
			</p>
			<p>
				<label>PASSWORD</label>
				<input type="password" name="password">
			</p>
			<p>
				<label>EMAIL</label>
				<input type="text" name="email">
			</p>
			<button type="submit"><span>Sign Up</span></button>
		</div>		
	</form>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>