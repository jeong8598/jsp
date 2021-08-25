<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="isRight" value="true"/>
<script>
// condition에 따라 동적으로 서버단 조건 변경
var condition = true;
// condition에 따라 동적으로 텍스트 변경
if(${isRight} && condition == true){
	document.getElementById('text').innerText = "옳다.";
}
</script>

<p id="text">내가 틀리다.</p>
</body>
</html>