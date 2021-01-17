<%@page import="data.dao.ShareBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");
	String relevel = request.getParameter("relevel");
	String regroup = request.getParameter("regroup");
	String restep = request.getParameter("restep");
	ShareBoardDao dao = new ShareBoardDao();
	
	dao.deleteReview(num);
	int group = Integer.parseInt(regroup);
	int step = Integer.parseInt(restep);
	int level = Integer.parseInt(relevel);
	while(true){
		
		int rs = dao.isNextStep(group, level, step);
		if(rs != 0){
			dao.deleteReview(String.valueOf(rs));
			step++;
			level++;
		}
		else {
			break;
		}
	}
	
%>