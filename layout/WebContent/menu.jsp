<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
li{
list-style-type:none;
}
.main{
border:1px solid black;
width:100px;
padding:20px;
text-align:center;
}
.sub{
display:none;
border:1px solid red;
}
.sub li{
margin:5px;
}
#first ul{
position:absolute;
left:20px;
visibility:hidden;
}
#first {
width:800px;
height:30px;
margin:auto;
position:relative;
}

</style>
<script>
function sub_view(num){
	for(i=0;i<4;i++){	//부메뉴 모두 숨기기
		document.getElementsByClassName("sub")[i].style.display = "none";
	}
	//선택된 부메뉴 보이기
	document.getElementsByClassName("sub")[num].style.display = "block";
}
function view(){
	document.getElementById("sub").style.visibility = "visible";
}
function hide(){
	document.getElementById("sub").style.visibility = "hidden";
}
</script>
</head>
<body>
<!-- 메뉴 만드는 태그 => 모든 태그가 가능하지만 div,ul(제일많이사용) -->
<!-- nav 레이아웃 만드는 태그 -->
<!-- li태그는 block => 한 행을 차지 (inline=>자기공간만 차지) -->
<ul>
	<li class="main" onclick="sub_view(0)"> 수산물 </li>
	<li class="sub">
		<ul>
			<li> 생선류 </li>
			<li> 어패류 </li>
			<li> 두족류 </li>
			<li> 가공식품 </li>
		</ul>
	</li>
	<li class="main" onclick="sub_view(1)"> 안주류 </li>
	<li class="sub">
		<ul>
			<li> 순대국 </li>
			<li> 낚지볶음 </li>
			<li> 감자탕 </li>
			<li> 육개장 </li>
		</ul>
	</li>
	<li class="main" onclick="sub_view(2)"> 과자 </li>
	<li class="sub">
		<ul>
			<li> 새우깡 </li>
			<li> 감자깡 </li>
			<li> 양파깡 </li>
			<li> 뽀빠이 </li>
		</ul>
	</li>
	<li class="main" onclick="sub_view(3)"> 주류 </li>
	<li class="sub">
		<ul>
			<li> 소주 </li>
			<li> 양주 </li>
			<li> 맥주 </li>
			<li> 막걸리 </li>
		</ul>
	</li>
</ul>
<div id="first" onmouseenter="view()" onmouseleave="hide()">
	수산물 - 마우스오버
	<ul id="sub">
		<li> 횟감 </li>
		<li> 어패류 </li>
		<li> 두족류 </li>
		<li> 기타등등 </li>
	</ul>
</div>

</html>