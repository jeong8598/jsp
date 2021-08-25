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
 
    // 쿼리 생성
    String sql="select * from sungjuk";
    // 심부름꾼생성
    Statement stmt=conn.createStatement();
    // 쿼리 실행 => ResultSet
    ResultSet rs=stmt.executeQuery(sql);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <!-- 레코드 내용 출력 -->
   <table width="600" align="center">
     <tr>
       <td> 이름 </td>
       <td> 국어 </td>
       <td> 영어 </td>
       <td> 수학 </td>
       <td> 과학 </td>
     </tr>
     <%
      while(rs.next())
      {
 
     %>
     <tr>
       <td> <%=rs.getString("name")%> </td>
       <td> <%=rs.getInt("kor")%> </td>
       <td> <%=rs.getInt("eng")%> </td>
       <td> <%=rs.getInt("mat")%> </td>
       <td> <%=rs.getInt("sci")%> </td>
     </tr>
    <%
      }
    %>
   </table>
</body>
</html>








