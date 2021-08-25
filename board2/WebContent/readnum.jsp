<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/pkc";
	String userid = "root";
	String pwd = "1234";
	Connection conn = DriverManager.getConnection(db,userid,pwd);
	//request값 가져오기
	String id = request.getParameter("id");
	//쿼리생성
	String sql = "update board set readnum=readnum+1 where id="+id;
	//심부름꾼생성
	Statement stmt = conn.createStatement();
	//쿼리실행
	int chk = stmt.executeUpdate(sql);
	//이동
	response.sendRedirect("content.jsp?id="+id);
%>