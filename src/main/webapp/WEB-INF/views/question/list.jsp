<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>Insert title here</title>
<style>
	.question_wrap{
		border:1px solid gray;
		padding: 10px;
	}
</style>
</head>
<body>
	<div class="container">
	</div>
	
	 <script>

  
	  function getPageList(){
		  $.ajax({
				url:"${pageContext.request.contextPath}/question/list",
				type:"get",
				dataType:"json",
				success:function(json){
					console.log(json);
					$("#container").empty();//안에만 비우기
					
					var source = $("#template1").html();
					var f = Handlebars.compile(source);
					var result = f(json);
					$("#container").append(result);
				}
			})
	  }
	  
	  
	  $(function(){
		  getPageList();
	  })
  </script>
	
	<script id="template1" type="text/x-handlebars-template"> 
	{{#each.}}
		<div class="question_wrap">
			<p>{{questionTitle}}</p>
			<p>{{choice1}}</p>
			<p>{{choice2}}</p>
			<p>{{choice3}}</p>
			<p>{{choice4}}</p>
		</div>
	{{/each}}
  	</script>
</body>
</html>