<%@page import="paging.dto.BoardDTO"%>
<%@page import="paging.DB_Conn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DB_Conn db = new DB_Conn();
	//인코딩
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	int cnt = db.chk_pwd(id, pwd);
	if(cnt==0){
		response.sendRedirect("update.jsp?id="+id+"&chk=1&pager="+request.getParameter("pager")+"&lastChk="+request.getParameter("lastChk"));
	}else{
%>
	<jsp:useBean id="bdto" class="paging.dto.BoardDTO">
		<jsp:setProperty name="bdto" property="*"/>
	</jsp:useBean>
<%	
	db.update_ok(bdto);
	response.sendRedirect("content.jsp?id="+id+"&pager="+request.getParameter("pager")+"&lastChk="+request.getParameter("lastChk"));
	}
%>