<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	// �Ķ���� ���� �����̵ȴ�. �̸� �غ� �ʿ�
	request.setCharacterEncoding("utf-8");

	String v = request.getParameter("v");	
%>

<div class="s<%=v%>">
	<%=v%>
	<button type="button" onclick="closed()">�ݱ�</button>
</div>