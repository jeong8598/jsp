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
   
   // request값
   request.setCharacterEncoding("utf-8");
   String name=request.getParameter("name");
   String kor=request.getParameter("kor");
   String eng=request.getParameter("eng");
   String mat=request.getParameter("mat");
   String sci=request.getParameter("sci");
    

   // 쿼리 생성
   String sql="insert into sungjuk(name,kor,eng,mat,sci,writeday)";
   sql=sql+" values(?,?,?,?,?,now())";
   // 심부름꾼 생성
   PreparedStatement pstmt=conn.prepareStatement(sql);
   pstmt.setString(1, name);
   pstmt.setString(2, kor);
   pstmt.setString(3, eng);
   pstmt.setString(4, mat);
   pstmt.setString(5, sci);
   // 쿼리 실행
   pstmt.executeUpdate();
   // 이동(list.jsp)
   response.sendRedirect("sung_view.jsp");
%>










