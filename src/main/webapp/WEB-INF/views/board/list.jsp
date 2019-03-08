<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.board_container{
		width:900px;
		margin: 100px auto 30px;  
		position: relative;
	}
	.board_container button{
		position: absolute;
		right: 0px; 
		top:-25px; 
		background-color: white;
		border:1px solid #A3918F;
		color:#A3918F;
		padding: 5px;
		margin: 10px;
	}
	table{
		width:900px;
		margin-top: 30px;
	}
	table tr{
		border: 0.5px solid #ddd;
	}
	table th{
		background-color: #A3918F;  
		color:#F6EFEC; 
	}
	table td, table th{
		padding: 5px 10px;
	}
</style>
</head>
<body>

	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<div class="board_container">
		<button id="register">write</button>
		<table>
		    <thead>
		      <tr>
		        <th>no</th>
		        <th>Title</th>
		        <th>writer</th>
		        <th>regdate</th>
		        <th>viewcnt</th>
		      </tr>
		    </thead>
		    <tbody>
		     	<c:forEach var="item" items="${list }">
					<tr>
						<td>${item.boardCode }</td>
						<td>${item.boardTitle }</td>
						<td>${item.writer.customerid }</td>
						<td>${item.regdate }</td>
						<td>${item.viewcnt }</td>
					</tr>
				</c:forEach>
		    </tbody>
		  </table>
	</div>
	
	<script>
		$(function(){
			$("#register").click(function(){
				location.href="${pageContext.request.contextPath}/board/register"
			})
		})
	</script>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>