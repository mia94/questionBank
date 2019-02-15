<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet"  type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!-- <style>
	*{
		margin: 0;
		padding: 0;
	}
	div#wsm_total_wrap{
		width:1200px;
		margin: 0 auto;
	}
	header{
		width:100%;
		height: 140px;
		background-color: #eee;
	}
	header #wsm_header{
		width:100%;
		height: 90px;
	}
	section{
		width:100%;
		min-height: 600px;
	}
	footer{
		width:100%;
		height:160px;
		background-color: #bbb;
	}
</style> -->
</head>
<body>

<div id="wsm_total_wrap">
	<header>
		<div id="wsm_header">
			
		</div>
		<nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="#">QB</a>
		    </div>
		    <ul class="nav navbar-nav">
		      <li class="active"><a href="#">Home</a></li>
		      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Question<span class="caret"></span></a>
		        <ul class="dropdown-menu">
		          <li><a href="#">List</a></li>
		          <li><a href="#">Menu2</a></li>
		          <li><a href="#">Menu3</a></li>
		        </ul>
		      </li>
		      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Customer<span class="caret"></span></a>
		        <ul class="dropdown-menu">
		          <li><a href="#">List</a></li>
		          <li><a href="#">Menu2</a></li>
		          <li><a href="#">Menu3</a></li>
		        </ul>
		      </li>
		      <li><a href="#">Board</a></li>
		    </ul>
		    <ul class="nav navbar-nav navbar-right">
		      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
		      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
		    </ul>
		  </div>
		</nav>
	
	</header>
	
	<section>
	
	
   