<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 
	absolute는 position: static 속성을 가지고 있지 않은 부모를 기준으로 움직입니다.
	만약 부모 중에 포지션이 relative, absolute, fixed인 태그가 없다면 
	가장 위의 태그(body)가 기준.
	div여도 더는 width: 100%가 아닙니다.
*/
#absolute {
background: lightblue;
position: absolute;
right: 0;
}
#parent {
position: relative;
width: 100px;
height: 100px;
background: skyblue;
}
#child {
position: absolute;
right: 0;
}
</style>
</head>
<body>
<div>
  <div id="absolute">absolute</div>
</div>
<div id="parent">parent
  <div id="child">children</div>
</div>
</body>
</html>