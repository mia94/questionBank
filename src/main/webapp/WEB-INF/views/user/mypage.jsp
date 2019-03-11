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
	
	<form action="mypage" method="post" id="wsm_signupForm">
		<div class="mypage_container">
			<p>
				<label>NAME</label>
				<input type="hidden" name="customerCode" value="${login.customerCode}">
				<input type="text" name="id" value="${login.customerName}">
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
			<button type="button" id="btn_delete"><span>탈퇴하기</span></button>
		</div>		
	</form>
	
	<script>
		$(function(){
			$("#btn_delete").click(function(){
				confirm("탈퇴 하시겠습니까?");
				//비밀번호 두개가 일치하는지 확인
				if($("input[name=password]").val()!=$("input[name=password_check]").val()){
					alert("비밀번호가 일치하지 않습니다.");
					return false;
				}
				//원래 비밀번호가 맞는지 확인(안되는 중)
				var id = $("input[name=id]").val();
				var password = $("input[name=password]").val();
				var jsonBody = {id:id, password:password};
				$.ajax({
					url:"${pageContext.request.contextPath}/customer/checkPasswd",
					type:"get",
					headers:{
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"POST"
					},
					data:JSON.stringify(jsonBody),/*JSON.stringify는 {bno:bno, replyer:replyer, replytext:replytext}이런 스트링으로 변환*/
					dataType:"text",
					success:function(json){
						console.log(json);
						if(json<0){
			            	alert("비밀번호를 다시 입력해주세요");
			            	return false;
			            }else{
			            	alert("확인용");
			            }
					}
				})
				
				var customerCode = $("input[name=customerCode]").val();
				//탈퇴
				$.ajax({
					url:"${pageContext.request.contextPath}/customer/"+customerCode,
					type:"delete",
					dataType:"text",
					success:function(json){
						console.log(json);
						if(json == "success"){
							alert("삭제되었습니다.");
							//삭제 후 home으로 이동
							location.href="${pageContext.request.contextPath}";
						}
					}
				})
			})
			
		})
	</script>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>