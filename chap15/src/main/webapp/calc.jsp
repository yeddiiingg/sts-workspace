<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8" errorPage="errorpage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<%
	int n1 =0;
	int n2 =0;
	long result = 0;
	String errorMsg = null;
	
	// 전달받은 n1값이 비어있지 않으면서 숫자인지 판별
	if (request.getParameter("n1") != null && request.getParameter("n1").matches("\\d+")){
		n1 = Integer.parseInt(request.getParameter("n1"));
	}else{
		errorMsg = "첫 번째 숫자를 잘못 입력 하셨습니다";
	}
	
	if (request.getParameter("n2") != null && request.getParameter("n2").matches("\\d+")){
		n2 = Integer.parseInt(request.getParameter("n2"));
	}else{
		errorMsg = "두 번째 숫자를 잘못 입력 하셨습니다";
	}
	
	if(errorMsg == null){
		String op = request.getParameter("op");

		
		if(op.equals("+")){
			result = n1 + n2;
		}else if(op.equals("-")){
			result = n1 - n2;
		}else if(op.equals("*")){
			result = n1 * n2;
		}else if(op.equals("/")){
			result = n1 / n2;
		}
	}
%>

<h2>계산 결과</h2>
<%if (errorMsg != null){ %>
	<h2><%=errorMsg %></h2>
<%}else{ %>
	<h2>결과 : <%=result %></h2>
<%} %>
</body>
</html>