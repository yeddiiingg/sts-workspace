<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ٱ��� ���</title>
</head>
<body>
	<fmt:setLocale value="en_US"/> <%--������ �̱����� ���� /ko-KR�� ���� �ѱ���� ����--%>
	
	<fmt:bundle basename="resource.member">
	�̸� <fmt:message key="mem.name"></fmt:message>
	�ּ� <fmt:message key="mem.address"></fmt:message>
	���� <fmt:message key="mem.job"></fmt:message>
	</fmt:bundle>

</body>
</html>