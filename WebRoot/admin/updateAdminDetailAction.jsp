<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>

<%
   request.setCharacterEncoding("UTF-8");
   String adminIDStr=request.getParameter("adminID");
   String adminUser=request.getParameter("adminUser");
   String adminPwd=request.getParameter("adminPwd");
      if((adminIDStr==null||"".equals(adminIDStr))||(adminUser==null||"".equals(adminUser))||(adminPwd==null||"".equals(adminPwd))){
   		out.print("传输错误！");   
   }else{
       int adminID=Integer.parseInt(adminIDStr);
       Admin admin=new Admin();
       admin.setAdminId(adminID);
       admin.setAdminName(adminUser);
       admin.setAdminPass(adminPwd);
       AdminDao adminDao=new AdminDaoImpl();
       int count=adminDao.updateAdmin(admin);
       if(count>0){
       	    out.print("修改成功！");
       		request.setAttribute("msg","修改管理员 "+adminUser+" 信息成功！");
		    request.getRequestDispatcher("updateAdminDetail.jsp").forward(request,response);
       }else{
       		out.print("修改失败！");
       		request.setAttribute("msg","修改管理员 "+adminUser+" 信息失败！");
		    request.getRequestDispatcher("updateAdminDetail.jsp").forward(request,response);
       }

    }
 %>

