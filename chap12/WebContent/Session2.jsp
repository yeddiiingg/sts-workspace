<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
    //session 객체에 name 키로 바인딩된 value값을 가지고온다. -> lee
    String name = (String)session.getAttribute("name"); 
    int age =  (int)session.getAttribute("age");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    이름은 <%=name %>입니다.<br/>
    나이는 <%=age %>입니다.<br/>
</body>
</html>