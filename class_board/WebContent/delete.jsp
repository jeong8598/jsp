<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.DB_Conn" %>
<%
	//request
	String id = request.getParameter("id");
	
	DB_Conn db = new DB_Conn();
	db.delete(id);
	response.sendRedirect("list.jsp");
%>