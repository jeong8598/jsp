<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.DB_Conn" %>
<%@page import="board.dto.BoardDto" %>
<%@page import="java.sql.*"%>
<%
    //DB연결
    DB_Conn db = new DB_Conn();	//생성자만 생성
    
	//request값
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");

	//동작을 하는 DB_Conn 클래스에 있는 메소드에 값을 전달
	//db.connection(title,name,content,pwd);
	
	//request된 값을 클래스에 넣고 클래스를 전달하는 방법(DTO)
	//전달하기 위한 DTO생성
	BoardDto bdto = new BoardDto();
	bdto.setTitle(title);
	bdto.setName(name);
	bdto.setContent(content);
	bdto.setPwd(pwd);
	// 메소드에 전달(insert)
    db.insert(bdto);
	//
	//이동
	response.sendRedirect("list.jsp");
%>