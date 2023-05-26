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
		<h1>아이디를 입력해 주세요</h1>
		<a href="login.jsp">뒤로가기</a>
	</c:if>
	<c:if test="${not empty param.u_id }">
		<c:if test="${param.u_id=='admin' }">
			<h1>관리자 로그인</h1>
		</c:if>
		<c:if test="${not empty param.u_id }">
		<h1><c:out value="${param.u_id }"></c:out>님 환영합니다!</h1>
		</c:if>
	</c:if>
		

</body>
</html>