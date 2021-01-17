<%@page import="data.dao.WishlistDao"%>
<%@page import="data.dto.ShareBoardDto"%>
<%@page import="data.dao.ShareBoardDao"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>

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

<style type="text/css">
div.smain {
    width: 500px; 
    text-align: center;
    margin-left: 2%; 
    display: inline-block; 

    
}


div.smain_point {
   margin: auto;
}

div.container{
   margin-top: 40px;
}
div.input-group.col-md-12{
   margin:auto;
}
div.main{
    left:50%;
	margin-top: 150px;
	margin-bottom: 200px;
	width: 1500px;
	margin-left: -750px;
	 
	/* text-align: center; */
}

div.shareboard{
      display: flex;
      max-width:1200px;
      height: 330px;
      /* margin: auto; */
      border-top: 2px solid #696969;
      border-bottom: 2px solid #696969;
      margin: 0 auto;
      margin-bottom: 150px;
      margin-top: 100px;
      
      
}
div.shareboard:first-child {
     margin-top: 70px;
}

div.image_star{
     flex-basis: 400px;
  
     height: 100%;
     
     
}
div.content_addr{
     flex-basis: 550px;
     flex-wrap : wrap;
     padding-left: 25px;
     padding-top: 20px;
     height: 100%;
     font-size: 14px;
}
div.subject{
     padding-bottom: 10px;
     font-size: 20pt;
     font-weight: 900;
}
div.addr{
     padding-bottom: 10px
}
div.content {
    height: 130px;
    overflow-y: scroll;
    border-bottom: 1px dotted gray;
    padding: 3px;
}

div.id_writeday{
    display: inline-block;
    padding-top: 5px;
    float: right;
    color: gray;
    opacity: 0.8;
}
div.userimg img, div.userimg div{
    width: 350px;
    height: 260px;
    margin-top: 15px;
    margin-left: 10px;
    
    
}
div.userstar{
    margin-bottom: 10px;
} 
div.likes_heart{
    
     display: flex;
     flex: 1;
     flex-direction: column;
     /* padding-right: 20px; */
     height: 100%;
     float: right;
}
div.likes{
    margin-top: 50px;
    margin-left: 120px;
    font-size: 20px;
    
  
}
div.heart{
    margin-top: 150px;
    margin-left: 130px;
}
input.form-control.input-lg{
    height: 44px;
}

div.update_del_btn {
    position: absolute;
    margin-top: 15px;
    margin-left: 15px;
    font-size: 20px;
    width: 1000px;
    left: 85%;
 
    
}
/*-------------------댓글창-------------------*/
div.sreview_rere{
 
   margin-top: 10px;
   margin-left: 460px;
   margin-bottom: 20px;
   padding-bottom: 20px;
   border-bottom: 1px solid #ffc266;
   max-width: 1000px;
 
}
div.sreview_list{
 
   margin-top: 20px;
   /* margin-left: 460px; */
   margin-bottom: 20px;
   padding-bottom: 20px;
   border-bottom: 1px solid #696969;
   max-width: 1200px;
   margin: auto;
 
}
div.sreview{
 
   margin-top: 20px;
   margin-left: 460px;
   margin-bottom: 20px;
   padding-bottom: 40px;
   border-bottom: 1px solid #ffc266;
   max-width: 1000px;
 
}
   
 div.sreview_id  {
     padding-bottom: 10px;
 }
 
 
