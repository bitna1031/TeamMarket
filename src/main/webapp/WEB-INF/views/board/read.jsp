<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="/resources/css/read.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container jumbotron">
		<a data-toggle="tooltip" title="게시판으로 이동합니다." class="hrefType" href="/board/list" style="color : #FF007F; float: left; margin: 5px; font-size: 1.5em;">
			NaNa's Page
			</a>
			<a class="hrefType btn" style="background-color: pink; color: white; float: right; margin: 5px; font-size: 1em;" href="/member/login">Login </a>
			<br><br>
			<h2><strong>게시글 확인</strong></h2>
	</div>
	
	<div class = "bigbody">
	<div class="bodysize">
		<div class="bodystyle">
		<h4><strong><span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span>
		게시글 보기 </strong></h4>
		
			<div class="panel" style="background-color: #FFF7FC;">
				<div class="panel-heading" style="background-color: #FFCCE0">
					<span><strong style="font-size: 1.5em;">제목 : ${vo.title}</strong></span><br>
					<span>No.${vo.bno}</span>&emsp; <span><span
						class="glyphicon glyphicon-user" aria-hidden="true"></span>
						${vo.userId}</span> <span class="pull-right"><span
						class="glyphicon glyphicon-dashboard" aria-hidden="true"></span>
						${vo.updatedate}</span>
				</div>

				<div class="panel-body">
					<textarea class="form-control" readonly="readonly"
					style="width: 100%; height: 400px; background-color: white; resize: none;">${vo.content}</textarea>
					<div class="uploadedList">
							
					</div>
				</div>
				<div style="text-align: center;" class="panel-footer">
					<a style="background-color: pink; color: black;" class="btn update btn-sm ${vo.userId != login.userId?'disabled':''}" role="button">수정</a> &nbsp; 
					<a style="background-color: pink; color: black;" class="btn delete btn-sm ${vo.userId != login.userId?'disabled':''}" role="button">삭제</a> &nbsp;
					<a style="background-color: pink; color: black;" class="btn reply btn-sm ${empty login.userId? 'disabled':''}" role="button">댓글</a> &nbsp; 
					<a style="background-color: pink; color: black;" class="btn list btn-sm" role="button">목록</a>
				</div>
				</div>

			<form action="/board/delete/${vo.bno}?curPage=${curPage}"
				method="post"></form>

			<div>
				<div class="collapse" id="mycollapse">
					<div class="well">
						<div class="form-group">
							<label for="replyer">작성자</label>
							<input readonly value="${login.userId}" id="replyer" class="form-control">
						</div>

						<div class="form-group">
							<label for="replytext">내용</label> <input id="replytext"
								class="form-control">
						</div>

						<div class="form-group"  style="float: right;" >
							<button style="background-color: pink" class="btn btn-sm reply_insert_btn">등록</button>
						</div><br>
						</div>
				</div>
			</div>

			<div id="reliesList"></div>
			
			<div>
				<!-- Modal -->
					<div data-backdrop = "static" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					        <h4 class="modal-title" id="modal_rno"></h4>
					      </div>
					      <div class="modal-body">
					        <div class="form-group">
					        	<label for="replyer_update">작성자</label>
					        	<input id="replyer_update" class="form-conrtol">
					        	
					        </div>
					        <div class="form-group">
					        	<label for="replytext_update">내용</label>
					        	<input id="replytext_update" class="form-conrtol">
					        	
					        </div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					        <button data-dismiss="modal" type="button" class="btn btn-success" id="reply_update_btn">수정</button>
					      </div>
					    </div>
					  </div>
					</div>
			</div></div></div>

	<script type="text/javascript" src="/resources/js/test1.js"></script>

	<script type="text/javascript">
				$(document).ready(function () {
					var bno = ${vo.bno};
					
					$("#reply_update_btn").click(function (event) {
						event.preventDefault();
						var rno = $("#modal_rno").text();
						var replyer = $("#replyer_update").val();
						var replytext = $("#replytext_update").val();
						
						$.ajax({
							type : 'put',
							url : '/replies/reply',
							headers : {
								'Content-Type' : 'application/json',
								'X-HTTP-Method-Override' : 'PUT'
								},
							data : JSON.stringify({
								rno : rno,
								replyer : replyer,
								replytext : replytext
							}),
							dataType : 'text',
							success : function (result) {
								if(result == "1"){
									alert("수정 성공");
									
									$("#reliesList").html("");
									getReplyList(bno);
									
								}else{
									alert("수정 실패");
								}
							}
						});
						
						
					});
					
					$("#reliesList").on("click",".reply_btn_update_form", function(event) {
						event.preventDefault();
						var that = $(this);
						var rno	= that.parent().attr("data-rno");
						var replyer	= that.parent().attr("data-replyer");
						var replytext = that.parent().prev().text();
						
						$("#modal_rno").text(rno);
						$("#replyer_update").val(replyer);
						$("#replytext_update").val(replytext);
						
						});
					
					
					
					$("#reliesList").on("click", ".reply_btn_delete", function(event){
						event.preventDefault();
						
						var rno = $(this).parent().attr("data-rno");
						var that = $(this);
						
						$.ajax({
							type : 'delete',
							url : '/replies/reply',
							headers : {
								'Content-Type' : 'application/json',
								'X-HTTP-Method-Override' : 'DELETE'
								},
							data : JSON.stringify({
								rno : rno
							}),
							dataType : 'text',
							success : function (result) {
								
								if(result == "1"){
									alert("삭제되었습니다.")
								that.parent().parent().parent().remove();
									}else{
										alert("삭제실패.")
									}
							}
						});
						
					});
					
					
					
					$(".reply_insert_btn").click(function(event) {
						event.preventDefault();
						
						$.ajax({
							type : 'post',
							url : '/replies/reply',
							headers : {
								'Content-Type' : 'application/json',
								'X-HTTP-Method-Override' : 'POST'
							},
							data : JSON.stringify({
								bno : bno,
								replyer : $("#replyer").val(),
								replytext : $("#replytext").val()
							}),
							dataType : 'text',
							success : function(result) {
								$("#reliesList").html("");
								
								getReplyList(bno);
								
								$("#replyer").val("");
								$("#replytext").val("");
							}
								
						});
					});
					
					$(".reply").click(function () {
						$("#mycollapse").toggle();
					});
					
					$(".delete").click(function () {
						$("form").submit();
					});
					
					$(".update").click(function () {
						location.assign("/board/update/${vo.bno}?curPage=${curPage}")
					});
					
					
					$(".list").click(function () {
						location.assign("/board/list/${curPage}")
					});
					
					 getReplyList(bno);
					 getAttach(bno);
				 });
				
				function getReplyList(bno) {
					$.getJSON("/replies/reply/"+bno, function(data) {
						for (var i = 0; i < data.length; i++) {
							var obj = data[i];
							var msg = me4(obj['rno'],obj['replyer'],obj['updatedate'],obj['replytext'], '${login.userId}');
							$("#reliesList").append(msg);
						}
						
					});
				}
				
				function getAttach(bno) {
					$.getJSON("/board/getAttach/"+bno, function(result) {
						for (var i = 0; i < result.length; i++) {
							var filename = result[i];
							
							var msg = uploadViewForm(getLinkText(filename), filename, getOriginalName(filename));
							$(".uploadedList").append(msg);
						}
					});
				}
				
				
			</script>

		</div>


	

</body>
</html>