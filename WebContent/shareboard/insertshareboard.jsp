<%@page import="data.dto.WishlistDto"%>
<%@page import="data.dao.WishlistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String num=request.getParameter("num");
   String wishday=request.getParameter("wishday");
   String myid=request.getParameter("myid");
   WishlistDto dto= new WishlistDto();
   dto.setMemId(myid);
   dto.setShareNum(num);
   dto.setWishday(wishday);
   WishlistDao dao = new WishlistDao();
   dao.insertShare(dto);
%>