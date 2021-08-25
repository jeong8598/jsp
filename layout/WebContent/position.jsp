<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#aa,#bb{
	position:absolute;
	left:100px;
	top:100px;
	background:red;
	width:100px;
	height:100px;
	}
	#main{
	position:relative;
	width:400px;
	height:400px;
	border:1px solid blue;
	margin-left:300px;
	}
	/**/
</style>
</head>
<body>
<div id="aa"></div>
<div id="main">//특정태그 안에있더라도 relative를 주지않으면 브라우저0.0기준으로 위치함
	<div id="bb"></div>
</div>
</body>
</html>