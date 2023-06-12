<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<%     
request.setCharacterEncoding("UTF-8");
%> 

<html>
<head>
<meta charset="EUC-KR">
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
		<tr align="center" bgcolor="skyblue">
			<th width="10%">아이디</th>
			<th width="10%">비밀번호</th>
			<th width="10%">이름</th>
			<th width="10%">이메일</th> 
			<th width="*">가입일</th> 
		</tr>
		<c:choose>
			<c:when test="${empty membersList}">
			<tr>
				<td colspan="5" align="center">
					<b>등록된 회원이 없습니다.</b> 
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
	<a href="#"><p class="cls2">회원 가입하기</p></a>
</body>
</html>