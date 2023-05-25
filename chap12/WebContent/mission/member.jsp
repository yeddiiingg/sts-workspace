<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@page import="sec02.ex01.MemberDAO"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.SingleMemberAnnotation"%>
<%@page import="sec02.ex01.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ include file = "search.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보 출력창</title>
<style>
body {
	background-color: #ffe6ea;
}

h1 {
	color: #ff8ac6;
}

table {
	background-color: #fff2f5;
	border-collapse: collapse;
	width: 800px;
	margin: 50px auto; /* Increased top margin */
}

th {
	background-color: #ffd6e3;
	color: #ff4d8f;
	padding: 10px;
}

td {
	padding: 10px;
}


</style>
</head>
<body>
	<h1 align="center">회원 정보</h1>
	<%
	request.setCharacterEncoding("EUC-KR");
	String _name = request.getParameter("name");

	MemberVO memberVO = new MemberVO();
	memberVO.setName(_name);
	MemberDAO dao = new MemberDAO();
	List membersList = dao.listMembers(memberVO);
	%>
	
	<table border="1" align="center">
		<tr align="center">
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>가입일자</th>
		</tr>

		<%
		for (int i = 0; i < membersList.size(); i++) {
			MemberVO vo = (MemberVO) membersList.get(i);
			String id = vo.getId();
			String pwd = vo.getPwd();
			String name = vo.getName();
			String email = vo.getEmail();
			Date joinDate = vo.getJoinDate();
		%>
		<tr>
			<td><%=id%></td>
			<td><%=pwd%></td>
			<td><%=name%></td>
			<td><%=email%></td>
			<td><%=joinDate%></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>