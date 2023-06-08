<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js" ></script>

<script type="text/javascript">
/*이곳은 
 *제이쿼리로 코드를 작성할  
 *자바스크립트 구역*/
 $(document).ready(function(){
	 alert($("#pp").html());//태그가 가진 값(value)을 가지고 오도록 하는 메서드
 });
 
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="class1">Hi</div>
	<div id="uni1">제이쿼리!!</div>
	
	<div id="uni2">
		<p id ="pp" >재밌는 제이쿼리 :)</p>
	</div>
	
	<button id="btn">클릭</button>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#btn").click(function(){
				alert("클릭클릭!!!");
			});
		});
	</script>
	
</body>
</html>