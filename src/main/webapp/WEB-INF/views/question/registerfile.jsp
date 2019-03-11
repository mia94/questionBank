<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
	.form_container{
		width:1000px;
		margin: 50px auto; 
	}
	.form_container h3,.form_container h5{
		font-family: 'Righteous', 'Jua';
	}
	.form_container p{
		font-size: 12px;
		color:#666; 
	}
	.upload-btn-wrapper {
	  position: relative;
	  overflow: hidden;
	  display: inline-block;
	  margin: 70px 450px 100px;
	} 
	.btn {
	  color: #A3918F;
	  padding: 8px 20px;
	  border-radius: 8px;
	  font-size: 20px;
	  font-weight: bold;
	  border: 2px solid #A3918F !important;
	  background:white; 
	}
	input[type=file] {
	  font-size: 100px;
	  position: absolute;
	  left: 0;
	  top: 0;
	  opacity: 0;
	}
	.upload-btn-wrapper button{
		background: none;
		border:none;
		color: #A3918F; 
		float: right;
	}
	.form_container img{
		width:100%;
	}
	.form_container table{
		width:100%;
		border-collapse: collapse;
		margin: 50px auto;
	}
	.form_container table td{
		border:1px solid #eee;
		padding: 10px;
		font-size: 12px; 
	}
	.form_container table tr:first-child, .form_container table td:first-child{
		background-color: #A3918F;
		color:white;
		font-size: 14px; 
		font-family: 'Righteous', 'Jua';
	}
	.form_container table tr:first-child{
		text-align: center;
	}
	.form_container table td:first-child { 
		text-align: right; 
		width:200px;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
		<div class="form_container">
			 <h3>문제추가</h3>
			 <p>형식이 일치하는 csv파일을 등록해주세요(각 문항은 쉼표(,)로 구분)</p>
			 <form action="registerfile" method="post" enctype="multipart/form-data" >
				 <div class="upload-btn-wrapper">
					 <button class="btn">Upload a file</button>
					 <input type="file">
				 </div>
				 <button type="submit">등록</button>
			 </form>
			 <h5>파일 형식 예시 : 2018년 2회차 전자계산기 구조 문제</h5>
		 	<img src="${pageContext.request.contextPath}/resources/upload/patten.png">  
			 	<table>
			 		<tr>
			 			<td></td>
			 			<td>주의사항</td>
			 		</tr>
			 		<tr>
			 			<td>QUESTION_CODE</td>
			 			<td>Q 과목(1) 연도(4) 회차(1) 번호(3) <BR> ex)2018년1회차데이터베이스1번문제 : QD201801001입력</td>
			 		</tr>
			 		<tr>
			 			<td>
			 				CORRECT<br>
			 				CORRECT_RATE<br>
			 				ROUND<br>
			 			</td>
			 			<td>1자리 정수로 입력</td>
			 		</tr>
			 		<tr>
			 			<td>YEAR</td>
			 			<td>4자리 정수로 입력</td>
			 		</tr>
			 		<tr>
			 			<td>SUBJECT</td>
			 			<td>
			 				1자리 알파벳 대문자 입력<br>
			 				규격<br>
			 				데이터베이스 : D<br>
			 				전자계산기 구조 : A<br>
			 				운영체제 : O<br>
			 				소프트웨어 공학 : S<br>
			 				데이터통신 : C<br>
			 			</td>
			 		</tr>
			 	</table>
		</div>
		
		<script>
			$(function(){
				$("button").click(function(){
					var file = $("input").val();
				})
			})
		</script>
		
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>

















