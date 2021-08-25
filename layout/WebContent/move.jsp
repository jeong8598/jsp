<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#layer{
background:red;
width:200px;
height:200px;
text-align:center;
top:100px;
left:10px;
position:relative;
}
</style>
<script>
var n = 1;
var ss;
function move(){
	//start함수는 한번실행되므로 멈추는 동작은 여기에서 실행해야함
	document.getElementById("layer").style.left=10*n+"px"
	if(n>500)
		clearInterval(ss);	//괄호안 특정 Interval을 중지시킨다.
	n++;
}
function start(){	//나는 left의 값이 500px되면 멈추고싶다.	=>clearInterval(객체명)
	ss=setInterval(move,10);	//꼭 다른 함수에서 ss객체명을 사용할 경우 var생략=전역변수로 생성해야한다.
}
</script>
</head>
<body>
<input type="button" onclick="move()" value="클릭">
<input type="button" onclick="start()" value="계속 이동">
<div id="layer"> 광고 </div>
</body>
</html>