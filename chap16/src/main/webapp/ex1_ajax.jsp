<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	// ��ũ��Ʈ�� ���� - ���� �ڹ��ڵ带 ��� 
	request.setCharacterEncoding("utf-8");
	// Ŭ���̾�Ʈ���� ��û�� data��� �Ķ���͸� ����.
	String str = request.getParameter("data");
	System.out.println(str);
	String msg = ""; // ���� ���ڿ� �غ�
	
	//�Ķ���Ͱ��� ���� ���ڿ� ��� ����
	if(str != null && str.equals("ġŲ"))
		msg = "ġŲ �ȳ�";
	else if (str != null && str.equals("����"))
		msg = "���� �ȳ�";
	else
		msg = "���� �ȳ�";
%>
<%=msg%>