<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	String db = "jdbc:mysql://localhost:3306/pkc";
	String userid = "root";
	String pw = "1234";
	Connection conn = DriverManager.getConnection(db,userid,pw);
	//request값 가져오기
	request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String pwd = request.getParameter("pwd");
    
    //DB저장된 비밀번호와 입력한 비밀번호 일치하는지 확인
    //쿼리생성
    String sql = "select pwd from board where id="+id;
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
    rs.next();
    if(pwd.equals(rs.getString("pwd"))){	//일치하면
		//쿼리생성
		sql = "update board set title=?,name=?,content=? where id="+id;
		//심부름꾼생성
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, title);
		pstmt.setString(3, content);
		pstmt.setString(4, id);
		// 쿼리 실행
		pstmt.executeUpdate();
		// 이동
		response.sendRedirect("content.jsp?id="+id);
    }else{	//일치하지않으면 수정폼으로 다시 돌아감
		response.sendRedirect("update.jsp?id="+id+"&chk=1");
    }
%>