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
		// get방식..
		obj.action="${contextPath}/board/modArticle.do?articleNO=${article.articleNO}";
		obj.submit();
	}
	
	function fn_remove(url,articleNO){
		// post방식이라서..! fn_modify()처럼 안해!!
		
		// 폼 생성중..
		var form = document.createElement("form");
		form.setAttribute("method","post");
		form.setAttribute("action",url);
		
		// articleNO 담을 input태그 생성
		var articleNOInput = document.createElement("input");
		articleNOInput.setAttribute("type","hidden");
		articleNOInput.setAttribute("name","articleNO");
		articleNOInput.setAttribute("value",articleNO);
		
		// 생성된 form에 생성한 input태그인 articleNOInput을 폼에 추가
		form.appendChild(articleNOInput);
		
		// 완성된 form을 body태그에 추가
		document.body.appendChild(form);
		// -> 페이지를 만든거야.. 여기까지
		form.submit();
	}

</script>

<title>상세 글 보기</title>

</head>
<body>
	<h1 style="text-align: center">본문 내용</h1>
	<form name="frmArticle" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th> 글 번호 </th>
				<th>
					<input type="text" value="${article.articleNO}" disabled="disabled">
					<input type="hidden" name="articleNO" value="${article.articleNO}"/>
				</th>
			</tr>
			
			<tr>
				<th> 글쓴이 </th>
				<th>
					<input type="text" value="${article.id}" disabled="disabled">
				</th>
			</tr>
			
			<tr>
				<th> 글 제목 </th>
				<th>
					<input id="i_title" type="text" value="${article.title}" name="title" disabled="disabled">
				</th>
			</tr>
			
			<tr>
				<th> 글 내용 </th>
				<th>
					<textarea id="i_content" name="content" rows="10" cols="50" disabled="disabled">${article.content}</textarea>
				</th>
			</tr>
			<c:if test="${not empty article.imageFileName && article.imageFileName!='null' }">  
			<tr>
				<th>이미지</th>
				<td>
				<input type="hidden" name="originalFileName" value="${article.imageFileName }"/>
				<img id="preview" src="${contextPath}/download.do?imageFileName=${article.imageFileName}&articleNO=${article.articleNO }"/>
				</td>
			</tr>
			</c:if>
			
			<tr id="tr_btn_modify">
				<td colspan="2">
					<input type="button" value="수정확인" onclick="fn_modify(frmArticle)"/>
					<input type="button" value="취소" onclick="backToList(frmArticle)"/>
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
					<input type="button" value="수정하기" onclick="fn_enable(this.form)"/>
					<input type="button" value="삭제하기" onclick="fn_remove('${contextPath}/board/removeArticle.do',${article.articleNO})"/>
					<input type="button" value="목록보기" onclick="backToList(this.form)"/>
					<input type="button" value="답글쓰기"/>
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>