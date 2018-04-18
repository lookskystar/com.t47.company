<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>

<%
 request.setCharacterEncoding("UTF-8");
 String adminUser=request.getParameter("adminUser");
 String adminPwd=request.getParameter("adminPwd");
 String levelSelStr=request.getParameter("levelSel");

 //out.print("adminUser:"+adminUser);
  //out.print(":adminPwd:"+adminPwd);
   //out.print(":levelSel:"+levelSel);
 
 if((adminUser==null||"".equals(adminUser))||(adminPwd==null||"".equals(adminPwd))||(levelSelStr==null||"".equals(levelSelStr))){
 	out.print("输入错误");	
 }else{
    AdminDao adminDao=new AdminDaoImpl();
    List list=new ArrayList();
    list=adminDao.ListByFindAdmin();
    out.print(list.size());
    if(list.size()>=10){
      out.print("管理人员人数已满！");
    }else{
    
    	int levelSel=Integer.parseInt(levelSelStr);
 
 
   		 Admin admin=new Admin();
 		 admin.setAdminName(adminUser);
 	     admin.setAdminPass(adminPwd);
 	     admin.setAdminStatus(levelSel);
 	

 	
 	     int count=adminDao.addAdmin(admin);

 	     if(count>0){
 	         out.print("插入成功！");
 	         request.setAttribute("msg","插入管理员 "+adminUser+" 信息成功！");
		    request.getRequestDispatcher("addAdmin.jsp").forward(request,response);
 	     }else{
 	         out.print("插入失败！");
 	         request.setAttribute("msg","插入管理员 "+adminUser+" 信息失败！");
		    request.getRequestDispatcher("addAdmin.jsp").forward(request,response);
 	    }
  }
 }
%>