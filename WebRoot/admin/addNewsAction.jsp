<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="entity.News"/>
<jsp:directive.page import="dao.impl.NewsDaoImpl"/>
<%@page import="dao.NewsDao"%>
<%
	request.setCharacterEncoding("UTF-8");

	String newsName= request.getParameter("newsName");
	String newsContent=request.getParameter("newsContent");
	
    if((newsName==null||"".equals(newsName))
    ||(newsContent==null||"".equals(newsContent))){
    	out.print("输入错误！");
    }else{
            
            
            News news=new News();
            news.setTitle(newsName);
            news.setContent(newsContent);
            
			NewsDao newsDao=new NewsDaoImpl();
			int count=newsDao.addNews(news);
			if(count>0){
				out.print("添加成功！");
		    	response.sendRedirect("addNews.jsp?page=1&msg=0");
			}else{
				out.print("添加失败！");
		    	response.sendRedirect("addNews.jsp?page=1&msg=1");
			}
			
			


	}
	%>
