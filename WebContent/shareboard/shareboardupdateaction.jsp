<%@page import="data.dao.ShareBoardDao"%>
<%@page import="data.dto.ShareBoardDto"%>

<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //업로드할 save폴더의 실제 서버에서의 위치 구하기
   String realPath=getServletContext().getRealPath("/shareboardsave");
   System.out.println(realPath);
   //업로드할 이미지의 크기제한
   int uploadSize=1024*1028*2;//2mb;
   
   MultipartRequest multi=null;
   try{
      multi=new MultipartRequest(request,realPath,uploadSize,
            "utf-8",new DefaultFileRenamePolicy());
      //입력한 데이터 읽기
      String num=multi.getParameter("num");
      System.out.println(num);
      String photo=multi.getFilesystemName("photo");
   
      String content=multi.getParameter("content");
      String subject=multi.getParameter("subject");
      String addr=multi.getParameter("addr");
      String stars = multi.getParameter("stars");
      
      //dto에 넣기
      ShareBoardDto dto = new ShareBoardDto();
      dto.setNum(num);
      dto.setPhoto(photo==null?"no":photo);
      dto.setContent(content);
      dto.setAddr(addr);
      dto.setSubject(subject);
      dto.setStar(stars);
      
      //dao 선언
      ShareBoardDao dao = new ShareBoardDao();
      //메서드 호출
      dao.updateShardBoard(dto);
      //방명록 페이지로 이동
      response.sendRedirect("../index.jsp?main=shareboard/shareboardlist.jsp");
   }catch(Exception e){
      System.out.println("업로드 오류:"+e.getMessage());
   }
   



%>