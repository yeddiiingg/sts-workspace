<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${empty param.u_id }">
		<h1>���̵� �Է��� �ּ���</h1>
		<a href="login.jsp">�ڷΰ���</a>
	</c:if>
	<c:if test="${not empty param.u_id }">
		<c:if test="${param.u_id=='admin' }">
			<h1>������ �α���</h1>
		</c:if>
		<c:if test="${not empty param.u_id }">
		<h1><c:out value="${param.u_id }"></c:out>�� ȯ���մϴ�!</h1>
		</c:if>
	</c:if>
		

</body>
</html>