<%@page import="data.dao.ShareBoardDao"%>
<%@page import="data.dto.ShareBoardDto"%>
<%@page import="java.io.File"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="font/SCDream5.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="image/favicon.ico">
<meta charset="UTF-8">
<title>멘도롱 소랑 :: 제주여행의모든것</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
   #cl-dashboard{display: none;}
   
  .contentform{
      position: absolute;
      left: 250px;
   }
   
</style>
</head>
<body>
<%
   String num=request.getParameter("num");   
   String pageNum=request.getParameter("pageNum");
   String key=request.getParameter("key");
   
   //key 값이 널값이 아니면서 'list' 일경우 
   //(이유:수정후에도 content.jsp 로 오기때문에 목록에서
    //         올 경우에만 증가함)
   //조회수 증가
   ShareBoardDao db=new ShareBoardDao();
   
   //번호에 해당하는 dto 가져오기
   ShareBoardDto dto=db.getData(num);
   
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd ");
%>   
<table class="contentform table table-striped" style="width: 800px;">
   <tr>
      <td width="350">
         <b>제목: <%=dto.getSubject()%></b>
      </td>
      <td>
         <span style="color: #ccc;font-size: 9pt;">
         <%=dto.getWriteday()%></span>
      </td>
   </tr>
   <tr height="350">
      <td colspan="2" valign="top">
         <b><%=dto.getId()%></b>
         <br><br>         
         <pre><%=dto.getContent()%></pre>   
      </td>
   </tr>
   <tr>
      <td colspan="2">
         <span style="color: gray;font-size: 9pt;">
         조회수&nbsp; <%=dto.getLikes() %>
         </span>         
      </td>
   </tr>
   <tr>
      <td colspan="2" align="right">
         <input type="button" class="btn btn-warning btn-xs"
           value="댓글" style="width: 60px;"
           onclick="location.href='index.jsp?main=shareboard/shareboardform.jsp'">
         <input type="button" class="btn btn-warning btn-xs"
           value="추천 목록" style="width: 60px;"
           onclick="location.href='index.jsp?main=shareboard/shareboardlist.jsp?pageNum=<%=pageNum%>'">         
      </td>
   </tr>   
</table>
</body>

</html>