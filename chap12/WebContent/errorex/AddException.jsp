<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� �߻� !!</title>
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
	
	<h2>���ڸ� �Է��� �ּ��� �ٽ� �õ� ����</h2>
	<a href="Add.html">�ٽ� �Է�</a>
</body>
</html>