<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js" ></script>

<script type="text/javascript">
/*�̰��� 
 *���������� �ڵ带 �ۼ���  
 *�ڹٽ�ũ��Ʈ ����*/
 $(document).ready(function(){
	 alert($("#pp").html());//�±װ� ���� ��(value)�� ������ ������ �ϴ� �޼���
 });
 
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="class1">Hi</div>
	<div id="uni1">��������!!</div>
	
	<div id="uni2">
		<p id ="pp" >��մ� �������� :)</p>
	</div>
	
	<button id="btn">Ŭ��</button>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#btn").click(function(){
				alert("Ŭ��Ŭ��!!!");
			});
		});
	</script>
	
</body>
</html>