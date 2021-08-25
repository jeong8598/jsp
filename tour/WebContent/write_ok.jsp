<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>	<!-- 동일한 파일이름이 있을 때 파일이름을 자동변경  -->
<%@page import="com.oreilly.servlet.MultipartRequest"%>	<!-- 파일업로드와 관련된 클래스 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	//cos.jar 라이브러리를 통해 파일을 업로드 (cos ==> com.oreilly.servlet)
	//이미지파일 저장할 폴더 생성 후 path지정 경로는 /로는 한개 \\로는 두개로
	String path = "D:/wk/jsp/tourreview/WebContent/img";
	int size = 1024*1024*10;	//10mb
	String han = "utf-8";
	MultipartRequest multi = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	System.out.println("request getContentType : " + request.getContentType());

	try {
		if (-1 < request.getContentType().indexOf("multipart/form-data")) {
		 	
			multi = new MultipartRequest(request,path,size,han,new DefaultFileRenamePolicy());
			//폼에 입력된 값을 읽어와서 DB에 저장
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
			conn = DriverManager.getConnection(db,userid,pw);
			//쿼리생성
			String sql = "insert into tour(title,name,content,fname,writeday) ";
			sql+=" values (?,?,?,?,now())";
			//심부름꾼 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, name);
			pstmt.setString(3, content);
			pstmt.setString(4, fname);
			//실행
			pstmt.executeUpdate();
			//이동
			response.sendRedirect("list.jsp");
		}
	
	} catch (IOException | SQLException e) {
	    e.printStackTrace();
	}finally{
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
	
%>