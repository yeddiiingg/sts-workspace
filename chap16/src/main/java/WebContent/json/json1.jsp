<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSON test</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

$(function(){
	$("#checkJson").click(function(){
		let str = '{"name" :["������","��¡","�Ϳ��"]}' //�迭����
		let info = JSON.parse(str); // json �������� str ����ȯ
		let output = "ȸ�� �̸�<br>";
		for (let i in info.name){
			output += info.name[i]+"<br>";
		}
		$("#output").html(output);
	});
});

</script>
</head>
<body>
	<a id="checkJson" style="cursor:pointer">���</a>
	<div id="output"></div>

</body>
</html>