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
	
	//request값가져오기
	String anju=request.getParameter("anju");	//0,1,2,3,4,5,6이라는 값중에 하나가 넘어온다

	//쿼리작성 (0~6까지의 값에 따라 쿼리문이 달라짐)
	String sql = "update vote set "+anju+"="+anju+"+1 where id = 1";
	/* out.print(sql); */
	
	//심부름꾼
	Statement stmt = conn.createStatement();
	//쿼리실행
	stmt.executeUpdate(sql);
	//이동=> 결과보기
	response.sendRedirect("vote_view.jsp");
%>