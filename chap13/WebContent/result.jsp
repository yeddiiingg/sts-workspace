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
	String uu_id = request.getParameter("u_id");
	if(uu_id.length()==0 || uu_id==null){
		/* RequestDispatcher dispatch = request.getRequestDispatcher("login.jsp");
		dispatch.forward(request, response); �̰� ��� ���� �ؿ��� ����*/
		String msg = "���̵� �Է����ּ���";
	%>
		
		<jsp:forward page="login.jsp">
			<jsp:param value="<%=msg %>" name="msg"/>
		</jsp:forward>
	<%
	}
	%>
	<h1> ȯ���մϴ� <%=uu_id %>��!</h1>
</body>
</html>