div.sreview_memo{
    
    display: block;
    padding-bottom: 10px;
 
}
input.form-control{
 
    display: block;
    padding-bottom: 10px;
  
}
div.page {
   text-align: center;
}
/*span.memo_plus{
    float: right;
    cursor: pointer;
}

/* -------------------하트 css ---------------------------------------*/
.heart {
     position: absolute;
    margin: auto;
    background-color: #babbbc;
    height: 20px;
    width: 20px;
    transform: rotate(-45deg);

  }
  .heart:after {
     background-color: #babbbc;
    content: "";
    border-radius: 50%;
    position: absolute;
    width: 25px;
    height: 20px;
    top: 0;
    left: 8px;

  }
  .heart:before {
     background-color: #babbbc;
    content: "";
    border-radius: 50%;
    position: absolute;
      width: 20px;
    height: 25px;
    top: -13px;
    left: 0;

  }
  @keyframes beat {
    50% {
      transform: scale(1.6) rotate(-45deg);
    }
    100% {
      transform: scale(1) rotate(-45deg);
      }
    }
    
    .color
    {
      background-color: #ff2033;
      animation-name: beat;
      animation-duration: 1s;
      anianimation-play-state: running;
    }
    
    .color:before
    {
      background-color: #ff2033;
    }
    
    .color:after
    {
      background-color: #ff2033;
    }
    
    
/*----------------------------------------------버튼 css--------------------------------------------------*/
div.review_enter_btn{
    float: right;
}
/*댓글(),댓글쓰기 버튼 css*/
div.review_btn{
   margin-left: 72px;
   margin-top: 195px;
 
}
/*수정 삭제 버튼 */

/*맛집공유 버튼 css*/
 div.point{
 
 float: right;
 display: inline-block;
    
 }
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
  width: 140px;
  height: 55px;
  font-size: 25px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 600;
  color: #000;
  background-color: #8cc63f;
  border: none;
  border-radius: 5px;
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  display: block;
  margin-top: 50px;
  margin-right: 200px;
 
  
 }
 
 .button1 {
  width: 66px;
  height: 25px;
  font-size: 10px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 600;
  color: black;
  /*background-color: #ffc34d;*/
  border: none;
  border-radius: 5px;
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  text-align: center;
  
 }
 
  .button2 {
  width: 66px;
  height: 25px;
  font-size: 10px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 600;
  color: black;
  /*background-color: #ffc34d;*/
  border: none;
  border-radius: 5px;
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  text-align: center;
 
  
 }
  
  
