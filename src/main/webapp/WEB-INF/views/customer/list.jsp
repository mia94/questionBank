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
	table td, table th{
		padding: 5px 10px;
		text-align: right;
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
		        <th>CustomerCode</th>
		        <th>CustomerName</th>
		        <th>id</th>
		        <th>email</th>
		        <th>employee</th>
		      </tr>
		    </thead>
		    <tbody>
		     	<c:forEach var="item" items="${list }">
					<tr>
						<td>${item.customerCode }</td>
						<td>${item.customerName }</td>
						<td>${item.id }</td>
						<td>${item.email }</td>
						<td>${item.employee }</td>
					</tr>
				</c:forEach>
		    </tbody>
		  </table>
		</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>