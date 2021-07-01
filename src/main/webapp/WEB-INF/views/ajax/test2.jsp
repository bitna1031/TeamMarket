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
<h2>테스트 2 임둥	</h2>
<button>배열 전송</button>
<script type="text/javascript">

var arr = ["hello","world","good","안녕"];

	$(document).ready(function () {
		$("button").click(function () {
			$.ajax({
				type : 'post',
				url : '/ajax/test2',
				data : {
					"arr" : arr
				},
				traditional : true, //배열일때
				dataType : 'text', //Type 대문자 !
				success : function (result) {
					console.log(result);
					var obj = JSON.parse(result);
					console.log(obj);
					console.log(obj[0]);
					
				} 
			});
			
		});
	});

</script>

</body>
</html>