.button:hover {
  transform: translateY(-7px);
}
.button1:hover {
  transform: translateY(-7px);
}
.button2:hover {
  transform: translateY(-7px);
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
    width: 15px;
    height: 15px;
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
/*modal 창 열림 css*/
div.modal-backdrop{
z-index:0;}
div.modal-content{
margin-top:200px;
z-index:1111;
}
    
/* 검색창 */
/* div.container{
    position: relative;
    margin: auto;
    margin-top: 3%;
    margin-bottom: 3%; 
    max-width: 1500px;
    float:right;
    
}
#custom-search-input{
    padding-left: 3px;
    padding-right: 3px;
    border: solid 1px #ccc;
    border-radius: 6px;
    background-color: #fff;
    display: inline-block;
    float: right;
    height: 55px;
}
#custom-search-input input{
    border: 0;
    box-shadow: none;
    display: inline-block;
}
#custom-search-input button{
    margin: 2px 0 0 0;
    background: none;
    box-shadow: none;
    border: 0;
    color: #666666;
    padding: 0 8px 0 10px;
    border-left: solid 1px #ccc;
}
#custom-search-input button:hover{
    border: 0;
    box-shadow: none;
    border-left: solid 1px #ccc;
}
#custom-search-input .glyphicon-search{
    font-size: 23px;
}
select.combobox{
    display: inline-block;
    width: 100px;
    background-color: #fff;
    float: left;
    height: 55px;
    margin-top: 1px;
    border: solid 1px #ccc; 
    border-radius: 6px;
}

#main_search{
    padding-left: 5px;
} 

.input-lg{
    height: 44px;
}

.row{
    width: 600px;
} */
    
</style>
<%
String id=(String)session.getAttribute("myid");
String loginok=(String)session.getAttribute("loginok");
String search = request.getParameter("search");

   ShareBoardDao db=new ShareBoardDao();
//페이징 처리에 필요한 변수들   
	int totalCount = 0;
	if(search != null){
		totalCount = db.getSearchTotalCount(search);
	}
	else{
		totalCount= db.getTotalCount();
	}
    //System.out.println("토탈" + totalCount);
	int perPage = 10; // 한페이지당 보여질 글의 갯수
	int perBlock = 5; // 한블럭당 출력할 페이지의 갯수
	int totalPage; // 총 페이지의 갯수
	int startPage; // 각 블럭당 시작 페이지 번호
	int endPage; // 각 블럭당 끝페이지 번호
	int start; // 각 블럭당 불러올 글의 시작번호
	int end; // 각 블럭당 글의 끝번호
	int currentPage; // 현재 보여질 페이지 번호
	
//현재 페이지 번호 구하기
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
	
	List<ShareBoardDto> list;
	if(search != null){
		list = db.getSearchList(start, perPage, search);
	}
	else{
		list=db.getList(start, perPage);	
	} 
	
	//각 글에 보여질 번호구하기(총 100개라면 100부터 출력함)
	int no=totalCount-((currentPage-1)*perPage);
   
   no=totalCount-((currentPage-1)*perPage);
   
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
   
   WishlistDao wdao = new WishlistDao();
%>
<script type="text/javascript">
$(function(){
	
   //리뷰 별점
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
      
	 
	 
	 //좋아요 증가
     $(document).on("click",".likes",function(){
         var num=$(this).attr("num");
         //alert(likes);
         $.ajax({
            type:"get",
            dataType:"html",
            url:"shareboard/shareboardlikes.jsp",
            data:{"num":num},
            success:function(data){
               location.reload();
            }
         });
      });
  
    
    
    //하트 버튼 클릭시 스케줄 모달
    
    $("div.heart").click(function(){
    	if(<%=loginok!=null%>){
    		var num= $(this).attr("num");
         	var subject=$(this).attr("subject");
         	var addr=$(this).attr("addr");
            var idx = $(this).attr("idx");
           // alert(idx);
         	
             $("#sharemodal").modal();

             var s = "";
             
             s += "<input type='hidden' id='heart_idx' value='" + idx + "'>";
             s += "<input type='hidden' id='modalnum' num='"+num+"'>";
             s += "<span class='glyphicon glyphicon-tags'></span>&nbsp;&nbsp;&nbsp;&nbsp;<b>" + subject + "</b><br><br>";
             s += "<span class='glyphicon glyphicon-map-marker'></span>&nbsp;&nbsp;&nbsp;&nbsp;<b>" + addr + "</b><br>";
             
             
             $("#Info").html(s);
    	}
    	else{
    		alert("로그인이 필요한 서비스입니다.");
    	}
         
         
      });
    
   //하트 버튼 클릭 스케줄 모달
    $(document).on("click","#aoCal",function(){
    	
    	var num=$("#modalnum").attr("num");
        $.ajax({
          type:"post",
          dataType:"html",
          url:"shareboard/insertshareboard.jsp",
          data:{"num":num,"wishday":$("#wishday").val(),"myid":"<%=id%>"},
          success:function(data){
             $("#sharemodal").modal("hide");
             $(".heart:eq(" + $("#heart_idx").val() + ")").addClass('color');
          }
          
        });
     });
    
    
    
    //댓글 버튼
    $(".sreview").hide();
    $(".sreview_list").hide();
    $(".sreview_rere").hide();
    
    
    // 원글에 댓글추가
    $(".button1").click(function(){
       //alert($(this).parent().parent().parent().next().html());
       if(<%=loginok!=null%>){
    	   var num=$(this).attr("num");
    	      var regroup = $(this).attr("regroup");
    	      var relevel = $(this).attr("relevel");
    	      var restep = $(this).attr("restep");
    	      
    	      var s="";
    	      s += "<input type='hidden' id='answerNum' value='" + num + "'>";
    	  	  s += "<input type='hidden' id='answerRegroup' value='" + regroup + "'>";
    	      s += "<input type='hidden' id='answerRelevel' value='" + relevel + "'>";
    	  	  s += "<input type='hidden' id='answerRestep' value='" + restep + "'>";
    	      /* s+="<div id='answermodalnum' num='"+num+"'>num:"+num+"</div>" */
    	      s += "<span class='glyphicon glyphicon-user'></span><b>&nbsp;&nbsp;&nbsp;<%=id%></b><br><br>";
    	      s+="<textarea class='form-control' placeholder='리뷰를 입력하세요' style='width: 350px; resize:none; height: 100px;' id='answercontent' ></textarea>";
    	         
    	      $("#Infoanswer").html(s);
    	      $("#shareanswermodal").modal();
       }
       else{
    	   alert("로그인이 필요합니다");
       }
      
       
      });

	 // 대댓글 추가
    $(document).on("click", ".review_plus", function(){
    	var num = $(this).attr("num");
	   		var regroup = $(this).attr("regroup");
	   		var relevel = $(this).attr("relevel");
	   		var restep = $(this).attr("restep");
	   		var content = $(this).attr("content");
	   		//alert(relevel);
	   	
	   		var s="";
	   		s += "<input type='hidden' id='answerNum' value='" + num + "'>";
	   		s += "<input type='hidden' id='answerRegroup' value='" + regroup + "'>";
	   		s += "<input type='hidden' id='answerRelevel' value='" + relevel + "'>";
	   		s += "<input type='hidden' id='answerRestep' value='" + restep + "'>";
	         <%-- s+="<div id='answermodalnum' num='"+num+"'>num:"+num+"</div>" ;
	        s+="<div class='sreview_id'>ID:&nbsp;<%=id%> &nbsp;&nbsp;</div>"; --%>
	        
	        s += "<span style='text-overflow:ellipsis;overflow: hidden;white-space: nowrap;display: inline-block;max-width: 350px;'>"+content+"</span><br><br>";
	        s += "↪&nbsp;&nbsp;<span class='glyphicon glyphicon-user'></span><b>&nbsp;&nbsp;&nbsp;<%=id%></b><br><br>";
		    s+="<textarea class='form-control' placeholder='리뷰를 입력하세요' style='width: 350px; resize:none; height: 100px;' id='answercontent' ></textarea>";
	          
	        $("#Infoanswer").html(s);
	        $("#shareanswermodal").modal();
        
    });
	 
	// 대댓글 모달 추가버튼 
    $(document).on("click","#answeraoCal",function(){
    	var num=$("#answerNum").val();
        var regroup = $("#answerRegroup").val();
        var relevel = $("#answerRelevel").val();
        var restep = $("#answerRestep").val();
        var content=$("#answercontent").val();
      
         $.ajax({
          type:"post",
          dataType:"html",
          url:"shareboard/insertshareboardanswer.jsp",
          data:{"num":num, "regroup":regroup, "relevel":relevel, "restep":restep, "content":content,"id":"<%=id%>"},
          success:function(data){
        	  $("#shareanswermodal").modal("hide");
        	  location.reload();
          }
          
        }); 
         
    });
    
    // 댓글 각자 삭제
    $(document).on("click",".delReview",function(){
    	var num = $(this).attr("num");
    	var relevel = $(this).attr("relevel");
    	var regroup = $(this).attr("regroup");
    	var restep = $(this).attr("restep");
    	
        var a = confirm("댓글을 삭제하시겠습니까?");
        if(a){
        	$.ajax({
                type:"get",
                dataType:"html",
                url:"shareboard/deleteReview.jsp",
                data:{"num":num, "relevel":relevel, "regroup":regroup, "restep":restep},
                success:function(data){
                   location.reload();
                }
        	});
        }
         
    });
    
    
    
   
    $(".memo_plus").click(function(){
    	//alert($(this).parent().parent().parent().next().html());
    	$(this).parent().parent().next().toggle();
    	
      });
      
    
     
     
    //댓글 추가
    $(document).on("click",".btn_submit",function(){
        var num=$(this).attr("num");
        var id=$(this).attr("id1");          
        var content=$("#content").val();
          alert(content);
         $.ajax({
          type:"get",
          dataType:"html",
          url:"shareboard/insertshareboardanswer.jsp",
          data:{"num":num,"id":id,"content":content},
          success:function(data){
             $("#content").val("");
          }
       });  
       
     });
     
     
     
  /* //게시글 수정(modal)
    $(document).on("click",".btn_update",function(){
      var num=$(this).attr("num");
       var subject=$(this).attr("subject");
       var content=$(this).attr("content");
       var photo=$(this).attr("photo");
       var addr=$(this).attr("addr");
       //alert(num);
       $("#shareupdate").modal();
       var s="";
       s+="<form action='shareboard/shareboardupdateaction.jsp' method='post' enctype='multipart/form-data'>"
       s+="<input type='hidden' name='num' value='"+num+"'>"
       s+="추천맛집:&nbsp;<input type='text' name='subject' value='"+subject+"'><br><br>"
       s+="맛집주소:&nbsp;<input type='text' name='addr' value='"+addr+"'><br><br>"
       s+="이미지:&nbsp;<input type='file' name='photo' value='"+photo+"'><br>"
       s+="내용:&nbsp;<textarea maxwidth='1000' name='content'>" + content + "</textarea>"
       s+="<button type='submit' class='btn btn-warning' id='updateaoCal'>수정</button></form>";
       
       $("#Infoupdate").html(s);
    }); */

    
     $(".button2").click(function(){
    	 
    	 $(this).parent().parent().parent().next().toggle();
    	 var now = $(this).parent().parent().parent().next();
    	 
    	 if(now.css("display") == "none"){   
 	    	$("div.shareboard").css('margin-bottom','100px');  
 	    } else {  
 	    	$("div.shareboard").css('margin-bottom','20px');
 	    }  
    	 
         var regroup = $(this).attr("regroup");
        // var num=$(this).attr("num");
         //alert(regroup);
         $.ajax({
            type: "get",
            url: "shareboard/shareboardxml.jsp",
            dataType: "xml",
            data: {"regroup" : regroup},
            success: function(data){
            	
               var s ="";
               if($(data).find("dto").text() == ''){
            	   s += "<b style='text-align:center;'>등록된 review가 없습니다.</b>";
               }
               else{
            	   $(data).find("dto").each(function(i, element) {
                	   var myid = $(this).find("id").text();
                	   var relevel = $(this).find("relevel").text();
                	   s += "<div>";
                	  for(var i = 0; i<relevel; i++)
                		  s += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                	
                      s += "↪&nbsp;&nbsp;" + $(this).find("content").text();
                      if("<%=id%>"==myid && <%=loginok!= null%> ){
                    	  s += "&nbsp;&nbsp;<b style='color:tomato; cursor:pointer;' class='delReview' num='" + $(this).attr("num") + "' relevel='"+$(this).find("relevel").text()
                    	  		+"' regroup='" + $(this).find("regroup").text() + "' restep='" + $(this).find("restep").text() + "'>X</b>";
                    	  s += "&nbsp;&nbsp;<span class='answerupdate glyphicon glyphicon-pencil' style='cursor:pointer;' num='"+$(this).attr("num")+"' content='"+$(this).find("content").text()+"'></span>";
                      }
                      if(<%=loginok!=null%>){
                    	  s += "<span style='float: right;font-size:20px; cursor: pointer;' class='review_plus' num='"+ $(this).attr("num") 
                    		+ "' regroup='" + $(this).find("regroup").text() + "' relevel='" + $(this).find("relevel").text() 
                    		+ "' restep='" + $(this).find("restep").text() + "' content='"+$(this).find("content").text() + "'>+</span>";
                      }
                      
                     /*  s += "<br>" + $(this).find("content").text(); */
                      s += "<br><br><b style='float: right; color:gray;'>"+ myid + " | " + $(this).find("writeday").text();
                      
                      
                      
                      s += "</b></div><br><hr>";
                   });
               }
               
               //$(".sreview_list").html(s);
               now.html(s);
               
            }
         });
      });
   
    
     //게시글 삭제
     $(document).on("click",".btn_delete",function(){
        var num=$(this).attr("num");
        var num1=$(this).attr("num");
        //var regroup=$(this).attr("regroup");
        //alert(num1);
        var a = confirm("게시글을 삭제하시겠습니까?");
        if(a){
        	$.ajax({
                type:"get",
                dataType:"html",
                url:"shareboard/shareboarddelete.jsp",
                data:{"num":num, "num1":num1},
                success:function(data){
                   location.reload();
                }
             });  
        }
        
         
        
     }); 
     
     $(".btn_search").click(function(){
    	 var search = $("#share_search").val();
    	 
    	 location.href = "index.jsp?main=shareboard/shareboardlist.jsp?pageNum=1&search=" + search;
     });
    
    
     //댓글 수정 모달
     $(document).on("click",".answerupdate",function(){
        var num=$(this).attr("num");
        var content=$(this).attr("content");
        //alert(num);
        $("#answerupdatemodal").modal();
        var s="";
        s+="<form action='shareboard/shareboardReviewaction.jsp' method='post'>";
        s+="<input type='hidden' name='num' value='"+num+"'>";
        s+="<input type='hidden' name='pageNum' value='" + "<%=currentPage%>" + "'>";
        <%-- s+="아이디:&nbsp;<input type='text' name='id' value='"+"<%=id%>"+"'><br>";
        s+="수정 내용:&nbsp;<textarea maxwidth='1000' name='content'>"+content+"</textarea><br>"; --%>
        s += "<span class='glyphicon glyphicon-user'></span><b>&nbsp;&nbsp;&nbsp;<%=id%></b><br><br>";
	    s+="<textarea class='form-control' style='width: 350px; resize:none; height: 100px;' name='content'>" + content + "</textarea>";
        s += "<br>";
        s+="<button type='submit' class='btn btn-warning' id='answeraoCal' style='margin-left: 150px;'>수정</button></form>";
        $("#Infoanswerupdate").html(s);
     });
     
     
     /* $(".button2").click(function () {  
    	    
    	}); */  

     
     
}); //function close


</script>


</head>

<body>


<!-- 전체 div -->
<div class="main">
	<div class="smain_point">
	 <!--게시판 제목 -->
    <div class="smain">
    	<h1 style="font-weight: 900;"><b>맛집 공유 게시판</b></h1>
    	<!-- <button ><img src="image/plus.png"></button> -->
      
    </div>
  <!-- 제목 close-->
   <%
   if(loginok != null){
	   %>
	   <div class="point">
	      <input type="button" value="맛집공유" style="color: white;"class="button" 
	      onclick="location.href='index.jsp?main=shareboard/shareboardform.jsp'">
	   </div>
	   <%
   }
   %>  
   </div>
     <!-- 맛집 공유 버튼  -->
 <div class="cc">
 
 
  
   
    <%
    
    int idx = 0;
    for(ShareBoardDto dto : list){
	%>   
  	  
  	
	<!-- shardboard 부분 -->
  	<div class="shareboard"> 
        
        <!-- 이미지+stat 묶음 div -->
        <div class="image_star">
              
              <!-- 이미지부분 -->
              <div class="userimg">
                  <div>
                  <%
                  if(!dto.getPhoto().equals("no"))
                  {%>
                  <img src="shareboardsave/<%=dto.getPhoto() %>">
                  <%}
                  else{
                	  %>
                	  <div><img src="image/imgX.png" style="background-color: gray;width: 100%;"></div><%-- 수진아. 여기 img크기만큼 엑스자 그림 넣어줄 수 있니 ㅎ.ㅎ --%>
                	  <%
                  }
                  %>
                 </div>
             </div><!-- 이미지부분 close -->
                     
                       
             
       </div>
       <!-- 이미지+stat 묶음 div close -->      
               
                   
      <!-- 주소 내용  -->
      <div class="content_addr">
                       
                       <!-- 별 -->
             <div class="userstar">
                  <div class="starcount">
                     <span style="color: #F0CD58; font-size: 20pt;">
                                 <%
                                 for(int i=1; i<=5; i++){
                                 if(i<=Integer.parseInt(dto.getStar())){
                                 %>★<%
                                 }
                                 else {
                                 %>☆<%
                                 }
                                 }
                                 %>
                          
                     </span>
                  </div>
            </div>
            <!-- 별 close-->
           <div class="subject_addr_content">
            <div class="subject"><%=dto.getSubject()%></div>
            <div class="addr"><span class="glyphicon glyphicon-map-marker"></span>&nbsp;&nbsp;&nbsp;<%=dto.getAddr()%></div>
            <div class="content"><%=dto.getContent().replace("\n", "<br>")%></div>
           </div>
        
            
          <div class="id_writeday">
            <div class="userid"><%=dto.getId()%>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;<%=sdf.format(dto.getWriteday())%></div>
            <%-- <div class="userwriteday"><%=sdf.format(dto.getWriteday())%></div> --%>
          </div>
              
      </div>
      <!-- 주소 내용 close -->
              
               <!--게시글 수정 삭제 버튼-->
          <%
          if((id.equals(dto.getId())||id.equals("admin")) && loginok!=null){
        	  %>
        	  
         <div class="update_del_btn">
         	<span class="glyphicon glyphicon-edit" style="cursor: pointer;" onclick="location.href='index.jsp?main=shareboard/updateform.jsp?num=<%=dto.getNum()%>'"></span>
         	<span class="glyphicon glyphicon-remove btn_delete" style="cursor: pointer;" num="<%=dto.getNum() %>" regroup="<%=dto.getRegroup()%>"></span>
             <%-- <button type="button" class="glyphicon glyphicon-edit"
             onclick="location.href='index.jsp?main=shareboard/updateform.jsp?num=<%=dto.getNum()%>'"></button>
             <button type="button" class="btn_delete btn btn-success" style="color: white;"
             num="<%=dto.getNum() %>" regroup="<%=dto.getRegroup()%>">삭제</button> --%>
         </div>
        	  <%
          }
          %>
         
         <!-- 게시글 수정 삭제 버튼 close -->
    
     <!-- 좋아요 찜하기(하트) 댓글버튼,게시글 수정 삭제 -->
    <div class="likes_heart">
                  
         <!-- 좋아요 -->
         <div class="likes">
            <span class="likes glyphicon glyphicon-thumbs-up"  num="<%=dto.getNum()%>">
            </span>&nbsp;<%=dto.getLikes()%>
         </div>
         <!-- 좋아요 close -->
                  
         <!-- 찜하기(하트) -->    
         <div class="heart <%if(wdao.isShareSearch(dto.getNum(), id)){
        	 %>
        	 color
        	 <%
         	} %>" 
         	num="<%=dto.getNum() %>" subject="<%=dto.getSubject() %>"
                                 addr="<%=dto.getAddr() %>" idx="<%=idx++%>"></div>
         <!-- 찜하기(하트) close -->       
         
                
         
         
         
         <!-- 댓글버튼-->
         <div class="review_btn">
             <button type="button" class="button2"  regroup="<%=dto.getRegroup()%>">댓글(<%=db.getCount(dto.getRegroup()) %>)</button>
             <button type="button" class="button1"  num="<%=dto.getNum() %>" regroup="<%=dto.getRegroup()%>"
              relevel="<%=dto.getRelevel()%>" restep="<%=dto.getRestep()%>">댓글쓰기</button>
         </div>
         <!-- 댓글버튼 close -->
	   	          
	</div>
    <!-- 좋아요 찜하기(하트) 댓글버튼,게시글 수정 삭제 close--> 
	   	
  </div>
  <!-- shareboard close -->


 
     
      <!-- 댓글목록-->
     <div class="sreview_list">
        
     </div>
     
       <%   
   }
    	
 %>

     <!-- 댓글창 close-->
     
     <!-- 댓글 댓글 입력창-->
     <div class="sreview_rere">
     
        <div><img src="image/review.png" style="width: 30px;height: 30px;"></div>
 	     
 	     
 	    <div class="sreview_memo"> <input class="form-control" placeholder="댓글을 입력하세요" style="width: 800px"> </div> 
 	   
     </div>
     <!-- 댓글 댓글 입력창 close--> 




 <!-- 하트 클릭->스케줄 일정 추가 modal -->
   <div class="modal fade" id="sharemodal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 500px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">일정 추가</h4>
        </div>
        <div class="modal-body">
           <div style="margin-left: 10px; margin-right: 10px;">
              <div id="Info"></div>
              <br>
              
                <span class="glyphicon glyphicon-calendar" style="color: #aaa"></span>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="date" id="wishday">
           </div>
        </div>
        <div class="modal-footer">
           <button type="button" class="btn btn-warning" id="aoCal">추가</button>
             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
    <!--  게시판 원글 수정 
  <div class="modal fade" id="shareupdate" role="dialog">
    <div class="modal-dialog">
    
      Modal content
      <div class="modal-content" style="width: 400px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">공유맛집추천 수정</h4>
        </div>
        <div class="modal-body">
           <div style="margin-left: 10px; margin-right: 10px;">
              <div id="Infoupdate"></div>
              <br>
              
                
                
           </div>
        </div>
       </div>
     </div>
  </div> -->
 
 <!-- 댓글 수정 -->
   <div class="modal fade" id="answerupdatemodal" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content" style="width: 400px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">댓글 수정</h4>
        </div>
        <div class="modal-body">
           <div style="margin-left: 10px; margin-right: 10px;">
              <div id="Infoanswerupdate"></div>
              <br>
              
               
           </div>
        </div>
        <div class="modal-footer">
           
             <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
        </div>
      </div>
      
    </div>
  </div>
  
 <!-- 댓글쓰기 클릭 -->
  <div class="modal fade" id="shareanswermodal" role="dialog" data-backdrop="false">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 400px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">댓글쓰기</h4>
        </div>
        <div class="modal-body">
           <div style="margin-left: 10px; margin-right: 10px;">
              <div id="Infoanswer"></div>
              <br>
              
               
           </div>
        </div>
        <div class="modal-footer">
           <button type="button" class="btn btn-warning" id="answeraoCal">등록</button>
             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
 <div class="container">
 <div class="input-group col-md-12" style="width: 300px;">
        <input type="text" class="form-control input-lg" id="share_search" placeholder="검색할 지역을 입력해주세요" />
             <span class="input-group-btn">
                  <button class="btn btn-info btn-lg btn_search" type="button" style="background-color: #aaa; border: none;">
                       <i class="glyphicon glyphicon-search"></i>
                   </button>
             </span>
    </div>
     
    <br><br>
<!-- 페이징처리 -->
  <div class="page" >
    <ul class="pagination">
    <!-- 이전(첫블럭이 아니면 보이게하기) -->
   <%
    if(startPage>1)
    {%>
      <li>
      <a href="index.jsp?main=shareboard/shareboardlist.jsp?pageNum=<%=startPage-1%>">
      ◀</a></li> 
    <%}
    %>     
    
    <%
    for(int i=startPage;i<=endPage;i++)
    {%>
      <li>
      <a 
      style="color:<%=currentPage==i?"orange":"green"%>"
      href="index.jsp?main=shareboard/shareboardlist.jsp?pageNum=<%=i%>"><%=i%></a>
      </li> 
    <%}
    %>   
    <!-- 다음 (마지막 블럭이 아니면보이기):클릭시 현재페이지는
    다음블럭의 startPage 로 가려면 어떻게 주어야할까요 -->
    <%
    if(endPage<totalPage)
    {%>
      <li>
      <a href="index.jsp?main=shareboard/shareboardlist.jsp?pageNum=<%=endPage+1%>">
      ▶</a></li> 
    <%}
    %>    
    </ul>   
  </div>
<!-- 페이징처리 close-->
</div>
</div>
<!-- 전체 div close -->

</div>
</body>
</html>