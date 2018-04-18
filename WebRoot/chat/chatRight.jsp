<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<%@page import="dao.impl.*,dao.*"  %>
<%
    Map mapUser=(Map)application.getAttribute("mapUser");
    if(mapUser==null){
        response.sendRedirect("/com.t47.company/index.jsp");
        return;
    }
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>右边部分</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="refresh" content="3">
    <style type="text/css">
<!--
.STYLE1 {color: #0000FF}
body {
	background-color: #CFFEE7;
}
-->
    </style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
  
  <body style="color: red">
  <span class="STYLE1">聊天注册人员</span>:<br/>
   <% 
        Object[] users=mapUser.keySet().toArray();
        UserDaoImpl userDao=new UserDaoImpl();
        for(int i=0;i<users.length;i++){ 
            User user=userDao.getUser(users[i].toString());
            %>
              <div><img src="/com.t47.company/image/iboy.gif"><%=user.getUName() %></div>
            <%}
    %>
  </body>
</html>
