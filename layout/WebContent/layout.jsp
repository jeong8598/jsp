<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
	text-align:center;
	}
/*1층~6층 */
	body{
	margin:0px;
	}
	#first{
	width:100%;
	height:50px;
	background:purple;
	margin:auto;
	color:white;
	}
	#first a{
	text-decoration:none;
	
	}
	/* left,right의 가로합을 1200px;*/
	#first #inner{
	width:1200px;
	height:50px;
	margin:auto;
	}
	#first #left{
	float:left;
	width:1180px;
	height:50px;
	text-align:center;
	}
	#first #right{
	float:right;
	width:20px;
	height:50px;
	}

	#second{
	width:1200px;
	height:50px;
	margin:auto;
	}
	#second #left{
	float:left;
	margin-top:13px;
	}
	#second #right{
	float:right;
	margin-top:13px;
	}
	#second #bae{
	display:inline-block;
	width:220px;
	height:30px;
	border:1px solid #bbbbbb;
	border-radius:20px;
	padding-top:5px;
	text-align:center;
	margin-top:-10px;
	}
	#third{
	width:1200px;
	height:90px;
	background:pink;
	margin:auto;
	text-align:center;
	}
	#third #logo{
	padding-top:30px;
	}
	#fourth{
	width:1200px;
	height:60px;
	background:#dddddd;
	margin:auto;
	}
	#fourth li{
	list-style-type:none;
	display:inline;
	line-height:60px;
	width:150px;
	padding-top:20px;
	margin-right:10px;
	}
	#category{
	text-align: left;
	}
	#fifth{
	width:1600px;
	height:400px;
	border:1px solid red;
	margin:auto;
	}
	#sixth{
	width:1200px;
	height:450px;
	border:1px solid lightblue;
	margin:auto;
	}
</style>
<script>
	var chk = 0;
	function init(){
		if(chk%2 == 0)
			document.getElementById("bae").innerText="서울.경기.인천 샛별배송";
		else
			document.getElementById("bae").innerText="수도권 이외 지역 택배배송";
		chk++;
	}
	function start(){
		setInterval(init,2000);	//init함수를 2초에 한번 실행하라
	}
	function hide(){
		document.getElementById("first").style.display="none";
	}
</script>
</head>
<body onload="start()">
<div id="first">
	<div id="inner">
		<div id="left">지금 가입하고 인기상품 100원 받아가세요!! ></div>
		<div id="right"><a href="javascript:hide()">X</a></div>
	</div>
</div>
<div id="second">
	<div id="left"><span id="bae"> 수도권 이외 지역 택배배송 </span></div>
	<div id="right">회원가입 로그인 고객센터 배송지역 검색</div>
</div>
<div id="third">
	<div id="logo">로고</div>
</div>
<div id="fourth">
	<ul id="category">
		<li> 전체 카테고리 </li>
		<li> 신상품 </li>
		<li> 베스트 </li>
		<li> 알뜰쇼핑 </li>
		<li> 이벤트 </li>
		<li> 검색창 </li>
		<li> 돋보기 </li>
		<li> 카트 </li>
	</ul>
</div>
<div id="fifth">광고</div>
<div id="sixth">컨텐츠</div>
</body>
</html>