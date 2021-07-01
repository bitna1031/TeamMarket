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
<link href="/resources/css/login.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container jumbotron">
			<a data-toggle="tooltip" title="게시판으로 이동합니다." class="hrefType" href="/board/list" style="color : #FF007F; float: left; margin: 5px; font-size: 1.5em;">
			NaNa's Page
			</a>
			
			<br><br>
			<h2><strong>Login Page</strong></h2>
	</div><br><br>
<form style="border-radius : 1.5em; width : 315px; height : 140px; border : 1px solid #FCF0F7; background-color : #FCF0F7; margin: auto;"   action="/member/loginPost" method="post">
        <input style="float : left; width: 180px; margin: 10px 0 0 10px;" type="text" class="form-control" placeholder="아이디" name="userId" id="userId" required autofocus>
        <input style="float : left; width: 180px; margin: 10px 0 0 10px;" type="password" class="form-control" placeholder="비밀번호" name="userPw" id="userPw" required>
        <button style="color:white; margin : 20px; background-color: pink;" class="btn btn-lg hrefType" type="submit"><strong>Login</strong></button>
      <br><br>
      <div style="margin-left: 4%; width: 310px;">
      <a class="hrefType" href="/board/id_find.jsp">아이디 찾기</a>&nbsp;&nbsp;&nbsp;
      <a class="hrefType" href="/board/pw_find.jsp">비밀번호 찾기</a>
      </div></form>


</body>
</html>