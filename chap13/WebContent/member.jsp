<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import = "java.util.*, sec01.ex01.*"%>
    
<%
	request.setCharacterEncoding("euc-kr");

	String name = request.getParameter("u_na");
	String pwd = request.getParameter("u_pw");
	// Timestamp join = Timestamp.valueOf(request.getParameter("joinDate"));
	
	MemberBean mb = new MemberBean(name,pwd);
	
	MemberDAO dao = new MemberDAO();
	List memberList = dao.listmembers();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	table {
		border-collapse: collapse;
		width: 100%;
		border: 2px solid #f8a5c2; /* Pink border color */
		margin: 0 auto; /* Center alignment */
	}

	th, td {
		padding: 10px;
		text-align: center;
		border-bottom: 1px solid #f8a5c2; /* Pink border color */
	}

	tr:nth-child(even) {
		background-color: #fce5f0; /* Pastel pink background color */
	}

	h1 {
		text-align: center;
		color: #f8a5c2; /* Pink text color */
		margin-top: 30px;
	}
</style>
</head>
<body>
	<h1>Member List</h1>
	<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>비밀번호</th>
			<th>DATE</th>
		</tr>
		
		<%
		for(int i = 0; i < memberList.size(); i++) {
			MemberBean memberBean = (MemberBean) memberList.get(i);
			Integer num_id = memberBean.getNum_id();
			String _name = memberBean.getName();
			String _pwd = memberBean.getPwd();
			Date joinDate = memberBean.getJoinDate();
		%>
		<tr>
			<td><%= num_id %></td>
			<td><%= _name %></td>
			<td><%= _pwd %></td>
			<td><%= joinDate %></td>
		</tr>
		<% } %>		
	</table>
</body>
</html>
