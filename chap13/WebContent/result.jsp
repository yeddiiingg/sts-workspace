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
		dispatch.forward(request, response); 이거 대신 저거 밑에꺼 가능*/
		String msg = "아이디를 입력해주세요";
	%>
		
		<jsp:forward page="login.jsp">
			<jsp:param value="<%=msg %>" name="msg"/>
		</jsp:forward>
	<%
	}
	%>
	<h1> 환영합니다 <%=uu_id %>님!</h1>
</body>
</html>