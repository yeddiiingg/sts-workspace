<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	// 스크립트릿 영역 - 순수 자바코드를 기술 
	request.setCharacterEncoding("utf-8");
	// 클라이언트에서 요청한 data라는 파라미터를 받음.
	String str = request.getParameter("data");
	System.out.println(str);
	String msg = ""; // 응답 문자열 준비
	
	//파라미터값에 따라 문자열 결과 응답
	if(str != null && str.equals("치킨"))
		msg = "치킨 냠냠";
	else if (str != null && str.equals("피자"))
		msg = "피자 냠냠";
	else
		msg = "뭐든 냠냠";
%>
<%=msg%>