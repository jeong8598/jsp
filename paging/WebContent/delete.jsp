<%@page import="paging.DB_Conn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//db연결
	DB_Conn db = new DB_Conn();
	//request값 가져오기
	String id = request.getParameter("id");
	int pager = Integer.parseInt(request.getParameter("pager"));
	//실행
	db.delete_ok(id);
	//이동
	response.sendRedirect("list.jsp?pager="+pager);
	
%>