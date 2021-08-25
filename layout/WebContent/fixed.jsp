<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 
	fixed는 항상 특정 위치에 고정되어있.스크롤을 내려도 고정 
	fixed도 absolute처럼 더는 div가 width: 100%가 아닙니다.
 */
div{
background: lightblue;
}
#one{
top:100px;
position:fixed;
}
#two{
height:500px;
border:1px solid red;
background:pink;
margin-top:10px;
}
#three{
right:0;
position:fixed;
z-index: 1;
}
#four{
bottom:0;
position:fixed;
}
#five{
height:500px;
border:1px solid blue;
background:light blue;
position:relative;
}
 </style>
</head>
<body>
<div id="one">1 fixed one</div>
<div id="two">2 static</div>
<div id="three">3 fixed two</div>
<div id="five">4 relative</div>
<div id="four">5 fixed three</div>
</body>
</html>