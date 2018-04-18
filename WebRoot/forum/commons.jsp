<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>
<%@ page  import="entity.*" %>
<%
		User user=(User)session.getAttribute("user");
		if(user==null){
			response.sendRedirect("login.jsp?msg=0");
			//out.print("11111");
			return;   //这个返回很重要，一定要写，不然，直接访问包含该文件的网页就会报错
		}
%>



