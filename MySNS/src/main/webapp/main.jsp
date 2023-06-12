<%@page import="com.mycom.dao.FeedDAO"%>
<%@page import="com.mycom.dao.FeedVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String uid = (String)session.getAttribute("id");
	if (uid == null){
		response.sendRedirect("login.html");
		return;
	}
	request.setCharacterEncoding("utf-8");
	response.setContentType("utf-8");
	
	session.setAttribute("id", uid);
	
	// 글쓰기, 등록된 글의 정보가 보여야한다.
	ArrayList<FeedVO> feeds = (new FeedDAO()).getList();
	String str = "<table align=center>";
	str += "<tr height=40><th>작성글 리스트</th>";
	str += "<td align=right>";
	str += "<a href='feedAdd.html'><button>글쓰기</button></a>";
	str += "</td></tr>";
	
	for (FeedVO feed : feeds){
        String img = feed.getImages(), imgstr = "";
        if (img != null) {
            imgstr = "<img src='images/" + img + "' width=240>";
        }
		str += "<tr><td colspan=2><hr></td></tr>";
		str += "<tr>";
		str += "<td>"+feed.getId()+"</td>";
		str += "</tr>";
		str += "<tr>";
		str += "<tr><td colspan=2>" + imgstr + "</td></tr>";
		str += "<td>"+feed.getContent()+"</td>";
		str += "</tr>";
		str += "<tr>";
		str += "<td>"+feed.getTs()+"</td>";
		str += "</tr>";	
	}
	str += "</table>";
	out.print(str);
%>
