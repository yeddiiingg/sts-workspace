<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  
<%     
request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�� ��� â</title>
<style type="text/css">
.cls1{text-decoration: none;}
.cls2{
	text-align: center;
	font-size: 30px;
}
</style>
</head>
<body>
<table align="center" border="1" width="80%">
	<tr height="10" align="center" bgcolor="skyblue">
		<td>�۹�ȣ</td>
		<td>�ۼ���</td>
		<td>����</td>
		<td>�ۼ���</td>
	</tr>
	<c:choose>
		<c:when test="${empty articlesList}" >
			<tr height="10">
				<td colspan="4">
					��ϵ� ���� �����ϴ�.
				</td>
			</tr>
		</c:when>
		<c:when test="${!empty articlesList}" >
			<c:forEach var="article" items="${articlesList}" varStatus="articleNum">
				<tr align="center">
					<td>${articleNum.count}</td>
					<td>${article.id}</td>
					<td>
					<c:choose>
						<c:when test="${article.level >1 }">
							<c:forEach begin="1" end="${article.level}" step="1">
								<span style="padding-left: 20px"></span>
							</c:forEach>
							<span style="font-size: 12px;">[�亯]</span>
								<a class="cls1" href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a>
						</c:when>
						<c:otherwise>
							<a class="cls1" href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a>
						</c:otherwise>
					</c:choose>
					</td>
					<td>${article.writeDate }</td>
				</tr>
			</c:forEach>
		</c:when>
	</c:choose>	
</table>
<a class="cls1" href="${contextPath}/board/articleForm.do"> <p class="cls2"> �۾���</p></a>

</body>
</html>