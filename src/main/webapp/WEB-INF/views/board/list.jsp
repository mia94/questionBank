<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	table td, table th{
		padding: 5px 10px; 
	}
</style>
</head>
<body>

	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<div class="board_container">
		<table class="">
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
						<td>${item.writer.customername }</td>
						<td>${item.regdate }</td>
						<td>${item.viewcnt }</td>
					</tr>
				</c:forEach>
		    </tbody>
		  </table>
	</div>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>