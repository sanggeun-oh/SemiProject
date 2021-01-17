<%@page import="data.dao.ShareBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String num=request.getParameter("num");
   ShareBoardDao dao = new ShareBoardDao();
   dao.updateLikes(num);
   
%>