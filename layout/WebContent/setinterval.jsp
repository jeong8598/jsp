<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#layer,#box{
background:red;
width:200px;
height:200px;
text-align:center;
top:100px;
left:10px;
position:relative;
margin:100px 0;
}
</style>
<script>
var n = 1;
var ss;
var b = 20;
var sc;

function move(){
	//start함수는 한번실행되므로 멈추는 동작은 여기에서 실행해야함
	document.getElementById("layer").style.left = 10*n+"px"
	if(n>500)
		clearInterval(ss);	//괄호안 특정 Interval을 중지시킨다.
	n++;
}

function start(){	//나는 left의 값이 500px되면 멈추고싶다.	=>clearInterval(객체명)
	ss=setInterval(move,10);	//꼭 다른 함수에서 ss객체명을 사용할 경우 var생략=전역변수로 생성해야한다.
}
//left 값을 변경=> 이동 width, height를 변경해보세요

function chgSize(){
	b++;
	document.getElementById("box").style.width = 10*b+"px";
	document.getElementById("box").style.height = 10*b+"px"
	if(b>400){
		clearInterval(sc);
	}
}
function sizeUp(){	//가로와 세로 크기가 400px되면 멈춰라
	sc=setInterval(chgSize,10);
}
</script>
</head>
<body>
<input type="button" onclick="move()" value="클릭">
<input type="button" onclick="start()" value="계속 이동">
<div id="layer"> 광고 </div>
<hr>
<input type="button" onclick="chgSize()" value="크기 변경">
<input type="button" onclick="sizeUp()" value="계속 증가">
<div id="box"> 크기 </div>
</body>
</html>