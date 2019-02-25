<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	}
	table{
		width:900px;
		margin-top: 30px;
	}
	table tr{
		border: 0.5px solid #ddd;
		height: 35px;
	}
	table th{
		background-color: #A3918F;  
		color:#F6EFEC; 
		text-align: center;
	}
	table td, table th{
		padding: 5px 10px;
	}
	table td:first-child, table th:first-child,table td:last-child, table th:last-child{
		text-align: center;
		font-size: 12px; 
	}
	table td:first-child, table th:first-child{
		width:20px;
	}
	table td:last-child, table th:last-child{
		width:150px; 
	}
</style>
</head>
<body>

	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<div class="board_container">

		<table>
		    <thead>
		      <tr>
		        <th>no</th>
		        <th>문제</th>
		        <th>content</th>
		        <th>작성자</th>
		        <th>게시날짜</th>
		      </tr>
		    </thead>
		    <tbody>
		     	<c:forEach var="item" items="${list }">
					<tr>
						<td>${item.reqCode }</td>
						<td>${item.question.questionCode }</td>
						<td>${item.content }</td>
						<td>${item.writer.customerCode }</td>
						<td><fmt:formatDate value="${item.regdate }" pattern="yyyy.MM.dd hh:mm:ss"/></td>
					</tr>
				</c:forEach>
		    </tbody>
		  </table>
	</div>
	
	
	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>