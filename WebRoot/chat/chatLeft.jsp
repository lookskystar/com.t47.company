<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<% 
       request.setCharacterEncoding("utf-8"); 
       String message=request.getParameter("message");
       List listMessage=(List)application.getAttribute("listMessage");
       User user=(User)session.getAttribute("user");
       if(listMessage==null){
          listMessage=new ArrayList();
       }
       application.setAttribute("listMessage",listMessage);
       if(message!=null){
           listMessage.add("<img src='/com.t47.company/image/iboy.gif' />&nbsp;<font color='blue'>"+user.getUName() + "&nbsp;<b>说：</b></font><br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
		+ message);
       }
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>左边部分</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="refresh" content="3">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"><style type="text/css">
<!--
body {
	background-color: #C7E2FC;
}
-->
</style></head>
  
  <body>
    <table cellpadding="0" cellspacing="0" border="0">
      <%
        for(int i=0;i<listMessage.size();i++){
           String mg=(String)listMessage.get(i);
        %>
           <tr>
             <td><%=mg %></td>
           </tr>
        <%}      
      %>
    </table>
  </body>
</html>
