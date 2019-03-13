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
		padding-top: 150px;  
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
		font-size: 20px;
		font-family: 'Righteous', 'Jua';
		color:#A3918F;
		margin:10px;
	}
	.mypage_container button:hover{
		color:5B4149;
	}
</style>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
	
	<form action="modify" method="post" id="wsm_signupForm">
		<div class="mypage_container">
			<p>
				<label>NAME</label>
				<input type="hidden" name="customerCode" value="${vo.customerCode }">
				<input type="hidden" name="password" value="${vo.password }">
				<input type="text" name="customerName" value="${vo.customerName }">
			</p>
			<p>
				<label>ID</label>
				<input type="text" name="id" value="${vo.id }" readonly> 
			</p>
			<p>
				<label>EMAIL</label>
				<input type="text" name="email" value="${vo.email }"> 
			</p>
			<p>
				<label>EMPLOYEE</label>
				<input type="checkbox" name="employee" value="true">
			</p>

			<button type="submit"><span>수정완료</span></button>
			<button type="button"><span>회원삭제</span></button>
		</div>		
	</form>
	
	<script>
		$(function(){
			if(${vo.employee}){
				$("input[name=employee]").attr("checked",true);
			}
		})
	</script>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>