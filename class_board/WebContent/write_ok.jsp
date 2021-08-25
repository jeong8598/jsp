<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.DB_Conn" %>
<%@page import="board.dto.BoardDto" %>
<%@page import="java.sql.*"%>
<%	//write_ok.jsp

	//DB연결
	DB_Conn db=new DB_Conn();

	//request값
	request.setCharacterEncoding("utf-8");
			//폼의 name값과 DB의 값은
%>
	<jsp:useBean id="bdto" class="board.dto.BoardDto">	<!--  Board bdto-->
		<jsp:setProperty name="bdto" property="*" /> <!-- 폼태그의 name값과 DTO의 필드명은 일치해야 한다 -->
	</jsp:useBean>
<%
	//메소드에 전달(insert)
	db.insert(bdto);
	
	//이동
	response.sendRedirect("list.jsp");
%>