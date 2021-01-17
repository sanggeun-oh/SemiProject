<%@page import="data.dto.ShareBoardDto"%>
<%@page import="data.dao.ShareBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="font/SCDream5.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="image/favicon.ico">
<meta charset="UTF-8">
<title>멘도롱 소랑 :: 제주여행의모든것</title>
<style type="text/css">
scroll-behavior: smooth;
   div.subject{
      margin-top: 100px;
   }
   
   th.td{
      padding: 6px;
      text-align: center;
   
   }
   
   div.shareupdateform{
     max-width:700px;
     position:relative;
     margin: auto;
     margin-top: 200px;
     margin-bottom: 150px;
   }
  h2{
      width:150px;
      margin-left: 320px;
  }
  
  div.share_btn{
     margin-left: 250px;
  }
   
   /*--------------------별점 css--------------------------------*/
 div.stars{
   float: left;
 
 }
 
 
.stars{
    display: flex;
    flex-wrap: wrap;
    flex-direction: row-reverse;
    justify-content: center;
}
.stars__star-icon{
    stroke:#EFCE4A;
    stroke-width: 2px;
    fill: transparent;
    transition: .1s all;
}
.stars__star{
    width: 20px;
    height: 20px;
    position: relative;
    cursor: pointer;
    margin: 5px;
}
.stars__checkbox{
    position: absolute;
    top: -9999px;
    opacity: 0;
    width: 0;
    height: 0;
}
.stars__star:hover > .stars__star-icon{
    fill: #EFCE4A;
}
.stars__star:hover ~ .stars__star > .stars__star-icon {
    fill: #EFCE4A;
}
.stars__checkbox:checked + .stars__star > .stars__star-icon {
    fill: #EFCE4A;
}
.stars__checkbox:checked ~ .stars__star > .stars__star-icon {
    fill: #EFCE4A;
}
/*--------------------------버튼 css--------------------------------------*/
html, body {
  height: 100%;
}
.wrap {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}
.button {
  width: 100px;
  height: 40px;
  font-size: 18px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #000;
  background-color: #ffc34d;
  border: none;
  border-radius: 5px;
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  
 }
 
.button:hover {
  background-color: #ffaa00;
  transform: translateY(-7px);
}
/*--------------------------테이블 css--------------------------------------*/
.styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    /* font-size: 0.9em; */
    font-family: sans-serif;
    min-width: 300px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
    
}
.styled-table th {
    background-color:  #ffad33;
    color: white;
    text-align: left;
}
.styled-table th,
.styled-table td {
    padding: 12px 15px;
}
.styled-table  th {
    border-bottom: 1px solid white;
}
.styled-table  th:nth-of-type(even) {
    background-color:  #ffad33;
}
.styled-table td:last-of-type {
    border-bottom: 1px solid #ffad33;
}
.styled-table td.active-row {
    font-weight: bold;
    color: black;
}
   
</style>
<script type="text/javascript">
$(function(){
   $(".stars__checkbox").on("click", function(){
        var idx = $(this).index()/2;
        switch (idx) {
        case 0:
           idx="5";
           break;
        case 1:
           idx="4";
           break;
        case 2:
           idx="3";
           break;
        case 3:
           idx="2";
           break;
        case 4:
           idx="1";
           break;
        default:
           break;
        }
        //alert(idx);
        $("#sharestar").val(idx);   
     });
 
}); //function close
</script>
</head>
<%
   String id=(String)session.getAttribute("myid");
   String num = request.getParameter("num"); 
   ShareBoardDao dao = new ShareBoardDao();
   ShareBoardDto dto = dao.getData(num);
%>
<body>


<div class="shareupdateform">
<h1 style="font-weight: 900;"><b>맛집 수정</b></h1>
<fieldset>
   <form action="shareboard/shareboardupdateaction.jsp" method="post" enctype="multipart/form-data">
   <table class="styled-table">
         <tr>
            <th style="text-align: center;"><span>추천맛집</span></th>
            <td> <input type="hidden" name="num" value="<%=dto.getNum()%>">
              <input type="text" name="subject" class="form-control"
               required="required" style="width: 200px;height: 30px;"
               value="<%=dto.getSubject()%>">
            </td>
         </tr>
         
         <tr>
            <th style="text-align: center;"><span>맛집주소</span></th>
            <td>
              <input type="text" name="addr" class="form-control"
               required="required" style="width:600px;height: 30px;"
               value="<%=dto.getAddr()%>">
             </td>
         </tr>
         
         <tr>
            <th style="text-align: center;"><span>이미지</span></th>
            <td>
              <input class="btn" type="file" name="photo" style="width: 600px;" value="shareboardsave/<%=dto.getPhoto()%>"> <%--이미지 불러오기 모르겠당 --%>
            </td>
         </tr>
         
         <tr>
            <th style="text-align: center;"><span>내용</span></th>
            <td>
              <textarea class="form-control"
               rows="13" cols="70" maxlength="1500" name="content" style="resize: none;"><%=dto.getContent() %></textarea>
            </td>
         </tr>
         
         <tr>
           <th style="text-align: center;"><span>평가</span></th>
            <td>
                <input type="hidden" id="sharestar" name="stars" value="0">               
           <!-- 별점 -->
        <div class="stars">
        <input class="stars__checkbox" type="radio" id="first-star" name="star">
        <label class="stars__star" for="first-star">
            <svg class="stars__star-icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        <input class="stars__checkbox" type="radio" id="second-star" name="star">
        <label class="stars__star" for="second-star">
            <svg class="stars__star-icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        <input class="stars__checkbox" type="radio" id="third-star" name="star">
        <label class="stars__star" for="third-star">
            <svg class="stars__star-icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        <input class="stars__checkbox" type="radio" id="fourth-star" name="star">
        <label class="stars__star" for="fourth-star">
            <svg class="stars__star-icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        <input class="stars__checkbox" type="radio" id="fifth-star" name="star">
        <label class="stars__star" for="fifth-star">
            <svg class="stars__star-icon" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 53.867 53.867" style="enable-background:new 0 0 53.867 53.867;" xml:space="preserve">
                <polygon points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 
                    10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "/>
            </svg>
        </label>
        </div>
        </td> 
       </tr>  
       
     </table> 
      
      
      <div class="share_btn">
             <input type="submit" value="수정" id="up_share" class="button" style="width: 100px; color: white;">
               
             <input type="button" value="목록" id="up_goToList" class="button" style="width: 100px;color: white;"
               onclick="location.href='index.jsp?main=shareboard/shareboardlist.jsp'">      
      </div>
    </form>
   </fieldset>
  </div>
</body>
</html>