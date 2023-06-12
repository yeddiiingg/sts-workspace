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
			<th width="10%">����</th>
			<th width="10%">����</th> 
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
						<td><a href="${contextPath}/member/modMemberForm.do?id=${mem.id}">����</a></td>
						<td><a href="${contextPath}/member/delMember.do?id=${mem.id}">����</a></td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<p>${contextPath}</p>
	<a href="${contextPath}/member/memberForm.do"><p class="cls2">ȸ�� �����ϱ�</p></a>
	
</body>
</html>