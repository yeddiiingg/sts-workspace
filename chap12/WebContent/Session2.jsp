<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
    //session ��ü�� name Ű�� ���ε��� value���� ������´�. -> lee
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
    �̸��� <%=name %>�Դϴ�.<br/>
    ���̴� <%=age %>�Դϴ�.<br/>
</body>
</html>