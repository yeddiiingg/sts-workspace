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
<title>ȸ�� ���� â</title>
</head>
<body>
<form method="post" action="${contextPath}/member/addMember.do">
<h1 style="text-align: center"> ȸ�� ���� â</h1>
<table align="center">
	<tr>
		<td width="200"><p align="right">���̵�</p></td>
		<td width="400"><input type="text" name="id"></td>
	</tr>
	<tr>
		<td width="200"><p align="right">��й�ȣ</p></td>
		<td width="400"><input type="password" name="pwd"></td>
	</tr>
	<tr>
		<td width="200"><p align="right">�̸�</p></td>
		<td width="400"><input type="text" name="name"></td>
	</tr>
	<tr>
		<td width="200"><p align="right">�̸���</p></td>
		<td width="400"><input type="text" name="email"></td>
	</tr>
	<tr>
		<td width="200"><p>&nbsp;</p></td>
		<td width="400">
			<input type="submit" value="�����ϱ�">
			<input type="reset" value="�ٽ� �Է�">
		</td>
	</tr>
</table>

</form>

</body>
</html>