<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
   <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <h1>글 작성</h1>

    <form action="${contextPath }/board/addBoard.do" method="post">
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" required><br><br>

        <label for="content">내용:</label>
        <textarea id="content" name="content" rows="4" cols="50" required></textarea><br><br>

        <input type="submit" value="글쓰기">
        <a href="#">목록보기</a>	
    </form>
    
</body>
</html>