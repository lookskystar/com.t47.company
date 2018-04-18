<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>

<%
   request.setCharacterEncoding("UTF-8");
   String newsIDStr=request.getParameter("newsID");
   String newsName=request.getParameter("newsName");
   String newsContent=request.getParameter("newsContent");
        if((newsIDStr==null||"".equals(newsIDStr))||(newsName==null||"".equals(newsName))||(newsContent==null||"".equals(newsContent))){
   		out.print("传输错误！");   
   }else{
       int newsID=Integer.parseInt(newsIDStr);
       News news=new News();
       news.setNewsId(newsID);
       news.setTitle(newsName);
       news.setContent(newsContent);
      
       NewsDao newsDao=new NewsDaoImpl();
       int count=newsDao.updateNews(news);
       if(count>0){
       	    out.print("修改成功！");
       		request.setAttribute("msg","修改新闻 "+newsName+" 信息成功！");
		    request.getRequestDispatcher("updateNews.jsp?page=1").forward(request,response);
       }else{
       		out.print("修改失败！");
       		request.setAttribute("msg","修改新闻 "+newsName+" 信息失败！");
		    request.getRequestDispatcher("updateNews.jsp?page=1").forward(request,response);
       }

    }
 %>


