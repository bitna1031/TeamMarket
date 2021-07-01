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
			<h2><strong>게시판</strong></h2>
			
		
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
		게시글 목록 </strong></h4>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th style="text-align: center; width: 50px;">순번</th>
					<th style="text-align: center; width: 270px;">제목</th>
					<th style="text-align: center; width: 80px;">글쓴이</th>
					<th style="text-align: center; width: 70px;">조회수</th>
					<th style="text-align: center; width: 100px;">작성일</th>

				</tr>
			</thead>
			<tbody>
			<c:forEach items="${to.list}" var="vo">
				<tr>
					<td style="text-align: center;">${vo.bno}</td>
					<td><a class="hrefType" href="/board/read/${vo.bno}?curPage=${to.curPage}">${vo.title}&nbsp;
					<span style="color: pink;">[${vo.recnt}]</span>
					</a>
					</td>
					<td style="text-align: center;">${vo.userId}</td>
					<td style="text-align: center;">${vo.readcnt}</td>
					<td style="text-align: center;">${vo.updatedate}</td>

				</tr>

			</c:forEach></tbody>
		</table><a href="/board/insert" class="btn" style="color : black; float: right; background-color: pink;">
		글 작성<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
		</a><br><br>
		
	</div>
		
	<div style="text-align: center;"> <jsp:include page="paging_part.jsp"></jsp:include></div>

</body>
</html>