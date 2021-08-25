<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#layer{
	position:absolute;
	left:200px;
	top:100px;
	background:yellow;
	width:200px;
	height:200px;
	}
</style>
<script>
	//setTImeout, setInterval => 특정시간 후에 기능(함수)를 호출하는 메서드
	function hide(){
		document.getElementById("layer").style.visibility="hidden"
	}
	setTimeout(hide,3000);
	
	function show(){
		alert("안녕하세요");
	}
	
	//setTimeout(show,3000);//setTimeout(함수,시간)	=> 	시간 후에 함수를 실행하라(딱1번실행)
	setInterval(show,3000);	//setTimeout(함수,시간)	=> 	시간 후에 함수를 실행하라(무한반복실행,조건을따로주지않으면)
	//함수에는 ()괄호쓰지 않는다
</script>
</head>
<body>
<div id="layer">
광고입니다.
</div>
</body>
</html>