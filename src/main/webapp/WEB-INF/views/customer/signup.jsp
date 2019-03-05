<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	.signup_container{
		width:400px;
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
		padding: 0px 5px;
	}
	.signup_container #id_check{
		border: none;
		background: white;
		color:#A3918F;
		font-family: 'Jua', sans-serif;
	}
	.signup_container #password_check_msg{
		display: none;
	}
	.signup_container>button{
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
				<input type="text" name="customerName" placeholder="2-5자리 한글로 입력하세요">
			</p>
			<p>
				<label>ID</label>
				<input type="text" name="id">
				<button id="id_check">ID중복확인</button>
			</p>
			<p>
				<label>PASSWORD</label>
				<input type="password" name="password" placeholder="8-15자리  입력해주세요">
			</p>
			<p>
				<label>PW CHECK</label>
				<input type="password" name="password_check" placeholder="동일하게 입력하세요">
				<span id="password_check_msg">일치</span>
			</p>
			<p>
				<label>EMAIL</label>
				<input type="text" name="email"> 
			</p>
			<button type="submit" id="submit"><span>Sign Up</span></button>
		</div>		
	</form>
	<script>
	$(function(){
		//아이디 중복확인
		$("#id_check").click(function(){
			
		})
		//비밀번호 일치확인
		$("input[name=password_check]").change(function(){
			var ori_password = $("input[name=password]").val();
			var check_password = $("input[name=password_check]").val();
			if(ori_password==check_password){
				$("#password_check_msg").show();
			}else{
				$("#password_check_msg").hide();
			}
		})
		//가입버튼 누르기
		/* $("#submit").click(function(){
			alert("가입이 완료되었습니다.");
			/* //이름 한글 확인(한글 2-5자리 수)
			var name = $("input[name=customerName]").val();
			var reg = /^[가-힣]{2,5}$/;
			var nameResult = reg.test(name);
			if(!nameResult){
				alert("이름은 2~5자리의 한글로만 입력해주세요");
				return false;	
			}
			
			//비밀번호 확인 (특수문자, 문자, 숫자 포함 형태의 8-15자리)
			var password = $("input[name=password]").val();
			var reg = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			var pwResult = reg.test(password);
			if(!pwResult){
				alert("비밀번호는 8~15자리의 영문,숫자,특수문자로 이루어져야 합니다.");
				return false;
			}
			//이메일 규격 확인
			var email = $("input[name=email]").val();
			var reg = /^\w{5,12}@[a-z]{2,10}[\.][a-z]{2,3}[\.]?[a-z]{0,2}$/;
			
			var emailResult = reg.test(email);
			
			if(!emailResult){
				alert("이메일을 다시 입력해주세요.");
				return false;
			} */
		}) */
	})
	
	</script>
	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>

















