<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("EUC-KR");
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
	%>
	
	<h1>아이디 : <%=user_id %></h1>
	<h1>비밀번호 : <%=user_pw %></h1>

</body>
</html>