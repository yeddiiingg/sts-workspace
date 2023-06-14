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
<meta charset="EUC-KR">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<style type="text/css">
	#tr_btn_modify{
		display: none;
	 }
</style>

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
  
	function fn_enable(obj){
		document.getElementById("i_title").disabled=false;
		document.getElementById("i_content").disabled=false;
		document.getElementById("i_imageFileName").disabled=false;
		document.getElementById("tr_btn_modify").style.display="block";
		document.getElementById("tr_btn").style.display="none";
		
	}
	
	function fn_modify(obj) {
		// get���..
		obj.action="${contextPath}/board/modArticle.do?articleNO=${article.articleNO}";
		obj.submit();
	}
	
	function fn_remove(url,articleNO){
		// post����̶�..! fn_modify()ó�� ����!!
		
		// �� ������..
		var form = document.createElement("form");
		form.setAttribute("method","post");
		form.setAttribute("action",url);
		
		// articleNO ���� input�±� ����
		var articleNOInput = document.createElement("input");
		articleNOInput.setAttribute("type","hidden");
		articleNOInput.setAttribute("name","articleNO");
		articleNOInput.setAttribute("value",articleNO);
		
		// ������ form�� ������ input�±��� articleNOInput�� ���� �߰�
		form.appendChild(articleNOInput);
		
		// �ϼ��� form�� body�±׿� �߰�
		document.body.appendChild(form);
		// -> �������� ����ž�.. �������
		form.submit();
	}

</script>

<title>�� �� ����</title>

</head>
<body>
	<h1 style="text-align: center">���� ����</h1>
	<form name="frmArticle" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th> �� ��ȣ </th>
				<th>
					<input type="text" value="${article.articleNO}" disabled="disabled">
					<input type="hidden" name="articleNO" value="${article.articleNO}"/>
				</th>
			</tr>
			
			<tr>
				<th> �۾��� </th>
				<th>
					<input type="text" value="${article.id}" disabled="disabled">
				</th>
			</tr>
			
			<tr>
				<th> �� ���� </th>
				<th>
					<input id="i_title" type="text" value="${article.title}" name="title" disabled="disabled">
				</th>
			</tr>
			
			<tr>
				<th> �� ���� </th>
				<th>
					<textarea id="i_content" name="content" rows="10" cols="50" disabled="disabled">${article.content}</textarea>
				</th>
			</tr>
			<c:if test="${not empty article.imageFileName && article.imageFileName!='null' }">  
			<tr>
				<th>�̹���</th>
				<td>
				<input type="hidden" name="originalFileName" value="${article.imageFileName }"/>
				<img id="preview" src="${contextPath}/download.do?imageFileName=${article.imageFileName}&articleNO=${article.articleNO }"/>
				</td>
			</tr>
			</c:if>
			
			<tr id="tr_btn_modify">
				<td colspan="2">
					<input type="button" value="����Ȯ��" onclick="fn_modify(frmArticle)"/>
					<input type="button" value="���" onclick="backToList(frmArticle)"/>
				</td>
			</tr>
			<tr>
				<td>
					<input type="file" name="imageFileName" id="i_imageFileName" disabled="disabled" onchange="readURL(this);"/>
				</td>
			</tr>
			<tr id="tr_btn">
				<td></td>
				<td colspan="2">
					<input type="button" value="�����ϱ�" onclick="fn_enable(this.form)"/>
					<input type="button" value="�����ϱ�" onclick="fn_remove('${contextPath}/board/removeArticle.do',${article.articleNO})"/>
					<input type="button" value="��Ϻ���" onclick="backToList(this.form)"/>
					<input type="button" value="��۾���"/>
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>