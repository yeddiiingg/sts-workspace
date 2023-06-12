<%@page import="com.mycom.util.FileUtil"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileUtils"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="com.mycom.dao.FeedDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("utf-8");
	String uid = null, ucontent = null, ufname = null;
	byte[] ufile = null;
	
	ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
	List items = sfu.parseRequest(request);
	
	Iterator iter = items.iterator();
	uid = (String)session.getAttribute("id");
	while (iter.hasNext()){
		FileItem item = (FileItem)iter.next();
		String name = item.getFieldName();
		if(item.isFormField()){
			String value = item.getString();
			if(name.equals("content")) ucontent = value;
		}else{
			if(name.equals("image")){
				ufname = item.getName();
				ufile = item.get();
				String root = application.getRealPath(java.io.File.separator);
				FileUtil.saveImage(root, ufname, ufile);
				out.print("이미지 업로드 성공");
			}
		}
	}
	
	FeedDAO dao = new FeedDAO();
	if (dao.insert(uid, ucontent, ufname)){
		response.sendRedirect("main.jsp");
	}else{
		out.print("글 등록중 오류가 발생하였습니다.");
	}
	
%>