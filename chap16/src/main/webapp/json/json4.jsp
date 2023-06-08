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
		let str = '{"members":[{"name":"박지성","age":32,"gender":"남자", "nickname":"부자"}'
			+', {"name":"차두리","age":38,"gender":"남자", "nickname":"차미네이터"}]}'; // 배열 선언
		let info = JSON.parse(str); // json형식으로 str 형변환
		let output = "회원 정보<br>";
		for(let i in info.members){
			output += "이름: "+info.members[i].name+"<br>";
			output += "나이: "+info.members[i].age+"<br>";
			output += "성별: "+info.members[i].gender+"<br>";
			output += "별명: "+info.members[i].nickname+"<br>";
			output += "=====================<br>";
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