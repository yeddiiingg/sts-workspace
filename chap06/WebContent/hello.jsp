<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>Hello</h2>
	<hr/>
	현재 날짜와 시간은
	<%=LocalDate.now()%>
	입니다.
	

</body>
</html>