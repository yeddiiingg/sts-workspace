<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="contextPath" value="${pageContext.request.contextPath }"/>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원 가입 창</title>
</head>
<body>
<form method="post" action="${contextPath }/member/addMember.do">
<h1 style="text-align: center">회원 가입 창</h1>
<table align="center">
	<tr>
		<td width="200" align="right"><p>아이디</p></td>
		<td width="400"><input type="text" name="id"></td>
	</tr>
	<tr>
		<td width="200" align="right"><p>비밀번호</p></td>
		<td width="400"><input type="password" name="pwd"></td>
	</tr>
	<tr>
		<td width="200" align="right"><p>이름</p></td>
		<td width="400"><input type="text" name="name"></td>
	</tr>
	<tr>
		<td width="200" align="right"><p>이메일</p></td>
		<td width="400"><input type="text" name="email"></td>
	</tr>
	<tr>
		<td width="200" align="right"><p>&nbsp;</p></td>
		<td width="400"><input type="submit" value="가입하기">
		<input type="reset" value="다시입력"></td>
	</tr>
</table>

</form>
</body>
</html>