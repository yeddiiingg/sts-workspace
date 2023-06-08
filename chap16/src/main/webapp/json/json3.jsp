<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSON 테스트</title>
<script src="http://code.jquery.com/jquery-latest.min.js" ></script>
<script type="text/javascript">
$(function() {
	$("#checkJson").click(function() {
		let str = '{"name":"박지성","age":32,"gender":"남자", "nickname":"부자"}'; // 배열 선언
		let info = JSON.parse(str); // json형식으로 str 형변환
		let output = "회원 정보<br>";
		output += "이름: "+info.name+"<br>";
		output += "나이: "+info.age+"<br>";
		output += "성별: "+info.gender+"<br>";
		output += "별명: "+info.nickname+"<br>";
		$("#output").html(output);
		
	});
});
</script>
</head>
<body>
	<a id="checkJson" style="cursor: pointer">출력</a>
	<div id="output"></div>
</body>
</html>