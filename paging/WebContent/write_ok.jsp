<%@page import="paging.DB_Conn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="paging.dto.BoardDTO"%>
<%@ page import="java.sql.*"%>
<%
	//DB연결
	DB_Conn db = new DB_Conn();
	//인코딩
	request.setCharacterEncoding("utf-8");
	//request값
	//BoardDTo bdto
%>
<jsp:useBean id="bdto" class="paging.dto.BoardDTO">
	<jsp:setProperty name="bdto" property="*" />  <!-- 폼태그의 name과  Dto의 필드명은 일치해야 된다. -->
</jsp:useBean>
<%
	//메소드전달
	db.insert(bdto);
	//이동
	response.sendRedirect("list.jsp");
%>
<%-- 
useBean 액션태그는 [ 클래스 빈이름 = new 클래스();] 와 동일한 의미를 갖는다.
 즉, id 속성은 객체명, class 속성명은 클래스(패키지 포함 기술)를 의미하며  import가 포함되어 있다. 
 scope 속성은 유효범위를 의미하며 page(생성된 페이지 내), request(요청된 페이지 내), session(웹브라우저의 생명주기), 
 application(어플리케이션의 생명주기)을 작성할 수 있으며, 기본값은 page이다.

setProperty 액션태그는 자바빈 파일의 setter 메서드를 사용하기 위해, 
즉 데이터의 값을 설정할 때 사용된다. 형식은 아래와 같다.
<jsp:setProperty name="빈 이름" property="필드명" value="값" />
<jsp:setProperty name="빈 이름" property="*" />

setProperty 액션태그는 setter 메서드와 같은 의미를 갖는다.

useBean 액션태그로 생성한 자바빈 객체에 대해서 프로퍼티(필드)에 값을 설정하는 역할을 한다. 
즉, [빈이름.set필드(값);] 과 같은 의미를 갖는다. 
property 속성에 * 를 사용하면 프로퍼티와 동일한 이름의 파라미터를 이용하여 
setter 메서드를 생성한 모든 프로퍼티(필드)에 대해 값을 설정할 수 있다.

 getProperty 액션태그는 자바빈 파일의 getter 메서드를 사용하기 위해, 
 즉 저장된 데이터의 값을 읽어올 때 사용된다. 
 형식은 아래와 같다.(참고로 getProperty 액션태그는 거의 사용하지 않는다.)
 
<jsp:getProperty name="빈이름" property="필드명" />

 자바빈 파일의 프로퍼티에 저장된 데이터를 읽어올 때 사용된다.
  즉, [빈이름.get필드명();]과 같은 의미를 갖는다.
 --%>