<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>
<%@ page  import="entity.*" %>
<%
		Admin adminSe=(Admin)session.getAttribute("admin");
		if(adminSe==null){
			request.setAttribute("msg","请输入用户名和密码！");
		    request.getRequestDispatcher("/admin/adminIndex.jsp?").forward(request,response);
			return;   //这个返回很重要，一定要写，不然，直接访问包含该文件的网页就会报错
		}
%>
<!--头开始-->
<div id="mainLogin" style=" height:148px;">
 <div id="login" style="width:750px; height:148px;" align="left"><img src="${ctx }/image/d_r1_c1.jpg"></div>
</div>
<div style=" width:750px; height:18px; background-image:url(${ctx }/image/T_bottombg.gif); color:blue; font-size: 13; font-weight: 500;" align="right">【<%=adminSe.getAdminName()%>】正在操作</div>
<!--头结束-->