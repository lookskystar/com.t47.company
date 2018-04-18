<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>

<%
    String newsIdStr=request.getParameter("newsId");
    if(newsIdStr==null||"".equals(newsIdStr)){
    	out.print("输入错误！");
    }else{
        int newsId=Integer.parseInt(newsIdStr);
        
        NewsDao newsDao=new NewsDaoImpl();
        News news=new News();
        news=newsDao.findNews(newsId);	
        
        if(news==null){
         	out.print("没有条新闻！");
        }else{
        	    //response.sendRedirect("newsDetail.jsp"); 
        	    request.setAttribute("news",news);
        	    request.getRequestDispatcher("newsDetail.jsp").forward(request,response);
        	    
        		//out.print(news.getTitle());
        	}
     }
    

 %>
