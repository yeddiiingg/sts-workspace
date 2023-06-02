<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>검색 기능</title>

<style>
body {
  background-color: #ffe6ea;
}

h1 {
  color: #ff8ac6;
  text-align: center;
}

form {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 50px;
}

input[type="text"] {
  padding: 15px;
  font-size: 20px;
  border: none;
  border-radius: 5px;
  outline: none;
  margin-right: 10px;
  text-align: center;
}

input[type="submit"] {
  padding: 10px 20px;
  font-size: 18px;
  background-color: #ffc8d8;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin-right: 5px; /* Increased right margin */
}

</style>

</head>
<body>
  <h1>이름 검색 기능</h1>
    <form method="post" action="member.jsp">
      <input type="text" name="name">
      <input type="submit" value="검색">
      <input type="submit" value="전체보기" style="margin-right: 15px;">
    </form>
</body>
</html>
