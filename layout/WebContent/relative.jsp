<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
span,div{
background:lightblue;
border:1px solid black;
position: relative;
}
/* 
	relative는 각각의 방향을 기준으로 태그 안쪽 방향으로 이동 
	static인 상태를 기준으로 주어진 픽셀만큼 움직임
*/
#top{
top:5px;
z-index: 1;
}
/*
	보통 태그는 같은 position이면 나중에 나온 태그가 더 위에 배치됩니다.  
	z-index라는 속성을 #top 태그에 더 높게 주었기 때문에 #left태그보다 위로 올라갔습니다.
	z-index는 태그들이 겹칠 때 누가 더 위로 올라가는지를 결정하는 속성입니다. 
	기본값은 0이고요. 
	#top에 1을 주었기 때문에 다른 태그들보다 높게 위치합니다.
*/

#right{
right: 5px;
}
#bottom{
bottom: 5px;
}
#left{
left:5px;
}

</style>
</head>
<body>
<span id="top">top</span>
<span id="right">right</span>
<span id="bottom">bottom</span>

<div id="left">left</div>
</body>
</body>
</html>