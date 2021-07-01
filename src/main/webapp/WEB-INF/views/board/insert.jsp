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
<script type="text/javascript" src="/resources/js/test1.js">
</script>
<link href="/resources/css/insert.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container jumbotron">
		<a data-toggle="tooltip" title="게시판으로 이동합니다." class="hrefType" href="/board/list" style="color : #FF007F; float: left; margin: 5px; font-size: 1.5em;">
			NaNa's Page
			</a>
			<a class="hrefType btn" style="background-color: pink; color: white; float: right; margin: 5px; font-size: 1em;" href="/member/login">Login </a>
			<br><br>
			<h2><strong>게시글 작성</strong></h2>
	</div>
	
		<div class = "bigbody">
	<div class="bodysize">
		<div class="bodystyle">
		<h4><strong><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
		게시글 작성 </strong></h4>
		<div style="background-color: #FFF7FC; height: 100%;">
			<form action="/board/insert" method="post">
				<div class="form-group">
					<label style="margin : 10px 0 0 10px; font-size: 1.2em;" for="userId">작성자</label>
					<input value="${login.userId}" readonly style="margin : 0 10px;; width: 200px;" name="userId" type="text" class="form-control" id="userId">
				</div>
				<div class="form-group">
					<label style="margin : 0 10px; font-size: 1.2em;" for="title">제 목</label> 
					<input style="margin : 0 10px; width: 97%;" name="title" type="text"	class="form-control" id="title" placeholder="제목을 입력하세요.">
				</div>
				<div class="form-group">
					<label style="margin : 0 10px; font-size: 1.2em;" for="content">내 용</label>
					<textarea style="height: 400px; width: 97%; resize: none; margin : 0 10px;"
						 rows="15" name="content" class="form-control"
						 id="content" placeholder="내용을 입력하세요."></textarea>
				</div>
				
			</form>
		
		<div>
			<h5><strong><span style="margin : 10px 0 0 10px; font-size: 1.2em;" class="glyphicon glyphicon-paperclip" aria-hidden="true"></span>파일 첨부</strong></h5>
			<div style="margin : 10px 0 0 10px;" class="fileDrop">파일을 드래그하여 넣어주세요.</div>
			<div style="margin-top: 10px;" class="upLoadedList"></div>
			
		</div></div>
		<button style="margin-right : 1%; background-color : pink; float: right;" type="submit" class="btn"><strong>작성</strong></button>
		<button style="float: right; margin-right : 2%;" type="reset" class="btn btn-info">뒤로가기</button><br>
		</div></div><br><br>

	<script type="text/javascript">
		$(document).ready(function() {
			
			
			$("button[type='reset']").click(function(event) {
				event.preventDefault();
				$(".delFile").each(function(index) {
					var filename = $(this).attr("data-filename");
					
					$.ajax({
						type : 'post',
						url : '/board/deleteFile',
						data : {
							filename : filename
						},
						dataType : 'text',
						
					});
				});
				
				history.back();
			});
			
			$("button[type='submit']").click(function(event) {
				event.preventDefault();
				
				var str = '';
				$(".delFile").each(function(index) {
					var filename = $(this).attr("data-filename");
					str += getFileUploadFilenameInput(index, filename);
				});
				
				$("form").append(str);
				$("form").submit();
			});
			
			$(".upLoadedList").on("click", "small.delFile", function () {
				var that = $(this);
				
				$.ajax({
					type : 'post',
					url : '/board/deleteFile',
					data : {
						filename : that.attr("data-filename")
					},
					dataType : 'text',
					success : function(result) {
						alert(result);
						that.parent("p").parent("div").remove();
					}
				});
			});
			
			$(".fileDrop").on("dragenter dragover", function(event) {
				event.preventDefault();
			});

			$(".fileDrop").on("drop", function(event) {
				event.preventDefault();
				var files = event.originalEvent.dataTransfer.files;
				var file = files[0];

				var formData = new FormData();
				formData.append("file", file);

				$.ajax({
					type : 'post',
					url : '/board/uploadfile',
					processData : false,
					contentType : false,
					data : formData,
					dataType : 'text',
					success : function(filename) {
						var msg = uploadUpdateForm(getLinkText(filename), filename, getOriginalName(filename));
						$(".upLoadedList").append(msg);
					}
				});
			});
		});
	</script></div>

</body>
</html>