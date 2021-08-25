<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	시작값과 끝값을 입력 후 합구하기 버튼 누르면 
	test3_ok.jsp에서
	1. request값 읽어오기 2.java 적절한 메소드를 통해 합을 구한다 3. 그 결과를 브라우저에 출력
 -->
<form name="cal" action="test3_ok.jsp" method="post">
	시작값 : <input type="text" name="start">
	끝값 : <input type="text" name="end">
	<input type="submit" value="합구하기">
</form>
<!-- 
	jquery ajax
	$.get() get방식 ajax
	$.post() post방식 ajax
 -->
</body>
</html>