<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	//파라미터 값이 전달된다. 미리 준비 필요
	request.setCharacterEncoding("utf-8");
	String v = request.getParameter("v");
%>
<div class="s<%=v%>">
	<%=v%>
	<button type="button" onclick="closed()">닫기</button>
</div>
