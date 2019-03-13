<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>Wooooo's QuestionBank</title> 
<style>

@import url('https://fonts.googleapis.com/css?family=Do+Hyeon|Playfair+Display|Song+Myung');

	/*bx slider 파트*/
	.main_banner_wrap{
		height: 263px;
		position: relative;
		width:100%;
		height: 447px;
		margin:10px auto;
		border-radius: 10px;
	}
	#main_banner{
		position: relative;
	}
	#main_banner img{
		width: 1200px;
		height: 447px;
	}
	#main_banner h1{
		position: absolute;
		top: 40%; 
		left: 38%;
		color:white; 
		font-size:27px;
		font-family: 'Playfair Display', 'Song Myung';
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
		height: 210px;  
		margin:5px auto;
	}
	.home_container2 article{  
		width:295px;
		height:200px;
		float:left;
		margin:2px;
		background-color:#A3918F;/* 코코아 */
		position: relative;
		transition:all 1s;
	}
	.home_container2 article:hover{
		background-color:#5B4149;
	}
	.home_container2 img{
		width:70px;
		margin-left: 60px;
		margin-top: 60px;
	}
	.home_container2 article div{
		color:#F6EFEC; 
		width:120px;
		position: absolute;
		right: 30px;
		top: 75px; 
		text-align: center;
		font-family: 'Do Hyeon', sans-serif;
	}
	.home_container3{
		width:100%;
		height:400px;
		margin-bottom: 40px;
		border:1px solid #A3918F; 
		position: relative;
		font-family: 'Playfair Display', 'Song Myung';
	}
	.home_container3>div{
		height: 400px;
	}
	.home_container3>div:first-child{
		background-color:#444;
		position: relative;
	}
	.home_container3>div:first-child div{
		width:290px; 
		text-align: center;
		color:white;
		position: absolute;
		left: 0;
		top:150px;
	}
	.home_container3>div.col-sm-7{
		position: relative;
	}
	.home_container3>div.col-sm-7 div{
		width:150px;
		position: absolute;
		right:180px;
		top:150px;
		font-size:30px; 
		font-family: 'Do Hyeon', sans-serif;
		color: #444;
	}
	.home_container3>img{
		width:333px;
		position: absolute;
		top: 0;
		left: 300px;
	}
	.home_container>div#color1{
		background-color:#5B4149;/* 진갈색  */
		background-color:#F6EFEC; /* 연베이지 */
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
				<a href="#"><img src="${pageContext.request.contextPath}/resources/upload/main.jpg" alt=""></a>
				<h1>Data Processing Engineer</h1>
			</div>
			<div>
				<a href="#"><img src="${pageContext.request.contextPath}/resources/upload/main2.png" alt=""></a>
				<h1>2019 시험일정</h1>
			</div>
			<div>
				<a href="#"><img src="${pageContext.request.contextPath}/resources/upload/main3.png" alt=""></a>
				<h1>The Result of an Examination</h1> 
			</div>
		</div>
		<img src="${pageContext.request.contextPath}/resources/upload/cocoa_btn_left.png" alt="이전배너" class="touch_left_btn"> 
		<img src="${pageContext.request.contextPath}/resources/upload/cocoa_btn_right.png" alt="이후배너" class="touch_right_btn">
	</div>
	<div class="home_container2">
		<a href="${pageContext.request.contextPath}/question/moketest">
			<article>
				<img src="${pageContext.request.contextPath}/resources/upload/solve.png">
				<div>완벽대비<br>모의고사 풀기</div>
			</article>
		</a>
		<article>
			<img src="${pageContext.request.contextPath}/resources/upload/phone.png">
			<div>모바일에서도<br>시험치자</div>
		</article>
		<a href="${pageContext.request.contextPath}/question/rankIncorrect" >
			<article>
				<img src="${pageContext.request.contextPath}/resources/upload/incorrect.png">
				<div>많이 틀린문제<br>확인하러 가기</div>
			</article>
		</a>
		<article>
			<img src="${pageContext.request.contextPath}/resources/upload/timer.png">
			<div>나의 풀이시간은<br>얼마일까</div>
		</article>
	</div>
	
	<div class="home_container3">
		<div class="col-sm-5">
			<div>
				<p>정보처리기사<br>응시자격<br>진단하러 가기</p>
			</div>
		</div>
		<div class="col-sm-7"> 
			<div>
				<p>원서접수<br>신청안내</p>
			</div>
		</div>
		<img src="${pageContext.request.contextPath}/resources/upload/career_bg.jpg">
	</div>
	
	<script>
	$(function(){
		//
		$(".col-sm-5").hover(function(){
			
		})
		
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
