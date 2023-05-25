<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>에러 발생 !!</title>
</head>
<style>
body{
background-color: green;
}
</style>
<body>
	<h1><%= exception.toString() %></h1>
	<h1><%= exception.getMessage() %></h1>
	<img alt="error" src="/chap12/images/error.jpg">
	
	<h2>숫자만 입력해 주세요 다시 시도 ㄱㄱ</h2>
	<a href="Add.html">다시 입력</a>
</body>
</html>