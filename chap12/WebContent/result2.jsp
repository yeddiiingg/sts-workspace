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
	<h1>아이디 입력해주세요</h1>
	<a href="/chap12/login.html">로그인 화면으로 이동</a>
	<%			
		}else{
			if(user_id.equals("admin")&&user_id.equals("admin")){
	%>
		<h1>관리자 접속 완료</h1>
	<% 		}else{
	%>
		<h1>환영합니다! </h1>
		<h1>아이디 : <%=user_id %></h1>
		<h1>비밀번호 : <%=user_pw %></h1>
	<%	
		}
	} 
	%>
	
</body>
</html>