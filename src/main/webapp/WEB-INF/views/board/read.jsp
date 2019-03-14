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
	.board_container div#btn_wrap button, div.row div.box-body button#btnReplyAdd{
		float:right;
		background: none;
		border: none;
		font-size: 20px;
		color:#A3918F;
	}
	/*---------------------------------------- 글씨체 통일*/
	.board_container h3,.board_container div#btn_wrap button, div.row div.box-body button#btnReplyAdd,.board_container table td:first-child, .board_container table td.short,div.row div.box-body label{
		font-family: 'Jua', cursive;
	}
	/*----------------------------------------댓글*/
	div.row{
		width:900px; 
		margin: 0 auto;
	}
	div.row div.box-body input#newReplyText{
		width:800px;
		display: inline-block;
	}
	div.row div.box-body button#btnReplyAdd{
		display: inline-block;
		border: 2px solid #A3918F;
		border-radius:5px;
		padding: 1px 8px; 
	}
	div.row div.box-success{
		margin-bottom: 20px;
	}
	.pagination>.active>.wsm_active_a{
		background-color: #A3918F;
		border:1px solid #A3918F;
	}
	.pagination .wsm_active_a{
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
	
	<!-- 댓글 -->
		<div class="row">
			<div class="col-xs-12">
				<div class="box box-success">
					<div class="box-body">
						<label>댓글 쓰기</label><br>
						<input type="hidden" name="writer" id="newReplyWriter" value="${login.customerCode }">
						<input type="text" name="content" class="form-control" id="newReplyText"> 
						<button id="btnReplyAdd">write</button>
					</div>
				</div>
				<ul class="timeline"><!-- 댓글이 들어갈 곳 통째로 비우면 버튼까지 사라지기 때문에 조심 -->
					<li class="time-label" id="repliesDiv">
						<span class="bg-green">Replies List</span>
					</li>
				</ul>
				<div class="text-center">
					<ul id="pagination" class="pagination pagination-sm no-margin">
					</ul>
				</div>
			</div>
		</div>
		
		<div id="modifyModal" class="modal modal-primary fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button><!-- close버튼 -->
					</div>
					<div class="modal-body">
						<p><input type="text" id="replytext" class="form-control"></p><!-- 내용 들어감 -->
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info" id="btnReplyMod" data-rno="">Modify</button><!-- rno번호 this로 가져올수 있음 -->
						<button type="button" class="btn btn-default" data-dismiss="">Close</button>
					</div>
				</div>
			</div>
		</div>
	
	<script id="template1" type="text/x-handlebars-template"> 
	{{#each.}}
		<li class="replyLi" data-rno="{{replyCode}}">
		<i class="fa fa-comments bg-blue"></i>
		<div class="timeline-item">
			<span class="item">
				<i class="fa fa-clock-o"></i>{{tempDate regdate}}
			</span>
			<h3 class="timeline-header">
				<strong>{{replyCode}}</strong> - {{replyer}}
			</h3>
			<div class="timeline-body">
				{{replyText}}
			</div>
			<div class="timeline-footer">
				<a class="btn btn-primary btn-xs btnModify" data-toggle="modal" data-target="#modifyModal" data-rno="{{rno}}">Modify</a>
				<a class="btn btn-danger btn-xs btnDelete">Delete</a>
			</div>
		</div>
		</li>
	{{/each}}
	</script>
	
	<script>
	Handlebars.registerHelper("tempDate", function(value){
		var date = new Date(value);
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var day = date.getDate();
		
		return year+"/"+month+"/"+day
	})
	
	var bno = ${vo.boardCode };
	
	function getPageList(){
		$.ajax({
			url:"${pageContext.request.contextPath}/replies/"+bno,
			type:"get",
			dataType:"json",
			success:function(json){
				console.log(json);
				$(".replyLi").remove();//본인까지 통째로 사라지도록
			
			var source = $("#template1").html();
			var f = Handlebars.compile(source);
			var result = f(json.list);
			$(".timeline").append(result);
			
			$("#pagination").empty();
			for(var i=json.pageMaker.startPage;i<=json.pageMaker.endPage;i++){
				var liTag = $("<li>");
				var aTag = $("<a>").attr("href","#").text(i);
				if(i==json.pageMaker.cri.page){
					liTag.attr("class","active");
				}
				liTag.append(aTag);
				$("#pagination").append(liTag);
			}
		
			}
		})
	}
	</script>
	
	<script>
		$(function(){
			getPageList();
			
			//댓글쓰기
			$("#btnReplyAdd").click(function(){
				//bno는 알아서 받아오고, replyer, replytext넘겨주기
				var replyer = $("#newReplyWriter").val();
				var replytext = $("#newReplyText").val();
				//@RequestBody를 사용했기때문에
				var jsonBody = {bno:bno, replyer:replyer, replytext:replytext};
				//@RequestBody를 사용했으면headers, JSON.stringify를 반드시 사용해야함
				$.ajax({
					url:"${pageContext.request.contextPath}/replies/",
					type:"post",
					headers:{
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"POST"
					},
					data:JSON.stringify(jsonBody),/*JSON.stringify는 {bno:bno, replyer:replyer, replytext:replytext}이런 스트링으로 변환*/
					dataType:"text",/*String으로 반환되면 객체가 아니기때문에 json이 아닌 text로 받아야함*/
					success:function(json){
						console.log(json);
						if(json=="success"){
							alert("등록하였습니다.");
							getPageList(1);
							$(".bg-green").text("Replies List[${replyCnt}]");
							$("#newReplyWriter").val("");
							$("#newReplyText").val("");
						}
					}
				})
			})
			
			//삭제
			$(document).on("click",".btnDelete",function(){
				var rno = $(this).parents(".replyLi").attr("data-rno");
				$.ajax({
					url:"${pageContext.request.contextPath}/replies/"+rno,
					type:"delete",
					dataType:"text",
					success:function(json){
						console.log(json);
						if(json == "success"){
							alert(rno+"가 삭제되었습니다.");
						}
						getPageList(1);
					}
				})
			})
			
			//수정
			$(document).on("click",".btnModify",function(){
				var rno = $(this).attr("data-rno");
				$("#btnReplyMod").attr("data-rno",rno);
				var text = $(this).parent().prev().text().trim();
				$("#replytext").val( jQuery.trim(text));
			})
			
			//목록으로
			$("#btn_list").click(function(){
				location.href="${pageContext.request.contextPath}/board/list";
			})
		})
	</script>
	
	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>















