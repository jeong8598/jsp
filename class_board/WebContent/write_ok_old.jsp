<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.DB_Conn_old" %> 
<%@page import="java.sql.*" %>  
<%  // write_ok.jsp

  // DB연결
    DB_Conn_old db=new DB_Conn_old();
	Connection conn = db.connection(); // 연결객체는 만들어진다..
     
  // request값
     request.setCharacterEncoding("utf-8");
     String title=request.getParameter("title");
     String name=request.getParameter("name");
     String content=request.getParameter("content");
     String pwd=request.getParameter("pwd");
  // 쿼리생성
     String sql="insert into board(title,name,content,pwd,writeday) ";
     sql=sql+" values(?,?,?,?,now())";
  // 심부름꾼 생성
     PreparedStatement pstmt=conn.prepareStatement(sql);
     pstmt.setString(1, title);
     pstmt.setString(2, name);
     pstmt.setString(3, content);
     pstmt.setString(4, pwd);
  // 쿼리 실행
     pstmt.executeUpdate();
  // 이동
     conn.close(); // 이클립스에서 꼭 해줘야 됩니다.
%>