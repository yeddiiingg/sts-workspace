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
    <h1>�� �ۼ�</h1>

    <form action="${contextPath }/board/addBoard.do" method="post">
        <label for="title">����:</label>
        <input type="text" id="title" name="title" required><br><br>

        <label for="content">����:</label>
        <textarea id="content" name="content" rows="4" cols="50" required></textarea><br><br>

        <input type="submit" value="�۾���">
        <a href="#">��Ϻ���</a>	
    </form>
    
</body>
</html>