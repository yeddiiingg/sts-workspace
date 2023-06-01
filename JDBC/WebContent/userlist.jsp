<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="com.company.mydb.ConnectionPool" %>
<%@ page import="java.sql.*" %>

<%
Connection con = ConnectionPool.get();
String sql = "SELECT id,name,ts FROM user";
PreparedStatement pstmt = con.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

String str = "<table align=center border=1px solid>";
str += "<tr ><th colspan=3> 회원리스트 </th></tr>";

while(rs.next()){
	
	str += "<tr><td>"+rs.getString("id")+"</td>";
	str += "<td>"+rs.getString("name")+"</td>";
	str += "<td>"+rs.getString("ts")+"</td>";
	str += "</tr>";
}
str+="</table>";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 목록</title>
</head>
<body>
<%
out.print(str);
%>

</body>
</html>