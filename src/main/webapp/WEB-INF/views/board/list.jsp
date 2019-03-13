<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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
		right: -7px;
		top:-50px;
		background-color: white;
		border:1px solid #A3918F;
		color:#A3918F;
		padding: 5px;
		margin: 10px;
	}
	table{
		width:900px;
		margin-top: 30px;
		padding-top: 30px;
	}
	table tr{
		border: 0.5px solid #ddd;
	}
	table th{
		background-color: #A3918F;  
		color:#F6EFEC; 
		text-align: center;
	}
	table .no{
		width:40px;
	}
	table .title{
		width:500px;
	}
	table .title a{
		text-decoration: none;
		color: black;
	}
	table .regdate{
		width:150px;
	}
	table .viewcnt{
		width:100px;
		text-align: center;
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
		        <th class="no">no</th>
		        <th class="title">제목</th>
		        <th class="writer">글쓴이</th>
		        <th class="regdate">작성시간</th>
		        <th class="viewcnt">조회수</th> 
		      </tr>
		    </thead>
		    <tbody>
		     	<c:forEach var="item" items="${list }">
					<tr>
						<td class="no">${item.boardCode }</td>
						<td class="title"><a href="${pageContext.request.contextPath}/board/read?boardCode=${item.boardCode }">${item.boardTitle }</a></td>
						<td class="writer">${item.writer.id}</td> 
						<td class="regdate"><fmt:formatDate value="${item.regdate }" pattern="yyyy.MM.dd HH:mm:ss" /></td>
						<td class="viewcnt">${item.viewcnt }</td>
					</tr>
				</c:forEach>
		    </tbody>
		  </table>
	</div>
	
	<script>
		$(function(){
			
			//글쓰기 버튼
			$("#register").click(function(){
				location.href="${pageContext.request.contextPath}/board/register"
			})
		})
	</script>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>















