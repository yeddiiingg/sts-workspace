<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  
<%     
request.setCharacterEncoding("utf-8");
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>글 목록 창</title>
<style>
.cls1 {
    text-decoration: none;
    color: #3399CC;
}
.cls2 {
    text-align: center;
    font-size: 30px;
    color: #336699;
}
table {
    border: 1px solid #CCCCCC;
    width: 80%;
    margin: 0 auto;
}
th {
    background-color: #87CEFA;
}
tr:nth-child(odd) {
    background-color: #F0F8FF;
}
tr:nth-child(even) {
    background-color: #F8F8FF;
}
</style>
</head>
<body>
<table align="center">
    <tr align="center" bgcolor="#87CEFA">
        <th>글번호</th>
        <th>작성자</th>
        <th>제목</th>
        <th>작성일</th>
    </tr>
    <c:choose>
        <c:when test="${empty articlesList}">
            <tr>
                <td colspan="4">
                    등록된 글이 없습니다.
                </td>
            </tr>
        </c:when>
        <c:when test="${!empty articlesList}">
            <c:forEach var="article" items="${articlesList}" varStatus="articleNum">
                <tr align="center">
                    <td>${articleNum.count}</td>
                    <td>${article.id}</td>
                    <td>
                        <c:choose>
                            <c:when test="${article.level > 1}">
                                <c:forEach begin="1" end="${article.level}" step="1">
                                    <span style="padding-left:20px"></span>
                                </c:forEach>
                                <span style="font-size: 12px;">[답변]</span>
                                <a class="cls1" href="#">${article.title }</a>
                            </c:when>
                            <c:otherwise>
                                <a class="cls1" href="#">${article.title }</a>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${article.writeDate }</td>
                </tr>
            </c:forEach>
        </c:when>
    </c:choose>
</table>
<a class="cls1" href="${contextPath }/board/articleForm.do"><p class="cls2">글쓰기</p></a>
</body>
</html>
