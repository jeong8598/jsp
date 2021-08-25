<%@page import="sungjuk.Sung"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>   
<%@page import="sungjuk.Sung" %>   
<%
    // DB 연결
    Class.forName("com.mysql.jdbc.Driver");
    String db="jdbc:mysql://localhost:3306/pkc";
    String userid="root";
    String pw="1234";
    Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번
    
    // 성적을 구할사람의 id값 
    String id=request.getParameter("id");
    
    // 쿼리
    String sql="select * from sungjuk where id="+id;
    // 심부름군
    Statement stmt=conn.createStatement();
    // 쿼리 실행 => ResultSet
    ResultSet rs=stmt.executeQuery(sql);
    rs.next();
   
 %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <table width="300" align="center">
     <caption> <h3> <%=rs.getString("name")%>의 성적</h3></caption>
     <tr>
       <td> 국어 </td>
       <td> <%=Sung.sungjuk(rs.getInt("kor"))%> </td>
     </tr>
     <tr>
       <td> 영어 </td>
       <td> <%=Sung.sungjuk(rs.getInt("eng"))%> </td>
     </tr>
     <tr>
       <td> 수학 </td>
       <td> <%=Sung.sungjuk(rs.getInt("mat"))%> </td>
     </tr>
     <tr>
       <td> 과학 </td>
       <td> <%=Sung.sungjuk(rs.getInt("sci"))%> </td>
     </tr>
   </table>
</body>
</html>