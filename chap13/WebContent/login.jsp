<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���</title>
<style>
body {
  background-color: #fff9e6;
  font-family: Arial, sans-serif;
}

form {
  background-color: #fffedc;
  padding: 20px;
  border-radius: 5px;
  width: 300px;
  margin: 0 auto;
}

h1 {
  color: #ffcc00;
  text-align: center;
}

input[type="text"],
input[type="password"] {
  padding: 10px;
  font-size: 16px;
  border: none;
  border-radius: 3px;
  margin: 0 auto;
  display: block;
  width: 100%;
}

input[type="submit"],
input[type="reset"] {
  padding: 10px 20px;
  font-size: 16px;
  background-color: #ffcc00;
  color: white;
  border: none;
  border-radius: 3px;
  cursor: pointer;
  width: 100%;
  margin-bottom: 10px;
}

input[type="submit"]:hover,
input[type="reset"]:hover {
  background-color: #ffbf00;
}
</style>
</head>
<body>
<%
String msg = request.getParameter("msg");
if(msg != null){
%>
	<h1><%=msg %></h1>
	
<%
}
%>
	<form action="result.jsp" method="post">
	<h1>Login</h1>
	  ���̵�: <input type="text" name="u_id"><br>
	  ��й�ȣ: <input type="password" name="u_pw"><br>
	  <input type="submit" value="�α���"><br>
	  <input type="reset" value="�ٽ� �Է�">
	</form>
</body>
</html>
