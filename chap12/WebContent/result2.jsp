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
		
		if(user_id == null || user_id.length() == 0){
	%>
	<h1>���̵� �Է����ּ���</h1>
	<a href="/chap12/login.html">�α��� ȭ������ �̵�</a>
	<%			
		}else{
			if(user_id.equals("admin")&&user_id.equals("admin")){
	%>
		<h1>������ ���� �Ϸ�</h1>
	<% 		}else{
	%>
		<h1>ȯ���մϴ�! </h1>
		<h1>���̵� : <%=user_id %></h1>
		<h1>��й�ȣ : <%=user_pw %></h1>
	<%	
		}
	} 
	%>
	
</body>
</html>