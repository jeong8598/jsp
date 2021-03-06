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
   
    // limit에 들어갈 index번호 생성
    int index;  // limit에 전달할 index값
    int pager;  // 현재 나타내고자 하는 페이지 값을 저장
    if(request.getParameter("pager")==null)
    {
    	pager=1;
    }
    else
    {
    	pager=Integer.parseInt(request.getParameter("pager"));
    }
    // index 만들기
    index=(pager-1)*10;
    // 쿼리 생성
    String sql="select * from gesipan order by id desc limit "+index+",10";
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
  <style>
    a {
      text-decoration:none;
      color:black;
    }
    a:hover {
      text-decoration:underline;
    }
  </style>
</head>
<body>
   <!-- 레코드 내용 출력 -->
   <table width="600" align="center">
     <tr>
       <td> 이름 </td>
       <td> 제목 </td>
       <td> 성별 </td>
       <td> 작성일 </td>
     </tr>
     <%
      while(rs.next())
      {
    	  // 숫자로 된 성별을 문자로 변환
    	  String sung=null;
    	  switch(rs.getInt("sung"))
    	  {
    	     case 0: sung="남자"; break;
    	     case 1: sung="여자"; break;
    	     case 2: sung="선택안함"; break;
    	  }
     %>
     <tr>
       <td> <%=rs.getString("name")%> </td>
       <td> <a href="content.jsp?id=<%=rs.getInt("id")%>"> <%=rs.getString("title")%> </a> </td>
       <td> <%=sung%> </td>
       <td> <%=rs.getString("writeday")%>  </td>
     </tr>
     <%
      }
     %>
     <tr> <!-- 사용자가 클릭하여 이동할수 있는 페이지 출력 -->
      <td colspan="2" align="center">
       <%
         // 총 페이지값을 구하기     총레코드수/페이지당레코드수
         sql="select count(*) as cnt from gesipan";
         ResultSet rs2=stmt.executeQuery(sql);
         rs2.next();
         int page_cnt=rs2.getInt("cnt")/10+1;
         
         if(rs2.getInt("cnt")%10 == 0) 
             page_cnt--;

         int pstart;
       
         pstart=pager/10; 
         if(pager%10 ==0)
        	 pstart=pstart-1;
         
         pstart=Integer.parseInt(pstart+"1");
         
         int pend=pstart+9;  // 251+9 => 260  총페이지 :254
         
         if(page_cnt < pend)
        	 pend=page_cnt;
%>
        <!-- 이전페이지 -->
        <!-- 현재 페이지 그룹 이전 10페이지 -->
        <%
         if(pstart != 1)//(현재페이지에 출력되는 그룹이 가장 첫번재 그룹이냐 => pstart=1)
         {
        %>
         <a href="list.jsp?pager=<%=pstart-1%>"> ◀◀ </a>
        <% 
         }
         else
         {
        %>
                             ◀◀
       <%
         }
       %>
        <!-- 현재페이지 기준 1페이지 이전 -->
       <%
         if(pager != 1)
         {
       %>  
        <a href="list.jsp?pager=<%=pager-1%>">◀  </a>
       <%
         }
         else
         {
       %>
                      ◀
       <% 
         }
       
         for(int i=pstart;i<=pend;i++)
         {
             String str="";
        	 if(pager == i)
        		 str="style='color:red;'";
       %>
         <a href="list.jsp?pager=<%=i%>" <%=str%>> <%=i%> </a>
       <%
         }
       %>
       <!-- 다음페이지 -->
       <!-- 현재페이지 기준 1페이지 이후 -->
       <%
         if(pager != page_cnt)
         {
       %>
      <a href="list.jsp?pager=<%=pager+1%>"> ▶ </a>
      <%
         }
         else
         {
      %>
                       ▶
      <%
         }
      %>
      <!-- 현재페이지 기준 다음 그룹으로 이동 -->
      <%
       if(page_cnt != pend)
       {
      %>
        <a href="list.jsp?pager=<%=pend+1%>"> ▶▶  </a>
      <%
       }
       else
       {
      %>
                       ▶▶
      <%
       }
      %>
      </td>
     </tr>
     <tr>
      <td colspan="2"> <a href="write.jsp"> 글쓰기 </a> </td>
     </tr>
   </table>
</body>
</html>








