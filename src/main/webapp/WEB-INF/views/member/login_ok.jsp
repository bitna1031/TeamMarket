<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
   <c:when test="${empty login}">
      <a class="hrefType btn btn-xs" style="background-color: pink; color: white; float: right; margin: 5px; font-size: 1em;" href="/member/loginGet">Login </a>
       <a class="hrefType btn btn-xs" style="background-color: pink; color: white; float: right; margin: 5px; 
      font-size: 1em;">Join</a>
   </c:when>
   <c:otherwise>
      <div style="float: right;">
      <div style="margin-top: 10px;">${login.userName}님, 반갑습니다.^_^&nbsp;
      <a class="hrefType btn btn-xs" style="background-color: pink; color: white; float: right; margin: 0; 
      font-size: 1em;" href="/board/list"
          >logout</a>
           <!--  <a class="hrefType btn btn-xs" style="background-color: pink; color: white; float: right; margin: 5px; 
      font-size: 1em;">회원목록</a> --></div></div>
   </c:otherwise>
</c:choose>