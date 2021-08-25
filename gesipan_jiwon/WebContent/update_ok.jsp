<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%	
	//하나의 레코드를 가지고와서 폼태그에 전달
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/pkc";
	String userid="root";
	String pw="1234";
	Connection conn=DriverManager.getConnection(db,userid,pw);
	
	//request
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String sung = request.getParameter("sung");
	String content = request.getParameter("content");
	
	//쿼리생성
	String sql="update board2 set title=?,name=?,birth=?,sung=?,content=? where id=?";
	
	//심부름꾼
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt= conn.prepareStatement(sql);
	pstmt.setString(1,title);
	pstmt.setString(2,name);
	pstmt.setString(3,birth);
	pstmt.setString(4,sung);
	pstmt.setString(5,content);
	pstmt.setString(6,id);
	
	//쿼리실행
	pstmt.executeUpdate();
	//이동
	response.sendRedirect("content.jsp?id="+id);
%>
