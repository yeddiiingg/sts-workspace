<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	//session 객체에 name키로 바인딩 된 value값을 가지고 온다.
	String name = (String)session.getAttribute("name"); 
	
	// session 객체에 age키로 20이라는 value를 바인딩 하고 있다.
	session.setAttribute("age", 20);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	이름은 <%=name %>입니다.<br/>
	<a href='/chap12/Session2.jsp'>두번째 페이지로 이동 </a>
	
</body>
</html>