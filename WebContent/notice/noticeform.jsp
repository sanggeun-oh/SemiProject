<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="font/SCDream5.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="image/favicon.ico">
<meta charset="UTF-8">
<title>멘도롱 소랑 :: 제주여행의모든것</title>
<style type="text/css">
   div.noticeform{
      margin-left: 200px; 
      margin-right: 200px; 
      margin-top: 150px;
      margin-bottom: 50px;
   }
   
   th{
   		text-align: center;
   		font-size: 13pt;
   
   }

.button {
  width: 100px;
  height: 40px;
  font-size: 18pt;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 400;
  color: #000;
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

div.btn{
   position: absolute;
   left: 300px;
}
   
</style>
<script src="<%=request.getContextPath()%>/se2/js/HuskyEZCreator.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" type="text/javascript" charset="utf-8"></script></head>

<body>
<div class="noticeform">
	<fieldset>
   		<legend><h2>공지사항 작성</h2></legend>
   		<form action="notice/noticeaction.jsp" method="post" enctype="multipart/form-data" name="f">
    		<table class="table table-bordered">
       			<tr>
          			<th width="150" bgcolor="#ffc34d">작성자</th>
          			<td>
             			<input type="text" class="form-control" style="width: 200px;" required="required"
               					name="id" value="관리자">                  
          			</td>
       			</tr>
       			<tr>
          			<th width="150" bgcolor="#ffc34d">제 목</th>
          				<td>
             				<input type="text" class="form-control" style="width: 500px;" required="required"
               						name="subject" placeholder="제목">                  
          				</td>
       			</tr>
       
      			 <tr>
          			<th width="150" bgcolor="#ffc34d" align="center">내용</th>
          			<td>
            			<textarea class="form-control" style="width:100%; height:300px; display:none;"
             						 name="content" id="content"></textarea>
           			</td>
       			</tr>
       			<tr>
          			<td colspan="2" align="center">
             			<input type="button" value="수정" class="button" style="width: 100px;color: white;"
               					onclick="submitContents(this)">
               
             			<input type="button" value="목록" class="button" style="width: 100px;color: white;"
               					onclick="location.href='index.jsp?main=notice/noticelist.jsp'">
          			</td>             
       			</tr>
     		</table>     
    	</form>
  		</fieldset>
</div>
<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "content",

    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",

    fCreator: "createSEditor2"

}); 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

    // 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);

 

    // 에디터의 내용에 대한 값 검증은 이곳에서

    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
    try {
        elClickedObj.form.submit();
    } catch(e) { 

    }

}

// textArea에 이미지 첨부

function pasteHTML(filepath){
    var sHTML = '<img src="<%=request.getContextPath()%>/save/'+filepath+'">';
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]); 

}

function loadContent(){
	
	$.ajax({
		type:"post",
		url:""
	})
	
}





</script>
</body>
