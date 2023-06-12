<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  
<%     
request.setCharacterEncoding("UTF-8");
%> 
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보 수정창</title>
</head>
<body>
<form method="post" action="${contextPath}/member/modMember.do">
<h1 style="text-align: center"> 회원 수정창</h1>
<table align="center">
	<tr>
		<td width="200"><p align="right">아이디</p></td>
		<td width="400"><input type="text" name="id" value="${memInfo.id}" disabled="disabled"></td>
	</tr>
	<tr>
		<td width="200"><p align="right">비밀번호</p></td>
		<td width="400"><input type="password" name="pwd" value="${memInfo.pwd}"></td>
	</tr>
	<tr>
		<td width="200"><p align="right">이름</p></td>
		<td width="400"><input type="text" name="name" value="${memInfo.name}"></td>
	</tr>
	<tr>
		<td width="200"><p align="right">이메일</p></td>
		<td width="400"><input type="text" name="email" value="${memInfo.email}"></td>
	</tr>
	<tr>
		<td width="200"><p align="right">가입일</p></td>
		<td width="400"><input type="text" name="joinDate" value="${memInfo.joinDate}" disabled="disabled"></td>
	</tr>
	<tr>
		<td width="200"><p>&nbsp;</p></td>
		<td width="400">
			<input type="submit" value="수정 하기">
			<input type="reset" value="다시 입력">
		</td>
	</tr>
</table>

</form>

</body>
</html>