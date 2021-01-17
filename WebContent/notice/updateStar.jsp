<%@page import="data.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String num = request.getParameter("num");
	NoticeDao dao = new NoticeDao();
	
	if(dao.getData(num).getStar() == 0){
		dao.updateStar(num, 1);
	}
	else{
		dao.updateStar(num, 0);
	}
%>
