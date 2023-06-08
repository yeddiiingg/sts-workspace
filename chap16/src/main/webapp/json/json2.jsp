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
		let str = '{"age":[5,7,7]}'; // 배열 선언
		let info = JSON.parse(str); // json형식으로 str 형변환
		let output = "회원 나이<br>";
		for (let i in info.age){
			output += info.age[i]+"<br>";
		}
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