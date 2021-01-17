<%@page import="data.dto.NoticeDto"%>
<%@page import="data.dao.NoticeDao"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
	#cl-dashboard{display: none;}
	
</style>
</head>
<%
	NoticeDao db=new NoticeDao();
	
	MultipartRequest multi=null;
	String realFolder=getServletContext().getRealPath("/save");
	int uploadSize=1024*1024*2;
	
	//System.out.println(realFolder);
	try{
		multi=new MultipartRequest(request,realFolder,
				uploadSize,"utf-8",new DefaultFileRenamePolicy());
		String id=multi.getParameter("id");
		String subject=multi.getParameter("subject");
		String content=multi.getParameter("content");
		
		NoticeDto dto=new NoticeDto();
		dto.setContent(content);
		dto.setId(id);
		dto.setSubject(subject);
		
		db.insertNotice(dto);
		
		String path="../index.jsp?main=notice/noticecontent.jsp?num=" + db.getMaxNum() + "&pageNum=1";
		response.sendRedirect(path);
	}catch(Exception e){
		out.write("파일 업로드 오류:"+e.getMessage());
	}
%>
<body>

</body>
</html>





