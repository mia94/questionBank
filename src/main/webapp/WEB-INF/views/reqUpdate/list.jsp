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
	/*-----------------------------------------------테이블 스타일*/
	table{
		width:900px;
		margin-top: 30px;
	}
	table tr{
		border: 0.5px solid #ddd;
		height: 35px;
	}
	table tr:hover{ 
		background-color: rgba(243,194,186,0.15);   
	}
	table th{
		background-color: #A3918F;  
		color:#F6EFEC; 
		text-align: center;
	}
	table td, table th{
		padding: 5px 10px;
	}
	table td:first-child, table th:first-child,table td:last-child, table th:last-child, table .question_field, table .writer_field{
		text-align: center;
		font-size: 12px; 
	}
	table td:first-child, table th:first-child{ 
		width:20px;
	}
	table .question_field, table .writer_field, table .state_field{
		width:130px;
	}
	table .date_field{
		width:150px;
	}
	table .state_field{
		width:80px; 
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
		        <th class="question_field">문제</th>
		        <th>content</th>
		        <th class="writer_field">작성자</th>
		        <th class="date_field">게시날짜</th>
		        <th>처리상태</th>
		      </tr>
		    </thead>
		    <tbody>
		     	<c:forEach var="item" items="${list }">
					<tr>
						<td>${item.reqCode }</td>
						<td class="question_field">${item.question.questionCode }</td>
						<td>${item.content }</td>
						<td class="writer_field">${item.writer.customerCode }</td>
						<td class="date_field"><fmt:formatDate value="${item.regdate }" pattern="yyyy.MM.dd hh:mm:ss"/></td>
						<td class="state_field">${item.state }</td>
					</tr>
				</c:forEach>
		    </tbody>
		  </table>
	</div>
	
	<script>
		$(function(){
			$("tr").click(function(){
				var questionCode = $(this).children(".question_field").text();
				//해당문제나타나는 페이지로 이동하기
				location.href="${pageContext.request.contextPath}/reqUpdate/check?question="+questionCode;
			})
		})
	</script>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>