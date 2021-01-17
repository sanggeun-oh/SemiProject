<%@page import="data.dto.NoticeDto"%>
<%@page import="data.dao.NoticeDao"%>
<%@page import="java.util.List"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="font/SCDream5.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="image/favicon.ico">
<meta charset="UTF-8">
<title>멘도롱 소랑 :: 제주여행의모든것</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
#cl-dashboard {
   display: none;
}

div.container{
  /*  margin: 0 auto;
   width: 1000px; */
  margin-top: 150px;
  

 }

div.page {
   /* margin: 0 auto;
   width: 200px; */
   margin-top: 100px;
   margin-bottom: 50px;
   text-align: center;
   
}

.btn_notice:hover {
  transform: translateY(-7px);
}

/*--------------------------테이블 css--------------------------------------*/
.styled-table {
    border-collapse: collapse;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
    
}

.styled-table th {
    background-color:  #ffa50b;
    color: white;
    text-align: center;
}

.styled-table th,.styled-table td {
    padding: 12px 15px;
    border-bottom: 1px dotted #ddd;
}

.styled-table td.active-row {
    font-weight: bold;
    color: black;
}


</style>
  <%
   NoticeDao db=new NoticeDao();
   //페이징 처리에 필요한 변수들   
   int totalCount = db.getTotalCount();
	int perPage = 10; // 한페이지당 보여질 글의 갯수
	int perBlock = 5; // 한블럭당 출력할 페이지의 갯수
	int totalPage; // 총 페이지의 갯수
	int startPage; // 각 블럭당 시작 페이지 번호
	int endPage; // 각 블럭당 끝페이지 번호
	int start; // 각 블럭당 불러올 글의 시작번호
	int end; // 각 블럭당 글의 끝번호
	int currentPage; // 현재 보여질 페이지 번호
	
// 현재 페이지 번호 구하기
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null)
		currentPage = 1; // 페이지 번호가 없을경우 무조건 1페이지로 간다.
	else
		currentPage = Integer.parseInt(pageNum);
		
	// 총 페이지 구하기 
	// 나머지가 있을 경우에는 1페이지 더 추가 (예 : 총글수가 9이고 한페이지당 2개씩 볼 경우)
	totalPage = totalCount/perPage + (totalCount % perPage > 0 ? 1 : 0);
	
	// 시작페이지와 끝페이지 구하기
	// 예 : 한페이지당 3개만 볼 경우 현재 페이지가 2라면 startPage: 1, endPage: 3
	// 현재 페이지가 7이라면 startPage: 7, endPage: 9
	startPage = (currentPage - 1) / perBlock * perBlock + 1;
	endPage = startPage + perBlock - 1;
	// 마지막 블럭은 endPage를 totalPage로 해놔야 한다.
	if(endPage > totalPage)
		endPage = totalPage;
	
	// mysql은 첫 글이 0번이므로 +1 안해도됨 (오라클은 1번)
	start = (currentPage-1) * perPage;
   
   List<NoticeDto> list=db.getList(start, perPage);
   //각 글에 보여질 번호구하기(총 100개라면 100부터 출력함)
   int no=totalCount-((currentPage-1)*perPage);
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
   
   String loginok = (String)session.getAttribute("loginok");
   String myid = (String)session.getAttribute("myid");
%>
<script type="text/javascript">
	$(function(){
		$(".nt_star").click(function(){
			<%
			if(loginok!=null){
				if(myid.equals("admin")){
					%>
					$.ajax({
						type: "get",
						dataType: "html",
						url: "notice/updateStar.jsp",
						data: {"num": $(this).attr("num")},
						success: function(){
							location.reload();
						}
					});
					<%
				}
				else{
					%>
					alert("관리자만 접근 가능합니다.");
					<%
				}
			}
			else{
				%>
				alert("관리자만 접근 가능합니다.");
				<%
			}
			
			%>
		});
	});
</script>
</head>

<body>
 
   
   <div class="container">
   		<h2 style="float: left;"><span class="glyphicon glyphicon-bullhorn"></span>&nbsp;&nbsp;공지사항</h2><br><br>
   
   		<!-- <input type="button" value="+" class="button" style="color: white; float: right; font-style: bold;"
 			onclick="location.href='index.jsp?main=notice/noticeform.jsp'"> -->

		<%
			if(loginok!=null && myid.equals("admin")){
				%>
				<span class="glyphicon glyphicon-plus btn_notice" style="cursor: pointer; float: right; font-size: 20pt;"
			onclick="location.href='index.jsp?main=notice/noticeform.jsp'"></span>
				<%
			}
		%>
		
   		<br><br><br>
      	<table class="styled-table" style="width: 100%">
        	<thead>
            	<tr class="active" >
               		<th style="text-align: center;" width="10%">#</th>
               		<th style="text-align: center;" width="50%">제 목</th>
               		<th style="text-align: center;" width="25%">작성일</th>
               		<th style="text-align: center;" width="10%">조회수</th>
               		<th style="text-align: center;" width="5%">⭐</th>              		
            	</tr>
         	<thead>
            
            <tbody>
            <%
       		if(totalCount==0)
        	{%>

            	<tr align="center" height="50">
               		<td colspan="7"><b>등록된 글이 없습니다</b></td>
            	</tr>
       		<%}
            
            for(NoticeDto dto:list)
            {
            	if(dto.getStar()==1){
            		%>
            		<tr class="active-row" bgcolor="#efefef">
            		<%
            	}
            	else{
            		%>
            		<tr class="active-row">
            		<%
            	}
            %>
               		<td style="text-align: center;"align="center"><b><%=no-- %></b></td>
               		<td><a style="color: black;" style="text-align: left;"
                  		href="index.jsp?main=notice/noticecontent.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>&key=list">
                     	<%=dto.getSubject()%></a>
                    </td>
               		<td style="text-align: center;" align="center"><%=sdf.format(dto.getWriteday())%></td>
               		<td style="text-align: center;" align="center"><%=dto.getReadcount()%></td>
               		
        			<%
        			if(dto.getStar() == 1){
        				%>
        				<td style="text-align: center;"><span class="nt_star" style="cursor: pointer;" num="<%=dto.getNum()%>">⭐</span></td>
        				<%
        			}
        			else {
        				%>
        				<td style="text-align: center;"><span class="nt_star" style="cursor: pointer;" num="<%=dto.getNum()%>">☆</span></td>
        				<%
        			}
        			
        			%>
               		
            	</tr>
            
            <%}
                %>
              </tbody>
         </table>
         
         <!-- 페이징처리 -->
     	<div class="page">
    		<ul class="pagination">
    		<!-- 이전(첫블럭이 아니면 보이게하기) -->
   			<%
    		if(startPage>1)
    		{%>
      			<li><a style="color:green;" href="index.jsp?main=notice/noticelist.jsp?pageNum=<%=startPage-1%>">◀</a></li> 
    		<%}
    
    		for(int i=startPage;i<=endPage;i++)
    		{%>
      			<li>
      				<a style="color:<%=currentPage==i?"orange":"green"%>"
      						href="index.jsp?main=notice/noticelist.jsp?pageNum=<%=i%>"><%=i%></a>
      			</li> 
    		<%}
    		
    		if(endPage<totalPage)
    		{%>
      			<li><a style="color:green;" href="index.jsp?main=notice/noticelist.jsp?pageNum=<%=endPage+1%>">▶</a></li> 
    		<%}
    		%>    
    		</ul>   
   		</div>
    </div>
   


    
</body>
</html>





