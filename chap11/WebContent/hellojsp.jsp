<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%!
	String name = "귀요미"; // 변수 선언
	public String getName(){ return name;} //getter(접근자) 생성
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>첫 JSP</title>
</head>
<body>
	<h2>힝 드디어 JSP 힝!!!!</h2>
	<img src="images/sad.jpg">
	<h3><%=name %> 울음보</h3>

</body>
</html>