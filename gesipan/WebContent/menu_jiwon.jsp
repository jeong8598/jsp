<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#mainmenu {
	margin:auto;
	width:1000px;
	height:50px;
	background:#fcff97;
}
#mainmenu #menu > li{
	font-weight:900;
	display:inline-block;
	text-align:center;
	list-style-type:none;
	width:150px;
	height:40px;
	padding-top:15px;
	border-radius:5px;
	position:relative;
}
#mainmenu .sub{
	position:absolute;
	border:1px solid black;
	padding-left:0px;
	margin-left:-20px;
	margin-top:12px;
	
}
#mainmenu .sub > li{
	position:relative;
	border:1px solid black;
	list-style-type:none;
	width:180px;
	height:40px;
	border:1px solid black;
	padding-top:10px;	
}
	.one, .two, .three{
	border:1px solid black;
	position:absolute;
	display:inline-block;
	width:200px;
	height:300px;
	
	}
</style>
<script>
	
</script>
</head>
<body>
<div id="mainmenu">
	<ul id="menu">
		<li>전체 카테고리
	 		<ul class="sub">
				<li>브랜드패션
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
				<li>패션의류/잡화/뷰티
					<ul class="inner">
						<li>의류
							<ul class="one">
								<li>여성의류</li>
								<li>남성의류</li>
								<li>언더웨어</li>
								<li>유아동의류</li>
							</ul>
						</li>
						<li>잡화
							<ul class="two">
								<li>신발</li>
								<li>가방</li>
								<li>쥬얼리/시계</li>
								<li>잡화</li>
							</ul>
						</li>
						<li>뷰티
							<ul class="three">
								<li>화장품/향수</li>
								<li>바디/헤어</li>
							</ul>
						</li>
					</ul>
				</li>
				<li>식품/생필품
					<ul class="inner">
						<li>식품
							<ul class="one">
								<li>신선식품</li>
								<li>가공식품</li>
								<li>건강식품</li>
								<li>커피/음료</li>
							</ul>
						</li>
						<li>생필품
							<ul class="two">
								<li>생필품</li>
							</ul>
						</li>
					</ul>
				</li>
				<li>홈데코/취미/반려</li>
				<li>컴퓨터/디지털/가전</li>
				<li>스포츠/건강</li>
			</ul>
		</li>
		<li>베스트</li>
		<li>신상품</li>
		<li>슈퍼딜</li>
		<li>쿠폰/이벤트</li>
	</ul>
</div>
</body>
</html>