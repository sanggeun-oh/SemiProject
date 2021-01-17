<%@page import="java.io.File"%>
<%@page import="data.dao.ShareBoardDao"%>
<%@page import="data.dto.ShareBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
   String num=request.getParameter("num");
   String num1=request.getParameter("num1");
   //String regroup= request.getParameter("regroup");
   ShareBoardDto dto = new ShareBoardDto();
   //dto.setRegroup(Integer.parseInt(num));
   ShareBoardDao dao = new ShareBoardDao();
   

   String savePath=getServletContext().getRealPath("/shareboardsave");
   String fileName = dao.getData(num).getPhoto();
   File file = new File(savePath+"\\"+fileName);
   file.delete();
  
   
   dao.sharedelete(num,num1);



%>