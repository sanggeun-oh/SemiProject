<%@page import="data.dto.ShareBoardDto"%>
<%@page import="data.dao.ShareBoardDao"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//파일을 저장할 폴더
   String savePath=getServletContext().getRealPath("/shareboardsave");
   //업로드할 사이즈
   int uploadSize=1024*1024*3;//3mb
   MultipartRequest multi=null;
   try{
      multi=new MultipartRequest(request,savePath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
      String id=multi.getParameter("id");
      //System.out.println("***" +id);
      String addr=multi.getParameter("addr");
      String subject=multi.getParameter("subject");
      //html 태그 입력시 텍스트로 보이게 하기
      String content=multi.getParameter("content");
      String photo= multi.getFilesystemName("photo");
      String star=multi.getParameter("stars");
      System.out.println(savePath);
      ShareBoardDto dto = new ShareBoardDto();
      
      dto.setId(id);
      dto.setSubject(subject);
      dto.setAddr(addr);
      dto.setContent(content);
      dto.setStar(star);
      dto.setPhoto(photo==null?"no":photo);
      ShareBoardDao dao = new ShareBoardDao();
      //System.out.println(dto.getNum());
      dao.insertBoard(dto);
      //insert 된 num값 얻기
      int num=dao.getMaxNum();
      //페이지번호 읽기
      String pageNum=request.getParameter("pageNum");
      if(pageNum==null)
         pageNum="1";
      //목록으로 이동
      response.sendRedirect("../index.jsp?main=shareboard/shareboardlist.jsp");
   }catch(Exception e){
      System.out.println("업로드 오류:"+e.getMessage());
   }
%>