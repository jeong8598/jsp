<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	pageContext.setAttribute("kor",99);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body><!-- out.jsp -->
<!-- core태그에서 값을 출력하기 설정하기 -->
	국어 : ${kor }<p>
	영어 : ${eng }<p>
	
국어 : <c:out value="${kor }" default="점수없음"/><p>
영어 : <c:out value="${eng }" default="점수없음"/><p>

<c:set var="country" value="'<b>Korea&&</b>'" scope="request" />
<c:set var="intArray" value="<%=new int[] {1,2,3,4,5} %>" />
<p>escapeXml="true" :<c:out value="${country}" default="Korea" /></p>
<p>escapeXml="false" : <c:out value="${country}" default="Korea" escapeXml="false" /></p>

<pre><!-- pre ==> Preformatted Text -->
escapeXml을 설정하지 않거나, true로 설정할 경우, 
출력 문자열에 포함된 HTML 특수 문자(예: <, >, &, ' 또는 ")는
해당되는 문자 엔티티 코드(&lt;, &gt; 등)로 변환되고,
JSP 페이지에서 생성된 HTML 페이지에 적절히 표시됩니다.
표현하고 싶은 특수문자 그대로 사용하고자 할때는 escapeXml속성을 false로 설정

c:out 태그안에 내용을 넣어주면 다 문자열이 됩니다
컨트롤러에서 alert()이라는 문자열이 어떤 키 안에 특정값으로 들어갔다고 하면 이상태에서 c:out을쓰지 않으면 alert창이 웹상에서 떠 버립니다
c:out>"alert()"/c:out> 이렇게 c:out을 써주면 alert()라는 문자열로만 보여집니다 alert창이 따로 뜨질 않는거죠
보안에도 관련이 있는데 alert()이 아닌 악성코드라고 한다면 감염이 될 것입니다 
그것을 String으로 받아버리면 alert()이 아니라 c:out이 문자열로 받아버리니까 감염 될 일이 없고요 그래서 무조건 c:out으로 문자열로 만들어 주는게 중요합니다
</pre>
<p>${country}</p><p>${intArray[0]}</p>


</body>
</html>