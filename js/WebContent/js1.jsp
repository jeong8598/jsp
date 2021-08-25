<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
//1.함수의 이름이 있는 경우
/* function text(){
	document.getElementById("haha").style.color = "blue";
} */
//2.함수 이름이 없는 경우
window.onload = function(){
	document.getElementById("haha").style.color = "blue";
}
</script>
</head>
<body><!-- 1.<body onload="test()" -->
<!-- 문서읽을때 글자색을 파란색으로 -->
	<span id="haha"> 하하하 </span>
</body>
</html>