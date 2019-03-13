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
		margin: 70px auto 30px;  
		position: relative;
	}
	.board_container h3{
		text-align: center;
		font-family: 'Jua', sans-serif; 
	}
	.board_container table{
		border-collapse: collapse;
		width:900px; 
	}
	.board_container table td:first-child, .board_container table td.short{ 
		width:100px; 
		background-color: #A3918F;
		color:white;
		text-align: center;
	}
	.board_container table td{
		border:1px solid #ccc;
		padding: 8px;
	}
	.board_container table tr:last-child {
		height: 400px; 
	}
	.board_container div#btn_wrap{
		width:200px;
		margin-left: 700px; 
	}
	.board_container div#btn_wrap button{
		float:right;
		background: none;
		border: none;
		font-size: 20px;
		font-family: 'Jua', cursive;  
		color:#A3918F;
	}
</style>
</head>
<body>

	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<div class="board_container">
		<h3>BOARD READ</h3>  
		<table> 
			<tr>
				<td>제목</td>
				<td colspan="5">${vo.boardTitle }</td>
			</tr>
			<tr>
				<td>글쓴이</td>
				<td>${vo.writer.id }</td>
				<td class="short">작성시간</td>
				<td><fmt:formatDate value="${item.regdate }" pattern="yyyy.MM.dd HH:mm:ss"/></td> 
				<td class="short">조회수</td>
				<td>${vo.viewcnt }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="5">${vo.content }</td>
			</tr>
		</table>
		<div id="btn_wrap">
			<button id="btn_list">목록</button>
			<c:if test="${login.customerCode}==${vo.writer.customerCode }">
				<button>수정</button>
				<button>삭제</button>
			</c:if>
		</div>
	</div>
	
	<script>
		$(function(){
			$("#btn_list").click(function(){
				location.href="${pageContext.request.contextPath}/board/list";
			})
		})
	</script>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>















