<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원 정보 출력 창</title>
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
	<p class="cls1">회원정보</p>
	<table align="center" border="1">
		<tr align="center" bgcolor="pink">
			<th width="10%">id</th>
			<th width="10%">pwd</th>
			<th width="10%">name</th>
			<th width="10%">email</th>
			<th width="*">joinDate</th>
		</tr>
		
		<c:choose>
			<c:when test="${empty membersList}">
			<tr>
				<td colspan="5" align="center">
					<b>등록된 회원이 없습니다</b>
				</td>
			</tr>
			</c:when>
			
			<c:when test="${!empty membersList}">
				<c:forEach var="mem" items="${membersList}">
					<tr align="center">
						<td>${mem.id }</td>
						<td>${mem.pwd }</td>
						<td>${mem.name }</td>
						<td>${mem.email }</td>
						<td>${mem.joinDate }</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<a href="#"><p class="cls2">회원 가입하기</p></a>
	
</body>
</html>