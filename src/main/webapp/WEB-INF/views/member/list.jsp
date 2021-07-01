<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="/resources/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container jumbotron">
		 <jsp:include page="login_ok.jsp"/>
			<a data-toggle="tooltip" title="게시판으로 이동합니다." class="hrefType" href="/board/list" style="color : #FF007F; float: left; margin: 5px; font-size: 1.5em;">
			NaNa's Page
			</a>
			<!-- <a class="hrefType btn" style="background-color: pink; color: white; float: right; margin: 5px; font-size: 1em;" href="/member/loginGet">Login </a> -->
			<br><br>
			<h2><strong>회원 목록</strong></h2>
	</div>
	<div class = "bigbody">
	
	
	<div style="width: 160px; height:550px; float: right; margin-top: 80px;" id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
	
	<div class="carousel-inner">
      <div class="item active">
        <img src="/resources/img/flower.jpg" style="width: 160px; height:550px;" >
      </div>

      <div class="item">
        <img src="/resources/img/flower2.jpg" style="width: 160px; height:550px;">
      </div>
    
      <div class="item">
        <img src="/resources/img/flower3.jpg" style="width: 160px; height:550px;">
      </div>
    </div>
	<a class="carousel-control" href="#myCarousel" data-slide="prev">
    </a>
    <a class="carousel-control" href="#myCarousel" data-slide="next">
    </a>
  </div>
</div>
	
	<div class="bodystyle">
	
	<h4><strong><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
		회원 목록 </strong></h4>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th style="text-align: center; width: 100px;">아이디</th>
					<th style="text-align: center; width: 100px;">이름</th>
					<th style="text-align: center; width: 100px;">가입일</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td style="text-align: center;"><a href="/member/read/${dto.userId}">
					${dto.userId}</a></td>
					<td style="text-align: center;">${dto.userName}</td>
					<td style="text-align: center;">${dto.regDate}</td>
				</tr>

			</c:forEach></tbody>
		</table></div>

</body>
</html>