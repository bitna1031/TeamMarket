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
</head>
<body>
<h2>테스트임</h2>
<button class="good">문자데이터 1개 전송</button>

<script type="text/javascript">
	$(document).ready(function () {
		$(".good").click(function () {
			$.ajax({
				type : 'post',
				url : '/ajax/test1',
				data : {
					'str' : '하이사' //json 객체데이터
				},
				datatype : 'text',
				success : function (result) {
					console.log(result); //alert 은 객체를 못보냄
				}
				
			});
		});
	
	});

</script>
</body>
</html>