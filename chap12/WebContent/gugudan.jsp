<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ���̺� �Դϴ�</title>
</head>
<body>
	<%
	int dan = Integer.parseInt(request.getParameter("dan"));
		
	%>
	<table border="1px solid" width="200" >
		<tr align="center" ><td colspan="2" style="background-color:pink;" ><%=dan %>�� ���</td></tr>
	<%
		for(int i=1; i<10; i++){
	%>
		<tr align="center"><td width="100"><%=dan %>*<%=i %></td><td><%=dan*i %></td></tr>
	<%}
	%>
	</table>

</body>
</html>