<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%
    String[] name={"홍길동","배트맨","슈퍼맨","뽀로로","원더우먼"};
    String[] juso={"서울","인천","대구","광주","부산"};
    int[] age={50,60,35,27,45};
    pageContext.setAttribute("name",name);
    pageContext.setAttribute("juso",juso);
    pageContext.setAttribute("age",age);
 %>
</head>
<body>
    <table width="300" align="center">
      <tr>
        <td> 이름 </td>
        <td> 나이 </td>
        <td> 주소 </td>
      </tr>
      <!-- 1행에 1명의 정보를 출력하시오 => core태그이용 -->
      <c:forEach var="i" begin="0" end="5">
      <tr>
      	<td>${name[i] }</td>
      	<td>${age[i] }</td>
      	<td>${juso[i] }</td>
      </tr>
      </c:forEach>
    </table>
</body>
</html>