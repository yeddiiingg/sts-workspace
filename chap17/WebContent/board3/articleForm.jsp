<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  
<%     
request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
%> 


<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   function readURL(input) {
      if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        $('#preview').attr('src', e.target.result);
          }
         reader.readAsDataURL(input.files[0]);
      }
  }  
  function backToList(obj){
    obj.action="${contextPath}/board/listArticles.do";
    obj.submit();
  }

</script>
<title>�۾��� â</title>

<style>
  body {
    background-color: #E2F1F8;
    font-family: Arial, sans-serif;
  }
  
  h1 {
    text-align: center;
    color: #1565C0;
    margin-top: 30px;
  }
  
  table {
    margin: 30px auto;
  }
  
  th {
    text-align: right;
    padding: 10px;
    color: #0D47A1;
  }
  
  input[type="text"],
  textarea {
    width: 400px;
    padding: 5px;
  }
  
  input[type="submit"],
  input[type="button"] {
    margin-top: 20px;
    padding: 10px 20px;
    background-color: #BBDEFB; /* �Ľ��� �Ķ��� �迭 */
    color: #FFF;
    border: none;
    cursor: pointer;
  }
  
  input[type="submit"]:hover,
  input[type="button"]:hover {
    background-color: #90CAF9; /* �Ľ��� �Ķ��� �迭 (�� ���� ����) */
  }
  
  img {
    max-width: 200px;
    max-height: 200px;
  }
</style>

</head>
<body>
	<h1 style="color: #1976D2;">���� �ۼ�</h1>
	<form name="articleForm" method="post" action="${contextPath}/board/addArticle.do" enctype="multipart/form-data">
		<table>
			<tr>
				<th>�� ����</th>
				<th colspan="2"><input type="text" maxlength="100" name="title"/></th>
			</tr>
			<tr>
				<th>�� ����</th>
				<th colspan="2"><textarea name="content" rows="10" cols="50" maxlength="1000"></textarea></th>
			</tr>
			<tr>
				<th>�̹��� ���� ÷��:</th>
				<th><input type="file" name="imageFileName" onchange="readURL(this);"/></th>
				<td><img src="#" width="200" height="200" id="preview"></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2">
					<input type="submit" value="�۾���"/>
					<input type="button" value="��Ϻ���" onclick="backToList(this.form)"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
