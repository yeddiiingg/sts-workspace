<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


<script type="text/javascript">

/*이곳은 제이쿼리 코드로 작성할 자바스크립트 구역*/
 
 $(document).ready(function(){
    alert($("#pp").html());
 });

</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <div class= "class1">HI</div>
   <div id="uni1">제이쿼리</div>
   <div id="uni2">
       <p id="pp">제이쿼리 제이쿼리</p>
   </div>
   
   <button id="btn">클릭</button>
   <script type="text/javascript">
   		$(document).ready(function(){
   			$("#btn").click(function(){
   				alert("클릭클릭!!");
   			});
   		});
   
   </script>
</body>
</html>
