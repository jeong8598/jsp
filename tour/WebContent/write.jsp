<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(function() {
	$("#list").on("click",function(e){
		e.preventDefault();
		location="list.jsp";
	});

});
	function setThumbnail(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.style.width = 50+"px";
			img.style.height = "auto";
			img.setAttribute("src", event.target.result);
			document.querySelector("div#imgDiv").replaceWith(img);
		};
		reader.readAsDataURL(event.target.files[0]); 
	}
</script>
<style>
* {
	text-align:center;
	font-size:15px;
}
a {
	text-decoration:none;
	display:inline-block;
	color:black;
}
.btn{
	width:100px;
	height:30px;
	border:1px solid #dddddd;
	background:#dddddd;
	line-height:30px;
	vertical-align:middle;
}
table{border-collapse:collapse;}
td {
	border:1px solid #dddddd;
	padding:10px;
}
tr:nth-last-child(2) td{
	width:50px;
	line-height:50px;
	
}
input[type=text]{
	width:80%;
	height:20px;
}
#imgDiv{
	width:50px;
	height:50px;
	display:inline-block;
	overflow:hidden;
	margin-left:0;
	border:1px solid red;
}


</style>
</head>
<body>
<!-- 파일업로드 시 자주사용하는 데이터전송타입 enctype="multipart/form-data"-->
<form name="tourFrm" action="write_ok.jsp" method="post" enctype="multipart/form-data">
	<table align="center" width="600">
		<colgroup>
			<col width="10%">
			<col width="90%">
		</colgroup>
		<tr>
			<td> 제목 </td>
			<td> <input type="text" name="title"> </td>
		</tr>
		<tr>
			<td> 이름 </td>
			<td> <input type="text" name="name"> </td>
		</tr>
		<tr>
			<td> 내용 </td>
			<td><textarea cols="60" rows="10" name="content"> </textarea></td>
		</tr>
		<tr>
			<td><div id="imgDiv"></div></td>
			<td><input type="file" name="fname" onchange="setThumbnail(event);"></td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="list.jsp" id="list" class="btn"> 목록 </a>
				<input type="submit" id="write" class="btn" value="글쓰기">
			</td>
		</tr>
	</table>
</form>
</body>
</html>
<!-- 
	이미지 썸네일
	<meta name="viewport" content="width=device-width, initial-scale=1.0" /> <meta http-equiv="X-UA-Compatible" content="ie=edge" />
	<input type="file" id="image" accept="image/*" onchange="setThumbnail(event);"/>
	function setThumbnail(event) { var reader = new FileReader(); reader.onload = function(event) { var img = document.createElement("img"); img.setAttribute("src", event.target.result); document.querySelector("div#image_container").appendChild(img); }; reader.readAsDataURL(event.target.files[0]); }

 -->