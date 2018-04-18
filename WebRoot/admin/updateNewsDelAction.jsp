<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>

<%
   request.setCharacterEncoding("UTF-8");
   String newsIDStr=request.getParameter("newsID");
   	String title=new String(request.getParameter("title").getBytes("ISO-8859-1"),"UTF-8");
      if((newsIDStr==null||"".equals(newsIDStr))||(title==null||"".equals(title))){
   		out.print("传输错误！");   
   }else{
       int newsID=Integer.parseInt(newsIDStr);
      
       NewsDao newsDao=new NewsDaoImpl();
       int count=newsDao.deleteNews(newsID);
       if(count>0){
       		out.print("删除成功！");
       		request.setAttribute("msg","删除新闻 "+title+" 信息成功！");
		    request.getRequestDispatcher("updateNews.jsp?page=1").forward(request,response);
       }else{
       		out.print("删除成功！");
       		request.setAttribute("msg","删除新闻 "+title+" 信息失败！");
		    request.getRequestDispatcher("updateNews.jsp?page=1").forward(request,response);
       }

    }
 %>
