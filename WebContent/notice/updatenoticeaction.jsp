<%@page import="data.dao.NoticeDao"%>
<%@page import="data.dto.NoticeDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   MultipartRequest multi=null;
   String realFolder=getServletContext().getRealPath("/save");
   int uploadSize=1024*1024*2;
   try{
	   multi=new MultipartRequest(request,realFolder,uploadSize,
			   "utf-8",new DefaultFileRenamePolicy());
	    String id=multi.getParameter("id");
	    String num=multi.getParameter("num");
		String subject=multi.getParameter("subject");
		String content=multi.getParameter("content");
	   //dto선언
       NoticeDto dto=new NoticeDto();
	   dto.setId(id);
	   dto.setNum(num);
   	   dto.setSubject(subject);
   	   dto.setContent(content);
   	
   	   //dao 선언
   	   NoticeDao db=new NoticeDao();
   	   //메서드 호출
   	   db.updateData(dto);
   	   //방명록 페이지로 이동
       String path="../index.jsp?main=notice/noticecontent.jsp?num=" + num + "&pageNum=1";
       response.sendRedirect(path);
   }catch(Exception e){
	   System.out.println("업로드 오류:"+e.getMessage());
   }
   
%> 