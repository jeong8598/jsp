<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
#out {
width:300px;
height:120px;
overflow:hidden;
border:5px solid yellow;
}
#in {
width:2400px;
height:120px;
}
</style>
<script>
/* 
	setInterval(function(){실행내용},시간);
	setInterval(aa);
	funstion aa(){
		실행내용;
	}
*/

	$(function(){
		setTimeout(() => alert('안녕하세요.'), 1000);
		setInterval(function(){
			//id가 in인것들을 움직여라 2초동안 완료된 뒤 ~실행하라(제일 앞에있는 그림을 제일 뒤로 레이어위치 원래대로)
			$("#in").animate({
				//움직일 속성
				marginLeft:"-100px",//세미콜론 생략
				height:"200px",
				background:"red"
			},2000,function(){
				$("img").eq(0).insertAfter($("img").eq(7));
				$("#in").css("marginLeft","0px");
			});
		},4000);
	});

</script>
</head>
<body>
<div id="out">
	<div id="in">
		<img src="1.jpg" width="300" height="120">
		<img src="2.jpg" width="300" height="120">
		<img src="3.jpg" width="300" height="120">
		<img src="4.jpg" width="300" height="120">
		<img src="5.jpg" width="300" height="120">
		<img src="6.jpg" width="300" height="120">
		<img src="7.jpg" width="300" height="120">
		<img src="8.jpg" width="300" height="120">
	</div>
</div>
</body>
</html>