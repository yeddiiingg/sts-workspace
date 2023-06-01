<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body {
  background-color: #b2d8e6;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.container {
  text-align: center;
  background-color: #f7f3e9;
  padding: 20px;
  border-radius: 8px;
  width: 300px;
}

.form-group {
  margin-bottom: 20px;
}

.input-field {
  padding: 10px;
  border-radius: 4px;
  border: none;
}

.button {
  display: inline-block;
  border-radius: 4px;
  background-color: #fbd2dc;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 20px;
  padding: 10px 20px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button:hover {
  background-color: #f99fb9;
}

.reset-button {
  background-color: #d3e2f0;
}

.reset-button:hover {
  background-color: #a1c4e8;
}
</style>
</head>
<body>
  <div class="container">
  <h2>회원가입</h2>
    <form method="post" action="control/joins.jsp">
      <div class="form-group">
        <input name="join_id" type="text" class="input-field" placeholder="아이디">
      </div>
      <div class="form-group">
        <input name="join_pw1" type="password" class="input-field" placeholder="비밀번호">
      </div>
      <div class="form-group">
        <input name="join_pw2" type="password" class="input-field" placeholder="비밀번호 확인">
      </div>
      <div class="form-group">
        <input name="join_name" type="text" class="input-field" placeholder="이름">
      </div>
      <div class="form-group">
        <button type="submit" class="button">회원가입</button>
        <button type="reset" class="button reset-button">리셋</button>
      </div>
    </form>
  </div>
</body>
</html>
