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
</head>
<body>
	<h2>테스트3</h2>
	<button>click</button>
	<div></div>
<script type="text/javascript">
	$(document).ready(function () {
		var test1 = "hello";
		var test2 = "hi";
		var test3 = "good";
		var test4 = [
			{userId : 'm001' , userName : 'kim'},
			{userId : 'm002' , userName : 'lee'},
			{userId : 'm003' , userName : 'park'}
		];
		
		$("button").click(function() {
			$.ajax({
				type : 'post',
				url : '/rest/test3',
				data : JSON.stringify({
					test1 : test1,    //속성명 : 속성값
					test2 : test2,
					test3 : test3,
					test4 : test4
				}),
				dataType : 'text',
				success : function (result) {
					var obj = JSON.parse(result);
					var str = "";
					var msg1 = obj["test1"];
					str += msg1+", ";
					var msg2 = obj["test2"];
					str += msg2+", ";
					var msg3 = obj["test3"];
					str += msg3+", ";

					var arr = obj["test4"];
					for (var i = 0; i < arr.length; i++) {
						var array_element = arr[i];
						
						var id = array_element["userId"];
						var name = array_element["userName"];
						
						str += id+", ";
						str += name+", ";
					}
					str = str.substring(0, str.length -2);
					
					$("div").html(str);
					
					
					
					
					/* $("div").text(result);
					console.log(obj); */
				},
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'POST'
				}
					
			});
			
		});
	});



</script>
</body>
</html>