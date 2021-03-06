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
   
    // request되는 값을 가져오기
    request.setCharacterEncoding("utf-8");
    String title=request.getParameter("title").trim();
    String name=request.getParameter("name").trim();
    String content=request.getParameter("content").trim();
    String pwd=request.getParameter("pwd").trim();
    String grp = request.getParameter("grp");
    int seq = Integer.parseInt(request.getParameter("seq"));
    int depth = Integer.parseInt(request.getParameter("depth"));
    
    // 답글이므로 부모글의 seq, depth를 1씩증가
    seq++;
    depth++;
   //기존의 현재 들어갈 레코드의 seq보다 같거나 큰값들은 1씩 증가
   	String sql2 = "update qna set seq=seq+1 where seq>="+seq+" and grp="+grp;
   	Statement stmt = conn.createStatement();
   	stmt.executeUpdate(sql2);
    
    // 질문글 저장하기 위한 쿼리
    String sql="insert into qna(title,name,content,pwd,grp,seq,depth,writeday)";
    sql=sql+" values(?,?,?,?,?,?,?,now())";
    
    // 심부름꾼
    PreparedStatement pstmt=conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, name);
    pstmt.setString(3, content);
    pstmt.setString(4, pwd);
    pstmt.setString(5, grp);
    pstmt.setInt(6,seq);
    pstmt.setInt(7,depth);
    
    
    // 쿼리 실행
    pstmt.executeUpdate();
    
    // 이동 => list
    response.sendRedirect("list.jsp");
    
    conn.close();
%>














