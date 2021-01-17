<%@page import="data.dao.NoticeDao"%>
<%@page import="data.dto.NoticeDto"%>
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
   
  /* .contentform{
      position: absolute;
      left: 250px;
   } */
   
   .button {
  width: 100px;
  height: 40px;
  /* font-family: 'Roboto', sans-serif; */
  font-size: 18pt;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 400;
  font-style: bold;
  color: #fff;
  background-color: #ffc34d;
  border: none;
  border-radius: 45px;
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  font-style: bold;
  
 }

.button:hover {
  background-color: #ffaa00;

  transform: translateY(-7px);
}
</style>
<%
   String num=request.getParameter("num");   
   String pageNum=request.getParameter("pageNum");
   String key=request.getParameter("key");
   
   //key 값이 널값이 아니면서 'list' 일경우 
   //(이유:수정후에도 content.jsp 로 오기때문에 목록에서
    //         올 경우에만 증가함)
   //조회수 증가
   NoticeDao db=new NoticeDao();
   if(key!=null && key.equals("list"))
      db.updateReadcount(num);
   
   //번호에 해당하는 dto 가져오기
   NoticeDto dto=db.getData(num);
   
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
   
   String loginok = (String)session.getAttribute("loginok");
   String myid = (String)session.getAttribute("myid");
%>  
<script type="text/javascript">
	$(function(){
		$("#btn_delnotice").click(function(){
			var a = confirm("정말로 삭제하시겠습니까?");
			if(a){
				$.ajax({
					type: "get",
					dataType: "html",
					url: "notice/deletenotice.jsp",
					data: {"num":"<%=num%>"},
					success: function(data){
						location.href="index.jsp?main=notice/noticelist.jsp";
					}
				});
			}
		});
	});
</script>
</head> 
<body>

	<div style="margin-left: 200px; margin-right: 200px; margin-top: 150px; margin-bottom: 100px;">
		<div class="glyphicon glyphicon-list" style="font-size: 20pt; cursor: pointer;"
			onclick="location.href='index.jsp?main=notice/noticelist.jsp?pageNum=<%=pageNum%>'"></div>
		<%
		//noticecontent.jsp (수정버튼)
		if(loginok!=null && myid.equals("admin")){
		         %>
		         <div class="glyphicon glyphicon-pencil" style="font-size: 20pt; cursor: pointer; float:right;"
		               onclick="location.href='index.jsp?main=notice/updatenoticeform.jsp?num=<%=num %>&pageNum=<%=pageNum%>'"></div>
		         <div class="glyphicon glyphicon-trash" style="font-size: 20pt; cursor: pointer; float:right; margin-right: 20px;" id="btn_delnotice"></div>
		         <%
		      }
		      %>
		
		
		<br><br>
		<table class="contentform table table-striped">
   			<tr>
      			<td>
         			<b style="font-size: 13pt;">제목&nbsp;:&nbsp; <%=dto.getSubject()%></b>
         			<span style="color: #ccc;font-size: 10pt; float: right;"><%=dto.getWriteday()%></span>
      			</td>
   			</tr>
   			<tr>
   				<td>
   					<b style="float: right;"><%=dto.getId()%></b>
   				</td>
   			</tr>
   			<tr height="350">
      			<td colspan="2" valign="top">
         			        
        			 <%-- <pre><%=dto.getContent()%></pre>  --%>
        			 <div style="padding-left: 50px; padding-top: 50px;">
        			 	<%=dto.getContent() %>
        			 </div>  
     			 </td>
   			</tr>
   			<tr>
      			<td colspan="2">
         			<span style="color: gray;font-size: 9pt; float: right;">조회수&nbsp; <%=dto.getReadcount() %></span>         
      			</td>
   			</tr>
   			   
		</table>
		
		<div style="float: right;">
			<!-- <input type="button" class="btn btn-warning btn-sm button" value="댓글" style="width: 100px;"
           					onclick="location.href='index.jsp?main=notice/noticeform.jsp'"> -->
         	<%-- <input type="button" class="btn btn-warning btn-sm button" value="목록" style="width: 100px;"
           					onclick="location.href='index.jsp?main=notice/noticelist.jsp?pageNum=<%=pageNum%>'">   --%>
		</div>
	</div>
</body>
</html>
