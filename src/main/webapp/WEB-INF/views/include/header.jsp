<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>Wooooo's QuestionBank</title>
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet"  type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

<div id="wsm_total_wrap">
	<header>
		<div id="wsm_header">
			<h1><a href="${pageContext.request.contextPath}">Wooooo's<br>QuestionBank</a></h1>
		</div>
		<nav class="navbar">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="${pageContext.request.contextPath}">Wooooo's Home</a>
		    </div>
		    <ul class="nav navbar-nav">
		      <li><a href="#"></a></li>
		      <li class="dropdown"><a class="dropdown-toggle wsm_nav_a" data-toggle="dropdown" href="#">Question<span class="caret"></span></a>
		        <ul class="dropdown-menu">
		          <li><a href="${pageContext.request.contextPath}/question/list">Test</a></li>
		          <li><a href="#">Menu2</a></li>
		          <li><a href="#">Menu3</a></li>
		        </ul>
		      </li>
		      <li class="dropdown"><a class="dropdown-toggle wsm_nav_a" data-toggle="dropdown" href="#">Customer<span class="caret"></span></a>
		        <ul class="dropdown-menu">
		          <li><a href="${pageContext.request.contextPath}/customer/list">List</a></li>
		          <li><a href="#">Menu2</a></li>
		          <li><a href="#">Menu3</a></li>
		        </ul>
		      </li>
		      <li><a href="${pageContext.request.contextPath}/board/list" class="wsm_nav_a">Board</a></li>
		    </ul>
		    <ul class="nav navbar-nav navbar-right">
		      <li><a href="${pageContext.request.contextPath}/customer/signup"><span class="glyphicon glyphicon-user" id="wsm_signUp"></span> <span id="wsm_signUp_text">Sign Up</span></span></a></li>
		       <!-- 로그인 c:if쓰기 -->
	              <c:if test="${login == null }">
	                  <li><a href="${pageContext.request.contextPath}/user/login"><span class="glyphicon glyphicon-log-in" id="wsm_Login"></span> <span id="wsm_Login_text">Login</span></a></li>
	              </c:if>
	              <c:if test="${login != null }">
	                  <li><a href="${pageContext.request.contextPath}/user/logout"><span class="glyphicon glyphicon-log-in" id="wsm_Login"></span> <span id="wsm_Login_text">LogOut</span></a></li>
	              </c:if> 
		    </ul>
		  </div>
		</nav>
	
	</header>
	
	<section>
	
	
   