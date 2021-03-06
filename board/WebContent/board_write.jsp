<%@page import="www.html.header.Header"%>
<%@page import="www.html.nav.Nav"%>
<%@page import="www.html.footer.Footer"%>
<%-- <%@ include file="/include/top.jsp" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Header header = new Header();
String css = header.getCss();
String js = header.getJs();
String title = header.getTitle();
String headerUrl = header.getHeaderUrl();

Nav nav = new Nav();
String menu = nav.getMenu();

Footer footer = new Footer();
String footerUrl = footer.getFooterUrl();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><%=title%></title>
<style type="text/css">

	h2{ text-align: center;}
	#first li{
		list-style-type: none;
		display: inline-block;
		margin-left: 30px;
		padding-left:15px;
		padding-top: 10px;
		}
/* 	.base_wrap{text-align:center;} */
	
	#board{
		width: 600px;
		height:500px;
		margin: auto;
	}
	
	#board td{
		padding-left: 20px;
		 border:1px solid #cccccc;
	}
</style>
<script type="text/javascript">

function main(){
		frm=document.frm;
		if(frm.name.value ==""){
			alert("이름을 입력하세요")
			return false;
		}
		if(frm.title.value ==""){
			alert("제목 입력은 필수 입니다")
			return false;
		}
		if(frm.pwd.value!=frm.pwd2.value){
			alert("비밀번호가 다릅니다");
			return false;
		}
		if(frm.pwd.value ==""){
			alert("비밀번호를 입력하세요")
			return false;
		}
	}


function aaa(my) {
	if(my.pwd.value !=my.pwd2.value){
		document.getElementById("pwc").innerText="비번이 틀립니다";
		document.getElementById("pwc").style.color="blue";
	}else{
		document.getElementById("pwc").innerText="비번이 일치합니다";
		document.getElementById("pwc").style.color="red";
	}
}

</script>


<%=css%>
<%=js%>
</head>
<body>
	<input type="hidden" id="color_class" value="minkyu" />
	<div id="wrap">
		<jsp:include page="<%=headerUrl%>" flush="true"/>
		<nav>
			<div class="base_wrap">
				<%=menu%>
			</div>
		</nav>
		<main>
			<div class="base_wrap">
				<h2>글 쓰기</h2>
				
<form method="post" action="board_write_ok.jsp" enctype="multipart/form-data" onsubmit="return main()" id="frm" name="frm">
	<table id="board">
		<tr>
			<td>카테고리</td>
			<td><select name="kind">
					<option value="수익자랑">수익자랑				
					<option value="노하우공유">노하우공유				
				</select>
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<input type="radio" name="sung" value="남자">남자
				<input type="radio" name="sung" value="여자">여자
			</td>
	
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="9" cols="60" name="content"></textarea></td>
		</tr>
		<tr>
			<td>이미지</td>
			<td><input type="file" name="fname"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pwd" ></td>
		</tr>
		<tr>
			<td>비밀번호확인</td>
			<td><input type="password" name="pwd2" onkeyup="aaa(this.form)"><br/>
			<span id="pwc"></span></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="작성하기"></td>
		</tr>
		
	</table>
</form>
			</div>
		</main>
		<jsp:include page="<%=footerUrl%>" flush="true"/>
	</div>
</body>
</html>