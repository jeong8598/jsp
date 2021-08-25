<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.DB_Conn" %>
<%@ page import="board.dto.BoardDto" %>
<%
	//DB연결
	DB_Conn db = new DB_Conn();	//생성자 생성
	
	//request
	request.setCharacterEncoding("utf-8");
	int id = Integer.parseInt(request.getParameter("id"));
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//DB_Conn객체생성, update_ok메소드 호출
	//DB_Conn db = new DB_Conn();
	//db.update_ok(name,title,content,id);
	
	//request된 값을 dto에 전달
	BoardDto bdto = new BoardDto();
	bdto.setId(id);
	bdto.setTitle(title);
	bdto.setName(name);
	bdto.setContent(content);
	// 메소드에 전달(update_ok)
    db.update_ok(bdto);
	
	//이동
	response.sendRedirect("content.jsp?id="+id);
%>
