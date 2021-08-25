<%@page import="paging.dto.BoardDTO"%>
<%@page import="paging.DB_Conn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	DB_Conn db = new DB_Conn();
	BoardDTO bdto = new BoardDTO();
	bdto = db.get_content(id);
	
	pageContext.setAttribute("bdto",bdto);
	pageContext.setAttribute("id",id);
	pageContext.setAttribute("pager",request.getParameter("pager"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#pwdMsg {color:red;}
table {border-collapse: collapse;}
td {
	padding:10px;
	}
input[type=text]{
width:350px;
}
input[type=password]{
width:250px;
}
#btn{
text-align:center;
}
input[type=submit]{
background:white;
height:30px;
margin-right:10px;
border:1px solid #A9A9A9;
font-size:15px;
}
a{
text-decoration: none;
color:black;
}
</style>
<script>
	function chkData(){
		if(!chkNull(document.frm.title.value,"제목을")){
			return false;
		}
		if(!chkNull(document.frm.name.value,"이름을")){
			return false;
		}
		if(!chkNull(document.frm.pwd.value,"비밀번호를")){
			return false;
		}
		if(!chkNull(document.frm.content.value,"내용을")){
			return false;
		}
		return true;
	}
	//공백확인 함수
	function chkNull(value,chk){
		if(value==""){
			alert(chk+" 입력하세요.");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<form name="frm" method="post" action="update_ok.jsp" onsubmit="return chkData();">
	<input type="hidden" name="pager" value="${pager }">
	<input type="hidden" name="id" value="${id }">
	<input type="hidden" name="lastChk" value="<%=request.getParameter("lastChk")%>">
	<table align="center" width="600">
		<caption> <h3> 글 수 정 </h3></caption>
		<colgroup>
		<col style="width:40%">
		<col style="width:20%">
		</colgroup>
		<tr>
			<td> 제목 </td>
			<td colspan="2"> <input type="text" name="title" value="${bdto.title }"> </td>
		</tr>
		<tr>
			<td> 이름 </td>
			<td> <input type="text" name="name" autocomplete="off"  value="${bdto.name}"> </td>
		</tr>
		<tr>
			<td> 비밀번호 </td>
			<td> <input type="password" name="pwd" autocomplete="off">
			<%
				if(request.getParameter("chk")!=null){
			%>
			<div id="pwdMsg"> 비밀번호가 틀립니다. </div>
			<%
			}
			%>
			</td>
		</tr>
		<tr>
			<td> 내용 </td>
			<td> <textarea cols="50" rows="4" name="content" autocomplete="off">${bdto.content}</textarea> </td>
		</tr>
		<tr>
			<td colspan="2" id="btn"> <input type="submit" value="수정하기"> </td>
		</tr>
	</table>
</form>
</body>
</html>