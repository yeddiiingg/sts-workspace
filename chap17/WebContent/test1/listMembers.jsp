<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<%     
request.setCharacterEncoding("UTF-8");
%> 

<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���� ��� â</title>
<style type="text/css">
.cls1{
font-size: 40px;
text-align: center;
}
.cls2{
font-size: 20px;
text-align: center;
}
</style>
</head>
<body>
	<p class="cls1">ȸ������</p>
	<table align="center" border="1">
		<tr align="center" bgcolor="skyblue">
			<th width="10%">���̵�</th>
			<th width="10%">��й�ȣ</th>
			<th width="10%">�̸�</th>
			<th width="10%">�̸���</th> 
			<th width="*">������</th> 
		</tr>
		<c:choose>
			<c:when test="${empty membersList}">
			<tr>
				<td colspan="5" align="center">
					<b>��ϵ� ȸ���� �����ϴ�.</b> 
				</td>
			</tr>
			</c:when>
			<c:when test="${!empty membersList}">
				<c:forEach var="mem" items="${membersList}">
					<tr align="center">
						<td>${mem.id}</td> 
						<td>${mem.pwd}</td> 
						<td>${mem.name}</td> 
						<td>${mem.email}</td> 
						<td>${mem.joinDate}</td> 
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<a href="#"><p class="cls2">ȸ�� �����ϱ�</p></a>
</body>
</html>