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
		// let url = "${contextPath}";
		
		let str = '{"name" :"������","age":32,"gender":"����","nickname":"����"}';
		$.ajax({
			type:"post",
			async:false,
			url:"http://localhost:8090/chap16/json",
			data:{info:str},
			success : function (data,textStatus) {
			},
			error : function (data,textStatus) {
				alert("error �߻�");
			},
			conplete : function (data,textStatus) {
			}
			
		}); // end ajax
	});
});

</script>
</head>
<body>
	<a id="checkJson" style="cursor:pointer">���</a>
	<div id="output"></div>
</body>
</html>