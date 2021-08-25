<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.inner{
	border:1px solid red;
	position:relative;
	margin-left:150px;
	width:650px;
	height:300px;
	}
	.one, .two, .three{
	position:absolute;
	display:inline-block;
	width:200px;
	height:300px;
	
	}

</style>
<script>
	function inner_view(n)
	{
		document.getElementsByClassName("inner")[n].style.visibility="visible";
	}
    function inner_hide(n)
    {
   		document.getElementsByClassName("inner")[n].style.visibility="hidden";
    }
</script>
</head>
<body>
<ul class="sub">
	<li onmouseenter="inner_view(0)" onmouseleave="inner_hide(0)">브랜드패션
		<ul class="inner">
			<li class="one">브랜드의류
				<ul>
					<li>여성의류</li>
					<li>남성의류</li>
					<li>진/캐쥬얼</li>
				</ul>
			</li>
			<li class="two">브랜드잡화
				<ul>
					<li>신발/가방</li>
					<li>쥬얼리/시계</li>
					<li>수입명품</li>
				</ul>
			</li>
			<li class="three">스포츠브랜드
				<ul>
					<li>아웃도어</li>
					<li>스포츠패션</li>
				</ul>
			</li>
		</ul>
	</li>
	<li onmouseenter="inner_view(1)" onmouseleave="inner_hide(1)">패션의류/잡화/뷰티
		<ul class="inner">
			<li class="one">의류
				<ul>
					<li>여성의류</li>
					<li>남성의류</li>
					<li>언더웨어</li>
					<li>유아동의류</li>
				</ul>
			</li>
			<li class="two">잡화
				<ul>
					<li>신발</li>
					<li>가방</li>
					<li>쥬얼리/시계</li>
					<li>잡화</li>
				</ul>
			</li>
			<li class="three">뷰티
				<ul>
					<li>화장품/향수</li>
					<li>바디/헤어</li>
				</ul>
			</li>
		</ul>
	</li>
	<li onmouseenter="inner_view(2)" onmouseleave="inner_hide(2)">식품/생필품
		<ul class="inner">
			<li class="one">식품
				<ul>
					<li>신선식품</li>
					<li>가공식품</li>
					<li>건강식품</li>
					<li>커피/음료</li>
				</ul>
			</li>
			<li class="two">생필품
				<ul>
					<li>생필품</li>
				</ul>
			</li>
		</ul>
	</li>
	<li>홈데코/취미/반려</li>
	<li>컴퓨터/디지털/가전</li>
	<li>스포츠/건강</li>
</ul>
</body>
</html>