<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
//1.함수의 이름이 있는경우
/* 	function test()
	{
		document.getElementById('pkc').style.color="blue";
	} */
//2. 함수 이름을 지정하지 않는
/* 	window.onload=function()
	{
		document.getElementById('pkc').style.color="blue";
	}
	 */
</script>
</head>
<body>	<!-- 1.<body onload="test()"> -->
<!-- 문서를 읽을 때 하하하 라는  글자를 파란색으로  -->
	<span id="pkc">하하하</span>
</body>
</html>