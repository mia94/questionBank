<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title> 
<link href="${pageContext.request.contextPath}/resources/css/register_select.css" rel="stylesheet"  type="text/css">
<style>
	.form_container{
		 width:1000px;
		 margin: 50px auto; 
		 border:1px solid #ccc;
		 padding: 10px 40px; 
	}
	.form_container h2{
		font-family: 'Righteous', 'Jua';
	}
	/*테이블 변경 후*/
	table{
		border-collapse: collapse;
		width:920px;
	}
	table tr{
		height: 40px;
	}
	table td{
		border:1px solid #eee;
	}
	table td:first-child{
		width:150px;
		text-align: right;
		padding-right: 20px;
	}
	/*테이블로 변경하기 전*/
	/* .wsm_questionreg{
		margin-top: 10px;
	}
	.wsm_questionreg label{
		width:100px;
		float: left;
		text-align: right;
		margin-right: 10px; 
		color:#A3918F;
	}
	input[name="questionTitle"], input[name="choice1"], input[name="choice2"], input[name="choice3"], input[name="choice4"]{
		width:400px;
	}
	input[type=text]{
		border: none;
		border-bottom: 1px solid #eee;
	}
	input[type=radio]{
		margin: 0 15px; 
	} */
	/* submit 버튼 */
	button#registerQ, button.registerQ{
		border: none;
		background: white;
		margin-left:20px;
		margin-top:20px;
		font-size: 20px;
		font-family: 'Righteous', cursive;  
		color:#A3918F;
	}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	
	<div class="form_container">
	  <h2>문제 추가</h2>
	  <form  action="register" method="post" enctype="multipart/form-data">

	  	<p class="wsm_questionreg">
	  		<div class="custom-select">
		  		<select name="year"> 
		  			<option value="">출제 연도</option>
			  		<option value="2018">2018</option> 
			  		<option value="2017">2017</option>
			  		<option value="2016">2016</option>
			  		<option value="2015">2015</option>
			  	</select>
	  		</div>
	  		<div class="custom-select">	
		  		<select name="round">
		  			<option value="">회차</option>
		  			<option value="1">1</option>
		  			<option value="2">2</option> 
		  			<option value="3">3</option>
		  		</select>
	  		</div>
	  		<div class="custom-select">
		  		<select name="subject">
		  			<option value="">과목</option>
		  			<option value="D">데이터통신</option>
		  			<option value="A">전자계산기 구조</option>
		  			<option value="O">운영체제</option>
		  			<option value="S">소프트웨어 공학</option>
		  			<option value="C">데이터 통신</option>
		  		</select>
	  		</div>
	  		<div class="custom-select">
		  		<select name="number">
		  			<option value="">번호</option>
		  			<c:forEach var="cnt" begin="1" end="100" step="1">
		  				<option value='${cnt}'>${cnt}</option>
		  			</c:forEach>
		  		</select>
	  		</div>
	  	</p> 
	  	
	  	<table>
	  		<tr>
	  			<td>문제</td>
	  			<td><input type="text" name="questionTitle"></td>
	  		</tr>
	  		<tr>
	  			<td>보기1</td>
	  			<td><input type="text" name="choice1"></td>
	  		</tr>
	  		<tr>
	  			<td>보기2</td>
	  			<td><input type="text" name="choice2"></td>
	  		</tr>
	  		<tr>
	  			<td>보기3</td>
	  			<td><input type="text" name="choice3"></td>
	  		</tr>
	  		<tr>
	  			<td>보기4</td>
	  			<td><input type="text" name="choice4"></td>
	  		</tr>
	  		<tr>
	  			<td>정답</td>
	  			<td>
	  				<input type="radio" name="correct" class="ex_rd2" value="1"> 1
	  				<input type="radio" name="correct" class="ex_rd2" value="2"> 2
	  				<input type="radio" name="correct" class="ex_rd2" value="3"> 3
	  				<input type="radio" name="correct" class="ex_rd2" value="4"> 4
	  			</td>
	  		</tr>
	  		<tr>
	  			<td>상태</td>
	  			<td>
	  				<input type="radio" name="state" class="ex_rd2" value="정상"> 정상
	  				<input type="radio" name="state" class="ex_rd2" value="요청"> 요청
	  				<input type="radio" name="state" class="ex_rd2" value="보류"> 보류 
	  				<input type="radio" name="state" class="ex_rd2" value="오류"> 오류
	  			</td>
	  		</tr>
	  		<tr>
	  			<td>사진 / 예문</td>
	  			<td><input type="file" name="pictureFile" id="file"></td>
	  		</tr>
	  	</table>
	  	
	  	<!-- <p class="wsm_questionreg">
	  		<label>문제</label>
	  		<input type="text" name="questionTitle">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>보기1</label>
	  		<input type="text" name="choice1">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>보기2</label>
	  		<input type="text" name="choice2">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>보기3</label>
	  		<input type="text" name="choice3">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>보기4</label>
	  		<input type="text" name="choice4">
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>정답</label>
	  		<input type="radio" name="correct" class="ex_rd2" value="1"> 1
	  		<input type="radio" name="correct" class="ex_rd2" value="2"> 2
	  		<input type="radio" name="correct" class="ex_rd2" value="3"> 3
	  		<input type="radio" name="correct" class="ex_rd2" value="4"> 4
	  	</p>
	  	<p class="wsm_questionreg">
	  		<label>상태</label>
	  		<input type="radio" name="state" class="ex_rd2" value="정상"> 정상
	  		<input type="radio" name="state" class="ex_rd2" value="요청"> 요청
	  		<input type="radio" name="state" class="ex_rd2" value="보류"> 보류
	  		<input type="radio" name="state" class="ex_rd2" value="오류"> 오류
	  	</p> 
	  	<p class="wsm_questionreg">
	  		<label>사진 / 예문</label>
	  		<input type="file" name="pictureFile">
	  	</p> -->
	  	<p>
	        <button type="button" class="registerQ" data-toggle="modal" data-target="#myModal">Submit</button>
	  	</p> 
	  </form>
	  
	  <!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">추가하는 문제 내용을 확인해주세요</h4>
	        </div>
	        <div class="modal-body">
	          <div class="check_question">
	          	<!-- 모달 내용, 제이쿼리에서 해결 -->
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="submit" id="registerQ" class="btn btn-default">Submit</button>
	          <button type="button" class="registerQ" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<script>
		$(".registerQ").click(function(){
			var year = $("select[name=year]").val();
			var round = $("select[name=round]").val();
			var subject = $("select[name=subject]").val();
			var number = $("select[name=number]").val();
			
			var questionTitle = $("input[name=questionTitle]").val();
			var choice1 = $("input[name=choice1]").val();
			var choice2 = $("input[name=choice2]").val();
			var choice3 = $("input[name=choice3]").val();
			var choice4 = $("input[name=choice4]").val();
			
			var correct = $("input[name=correct]").val();
			var state = $("input[name=state]").val();
			//입력되지 않은 값 있을 시 안내창 띄우기
			if(year==""||round==""||subject==""||number==""||questionTitle==""||choice1==""||choice2==""||choice3==""||choice4==""||correct==""||state==""){
				$(".check_question").append("<p> 사진을 제외한 모든 값은 필수입력입니다.</p>");
				return;
			}
			//받아온 값 디스플레이
			$(".check_question").append("<p>"+year+"년 "+round+"회 "+number+"번"+"</p>");
			$(".check_question").append("<p>"+questionTitle+"</p>");
			//사진 미리보기
			var reader = new FileReader();
			reader.onload = function(e){
				var $img = $("<img>");
				$img.attr("src", e.target.result);
				$(".check_question").append($img);
			}
			var file = $("#file")[0].files[0];
			reader.readAsDataURL(file)
			
			$(".check_question").append("<p> ① "+choice1+"</p>");
			$(".check_question").append("<p> ② "+choice2+"</p>");
			$(".check_question").append("<p> ③ "+choice3+"</p>");
			$(".check_question").append("<p> ④ "+choice4+"</p>");
			$(".check_question").append("<p> 정답 :"+correct+"</p>");
			$(".check_question").append("<p> 상태 :"+state+"</p>");
		})
	</script>
	
	<script src="${pageContext.request.contextPath}/resources/js/select.js"></script>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
	
	
</body>
</html>