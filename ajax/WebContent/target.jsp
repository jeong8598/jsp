<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");	//기능은 무조건 메서드 안에 => 생성자로
	String db = "jdbc:mysql://localhost:3306/pkc";
	String userid = "root";
	String pw = "1234";
	Connection conn = DriverManager.getConnection(db,userid,pw);
	
/*     String sql="create table imsi2(id int)";
	
	Statement stmt=conn.createStatement();
	
	stmt.executeUpdate(sql); */
	
	//out.print("1");
	out.print("안녕하세요");
%>