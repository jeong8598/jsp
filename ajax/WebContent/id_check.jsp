<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/pkc";
	String id = "root";
	String pw = "1234";
	Connection conn = DriverManager.getConnection(db,id,pw);
	//request 값 읽기
	String userid = request.getParameter("userid");
	//퀴리생성
	String sql = "select count(*) cnt from member2 where userid='"+userid+"'";
	//심부름꾼 생성
	Statement stmt = conn.createStatement();
	//쿼리실행
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	out.print(rs.getInt("cnt"));	//1,0
	//닫기
	rs.close();
	stmt.close();
	conn.close();
%>