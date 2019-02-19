<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.mypage_container{
		width:300px;
		margin: 0px auto;
		padding-top: 200px;
	}
	.mypage_container label{
		width: 100px;
		float: left;
		color:#5B4149;
		text-align: right;
		padding-right: 20px;
	}
	.mypage_container input{
		border-radius: 5px;
		border:1px #A3918F solid;
		padding: 0 5px;
	}
	.mypage_container button{
		border: none;
		background: white;
		margin-left:120px;
		padding-top:20px;
		font-size: 20px;
		font-family: 'Righteous', cursive; 
		color:#A3918F;
	}
	.mypage_container button:hover{
		color:5B4149;
	}
</style>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
	
	<form action="mypage" method="post" id="wsm_signupForm">
		<div class="mypage_container">
			<p>
				<label>NAME</label>
				<input type="text" name="id" value="${login.customerName}" readonly>
			</p>
			<p>
				<label>EMAIL</label>
				<input type="text" name="email" value="${login.email}"> 
			</p>
			<p>
				<label>ID</label>
				<input type="text" name="customerName" value="${login.id}" readonly>
			</p>
			<p>
				<label>PASSWORD</label>
				<input type="password" name="password">
			</p>
			<p>
				<label>PASSWORD CHECK</label>
				<input type="password" name="password_check">
			</p>
			
			<button type="submit"><span>Modify</span></button>
		</div>		
	</form>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>