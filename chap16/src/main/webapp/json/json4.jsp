<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSON �׽�Ʈ</title>
<script src="http://code.jquery.com/jquery-latest.min.js" ></script>
<script type="text/javascript">
$(function() {
	$("#checkJson").click(function() {
		let str = '{"members":[{"name":"������","age":32,"gender":"����", "nickname":"����"}'
			+', {"name":"���θ�","age":38,"gender":"����", "nickname":"���̳�����"}]}'; // �迭 ����
		let info = JSON.parse(str); // json�������� str ����ȯ
		let output = "ȸ�� ����<br>";
		for(let i in info.members){
			output += "�̸�: "+info.members[i].name+"<br>";
			output += "����: "+info.members[i].age+"<br>";
			output += "����: "+info.members[i].gender+"<br>";
			output += "����: "+info.members[i].nickname+"<br>";
			output += "=====================<br>";
		}
		$("#output").html(output);
		
	});
});
</script>
</head>
<body>
	<a id="checkJson" style="cursor: pointer">���</a>
	<div id="output"></div>
</body>
</html>