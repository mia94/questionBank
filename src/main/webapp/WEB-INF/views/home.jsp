<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<title>Wooooo's QuestionBank</title> 
<style>
	/*bx slider 파트*/
	.main_banner_wrap{
		height: 263px;
		position: relative;\
		width:100%;
		height: 447px;
		margin:20px auto;
		border-radius: 10px;
	}
	#main_banner{
		position: relative;
	}
	#main_banner img{
		width: 1200px;
	}
	#main_banner h1{
		position: absolute;
		top: 40%;
		left: 45%;
		color:white;
	}
	.touch_left_btn{
		position: absolute;
		top:50%;
		left: 30px;
		margin-top: -25px;
		cursor:pointer;
	}
	.touch_right_btn{
		position: absolute;
		top:50%;
		right: 30px;
		margin-top: -25px;
		cursor:pointer;
	}
	/*홈 화면 파트*/
	.home_container2{
		width:100%;
		height: 590px;
		margin:20px auto;
	}
	.home_container2 article{
		width:220px;
		height:300px;
		float:left;
		margin:10px;
		background-color:#A3918F;/* 코코아 */
	}
	.home_container2 img{
		width:80px;
		margin-left: 75px;
		margin-top: 40px;
	}
	.home_container>div#color1{
		background-color:#5B4149;/* 진갈색  */
		background-color: F6EFEC; /* 연베이지 */
		background-color:#A3918F;/* 코코아 */
		background-color:#F3C2BA; /* 연핑크 */
		background-color:#F28683; /* 진핑크 */
	}

</style>
</head>
<body>
	<jsp:include page="include/header.jsp"></jsp:include>
	<%-- <div class="home_container1">
		<img src="${pageContext.request.contextPath}/resources/images/main.jpg">
	</div> --%>
	<div class="main_banner_wrap">
		<div id="main_banner">
			<!-- bx슬라이더, section은 main.js에 넣어야함, css는 필요없음 -->
			<div>
				<a href="#"><img src="${pageContext.request.contextPath}/resources/images/main.jpg" alt=""></a>
				<h1>1 Page</h1>
			</div>
			<div>
				<a href="#"><img src="${pageContext.request.contextPath}/resources/images/main.jpg" alt=""></a>
				<h1>2 Page</h1>
			</div>
			<div>
				<a href="#"><img src="${pageContext.request.contextPath}/resources/images/main.jpg" alt=""></a>
				<h1>3 Page</h1> 
			</div>
		</div>
		<img src="${pageContext.request.contextPath}/resources/images/visual_btn_left.png" alt="이전배너" class="touch_left_btn"> 
		<img src="${pageContext.request.contextPath}/resources/images/visual_btn_right.png" alt="이후배너" class="touch_right_btn">
	</div>
	<div class="home_container2">
		<article>
			<img src="${pageContext.request.contextPath}/resources/upload/solve.png">
		</article>
		<article>
			<img src="${pageContext.request.contextPath}/resources/upload/phone.png">
		</article>
		<article>
			<img src="${pageContext.request.contextPath}/resources/upload/incorrect.png">
		</article>
		<article>
			<img src="${pageContext.request.contextPath}/resources/upload/timer.png">
		</article>
	</div>
	
	<script>
	$(function(){
		/*---Section , bxSlider---*/
		var $main_banner = $("#main_banner").bxSlider({//반환하는 객체를 받아서 사용
	  	  	slideWidth: 1200,
	  	  	auto:true,
	  	  	autoControls:false,//control을 안보이게 할 것
	  	  	controls:false,//control을 안보이게 할 것
	  	  	pager:false,//페이지 표시 안보이게 할 것
	  	  	pause:2000,
	  	  	stopAutoOnClick:true//클릭됬을때 자동을 멈추게 하는 장치
		});
		
		//버튼으로 bxslider 조정
		$(".touch_left_btn").click(function(){
			$main_banner.goToPrevSlide();
		})
		$(".touch_right_btn").click(function(){
			$main_banner.goToNextSlide();
		})
	})
	</script>
	
	<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>
