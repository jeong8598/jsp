<%@page import="paging.dto.BoardDTO"%>
<%@page import="paging.DB_Conn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DB_Conn db = new DB_Conn();
	String id = request.getParameter("id");
	int pager = request.getParameter("pager")==null ? 1 : Integer.parseInt(request.getParameter("pager"));
	int lastChk = request.getParameter("lastChk")==null ? 0 : Integer.parseInt(request.getParameter("lastChk"));

	BoardDTO bdto = db.get_content(id);
	
	pageContext.setAttribute("bdto",bdto);
	pageContext.setAttribute("pager",pager);
	pageContext.setAttribute("lastChk",lastChk);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{text-align:center;}
table{border-collapse: collapse;}
td{
border-top: 1px solid #444444;
border-right: 1px solid #444444;
padding:10px;
}
td:last-child {border-right:none;}
tr:first-child td{border-top:none;}
tr:last-child td{text-align:right;}
a{
text-decoration: none;
color:black;
}
</style>
</head>
<body>
<table width="600" align="center">
	<tr>
		<td> 제목 </td>
		<td colspan="6">${bdto.title }</td>
	</tr>
	<tr>
		<td> 이름 </td>
		<td> ${bdto.name } </td>
		<td> 작성일 </td>
		<td> ${bdto.writeday } </td>
		<td> 조회수 </td>
		<td> ${bdto.readnum } </td>
	</tr>
	<tr>
		<td> 내용 </td>
		<td colspan="6"> ${bdto.content } </td>
	</tr>
	<tr>
		<td colspan="6">
			<a href="update.jsp?id=${bdto.id }&pager=${pager}&lastChk=${lastChk}"> 수정 </a> 
			<c:if test="${lastChk==1 }">
			<a href="delete.jsp?id=${bdto.id }&pager=${pager-1}"> 삭제 </a> 
			</c:if>
			<c:if test="${lastChk!=1 }">
			<a href="delete.jsp?id=${bdto.id }&pager=${pager}"> 삭제 </a> 
			</c:if>
			<a href="list.jsp?pager=${pager}"> 목록 </a> 
       </td>
	</tr>
</table>
</body>
</html>