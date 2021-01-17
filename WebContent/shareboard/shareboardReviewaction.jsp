<%@page import="data.dao.ShareBoardDao"%>
<%@page import="data.dto.ShareBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	  request.setCharacterEncoding("utf-8");
      String num=request.getParameter("num");
      String pageNum=request.getParameter("pageNum");
      String content=request.getParameter("content");
  
      System.out.println(num + " " + pageNum + " " + content);
      ShareBoardDao dao = new ShareBoardDao();
      dao.updateShardBoardanswer(content, num);

      response.sendRedirect("../index.jsp?main=shareboard/shareboardlist.jsp?pageNum=" + pageNum);



%>