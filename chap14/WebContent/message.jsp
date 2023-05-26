<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isELIgnored="false"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>다국어 기능</title>
</head>
<body>
	<fmt:setLocale value="en_US"/> <%--지역을 미국으로 설정 /ko-KR로 들어가면 한국어로 설정--%>
	
	<fmt:bundle basename="resource.member">
	이름 <fmt:message key="mem.name"></fmt:message>
	주소 <fmt:message key="mem.address"></fmt:message>
	직업 <fmt:message key="mem.job"></fmt:message>
	</fmt:bundle>

</body>
</html>