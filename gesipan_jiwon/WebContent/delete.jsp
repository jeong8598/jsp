<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%	
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/pkc";
	String userid="root";
	String pw="1234";
	Connection conn=DriverManager.getConnection(db,userid,pw);
	
	//request값
	String id = request.getParameter("id");

	//쿼리생성
	String sql = "delete from board2 where id="+id;
	
	//심부름꾼 생성
	Statement stmt = conn.createStatement();
	
	//쿼리실행
	stmt.executeUpdate(sql);
	
	//이동
	response.sendRedirect("list.jsp");

	stmt.close();
	conn.close();
%>
