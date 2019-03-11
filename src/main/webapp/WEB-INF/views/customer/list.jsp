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
	.list_container{
		width:900px;
		margin: 0 auto;
	}
	table{
		width:700px;
		margin-left: 100px;
		margin-top: 70px;
	}
	table tr{
		border: 0.5px solid #ddd;
	}
	table th{
		background-color: #A3918F;  
		color:#F6EFEC;
		padding: 5px 10px; 
	}
	table td{
		padding: 5px 10px;
	}
	td button{
		width:35px;
		padding: 3px;
		background-color: #A3918F;
		color:#F6EFEC; 
		border: none;
		font-size: 12px;
	}
	td button:hover{
		background-color: #5B4149;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
		<div class="list_container">
		
		<!-- 추가/수정/삭제/검색 버튼 달기 -->
		
		  <table class="">
		    <thead>
		      <tr>
		        <th>회원코드</th>
		        <th>회원이름</th>
		        <th>아이디</th>
		        <th>E-MAIL</th>
		        <th>관리자여부</th>
		        <th></th>
		      </tr>
		    </thead>
		    <tbody>
		     	<c:forEach var="item" items="${list }">
					<tr>
						<td class="customerCode">${item.customerCode }</td>
						<td class="customerName">${item.customerName }</td>
						<td class="id">${item.id }</td>
						<td class="email">${item.email }</td>
						<td class="employee">${item.employee }</td>
						<td>
							<button class="modify">수정</button>
							<button class="delete">삭제</button>
						</td>
					</tr>
				</c:forEach>
		    </tbody>
		  </table>
		</div>
		
	<script>
		$(function(){
			$(".modify").click(function(){
				var customerCode = $(this).closest("tr").children(".customerCode").text();
				//수정창으로 이동
				location.href="${pageContext.request.contextPath}/customer/modify?customerCode="+customerCode;
			})
			
			$(".delete").click(function(){
				var customerCode = $(this).closest("tr").children(".customerCode").text();
				var customerName = $(this).closest("tr").children(".customerName").text();
				var id = $(this).closest("tr").children(".id").text();
				//삭제 확인 창
				confirm(customerName+"("+id+")"+"회원을 삭제하시겠습니까?");
				//삭제 실행
				$.ajax({
				url:"${pageContext.request.contextPath}/customer/"+customerCode,
				type:"delete",
				dataType:"text",
				success:function(json){
					console.log(json);
					if(json == "success"){
						alert("삭제되었습니다.");
						//리스트 새로불러와야함
						getList();
					}
				}
				})
			})
		})
	</script>
	
	<script id="template1" type="text/x-handlebars-template"> 
		<table class="">
		    <thead>
		      <tr>
		        <th>회원코드</th>
		        <th>회원이름</th>
		        <th>아이디</th>
		        <th>E-MAIL</th>
		        <th>관리자여부</th>
		        <th></th>
		      </tr>
		    </thead>
		    <tbody>
		     	{{#each.}}
					<tr>
						<td class="customerCode">{{customerCode }}</td>
						<td class="customerName">{{customerName }}</td>
						<td class="id">{{id }}</td>
						<td class="email">{{email }}</td>
						<td class="employee">{{employee }}</td>
						<td>
							<button class="modify">수정</button>
							<button class="delete">삭제</button>
						</td>
					</tr>
				{{/each}}
		    </tbody>
		  </table>
	</script>
	
	<script>
		function getList(){
			
			$.ajax({
				url:"${pageContext.request.contextPath}/customer/listJson",
				type:"get",
				dataType:"json",
				success:function(json){
					console.log(json);
					$(".list_container").empty(); 
				
				var source = $("#template1").html();
				var f = Handlebars.compile(source);
				var result = f(json);
				$(".list_container").append(result);

				}
			})
		}
	</script>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>


















