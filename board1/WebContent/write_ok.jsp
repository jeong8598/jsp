<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
    // DB 연결
    Class.forName("com.mysql.jdbc.Driver");
    String db = "jdbc:mysql://localhost:3306/pkc";
    String userid = "root";
    String pw = "1234";
    Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번
    // 한글처리(request값)
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("name");
    String age = request.getParameter("age");
    String juso = request.getParameter("juso");
    // 쿼리생성
    String sql = "insert into member (name,age,juso) values(?,?,?)";
    //심부름꾼생성
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,name);
    pstmt.setString(2,age);
    pstmt.setString(3,juso);
    //쿼리실행
    int chk = pstmt.executeUpdate();
    // list로 이동
    response.sendRedirect("list.jsp");
%>