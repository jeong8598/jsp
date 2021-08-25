<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="java.io.IOException"%>
<%
	String path = "D:/wk/jsp/tourreview/WebContent/img";
	int size = 1024*1024*10;	//10mb
	String han = "utf-8";
	MultipartRequest multi = null;
	System.out.println("request getContentType : " + request.getContentType());

	try {
		if (-1 < request.getContentType().indexOf("multipart/form-data")) {
		 
			multi = new MultipartRequest(request,path,size,han,new DefaultFileRenamePolicy());
			//폼에 입력된 값을 읽어와서 DB에 저장
			String id = multi.getParameter("id");
			String title = multi.getParameter("title");
			String name = multi.getParameter("name");
			String content = multi.getParameter("content");
			String fname = multi.getFilesystemName("fname");//서버에 저장되어있는 이름
			//multi.getOriginalFileName("fname");	//클라이언트에 있던 원래 이름
			/* 	File file = multi.getFile("fname");
			long fsize = file.length();	//파일크기 */
		
			//DB연결
			Class.forName("com.mysql.jdbc.Driver");
			String db = "jdbc:mysql://localhost:3306/pkc";
			String userid = "root";
			String pw = "1234";
			Connection conn = DriverManager.getConnection(db,userid,pw);
			//쿼리생성
			String sql = "update set tour title=?,name=?,content=?,fname=? where id=?";
			//심부름꾼 생성
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, name);
			pstmt.setString(3, content);
			pstmt.setString(4, fname);
			//실행
			pstmt.executeUpdate();
			//이동
			response.sendRedirect("content.jsp?id="+id);
		}
	
	} catch (IOException | SQLException e) {
	    e.printStackTrace();
	}
	
%>