<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>      
<%
    // DB 연결
    Class.forName("com.mysql.jdbc.Driver");
    String db="jdbc:mysql://localhost:3306/pkc";
    String userid="root";
    String pw="1234";
    Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번
   
   //request 값
    request.setCharacterEncoding("utf-8");
    String title = request.getParameter("title");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String sung = request.getParameter("sung");
	String content = request.getParameter("content");
	
	//쿼리생성
	String sql = "insert into board2 (title,name,birth,sung,content,writeday) value(?,?,?,?,?,now())";
	//심부름꾼
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, name);
	pstmt.setString(3, birth);
	pstmt.setString(4, sung);
	pstmt.setString(5, content);

	//쿼리실행
	pstmt.executeUpdate();
	//이동
	response.sendRedirect("list.jsp");
	
%>