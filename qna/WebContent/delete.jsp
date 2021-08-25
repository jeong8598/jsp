<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/pkc";
	String userid = "root";
	String pw = "1234";
	Connection conn = DriverManager.getConnection(db,userid,pw);
	
	//request
	String id = request.getParameter("id");
	
	//쿼리생성
	String sql = "delete from qna where id="+id;
	
	//심부름꾼
	Statement stmt = conn.createStatement();
	//실행
	stmt.executeUpdate(sql);
	
	stmt.close();
	conn.close();
	
	response.sendRedirect("list.jsp");
%>