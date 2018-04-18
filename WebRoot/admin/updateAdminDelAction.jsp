<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>

<%
   request.setCharacterEncoding("UTF-8");
   String adminIDStr=request.getParameter("adminID");
   	String adminName=new String(request.getParameter("adminName").getBytes("ISO-8859-1"),"UTF-8");
      if((adminIDStr==null||"".equals(adminIDStr))||(adminName==null||"".equals(adminName))){
   		out.print("传输错误！");   
   }else{
       int adminID=Integer.parseInt(adminIDStr);
      
       AdminDao adminDao=new AdminDaoImpl();
       int count=adminDao.delAdmin(adminID);
       if(count>0){
       		out.print("删除成功！");
       		request.setAttribute("msg","删除管理员 "+adminName+" 信息成功！");
		    request.getRequestDispatcher("updateAdmin.jsp").forward(request,response);
       }else{
       		out.print("删除成功！");
       		request.setAttribute("msg","删除管理员 "+adminName+" 信息失败！");
		    request.getRequestDispatcher("updateAdmin.jsp").forward(request,response);
       }

    }
 %>