<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<%@include file="/commons/taglibs.jsp" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>聊天页面</title>
   
   
   <script type="text/javascript">
<!--

//-->
</script>
  </head>
   <frameset rows="80%,*" cols="*" frameborder="no" >
      <frameset cols="85%,*">
         <frame name="leftFrame" src="/com.t47.company/chat/chatLeft.jsp" noresize="noresize" >
         <frame name="rightFrame" src="/com.t47.company/chat/chatRight.jsp" noresize="noresize">
      </frameset>
      <frame name="bottomFrame" src="/com.t47.company/chat/chatBottom.jsp" noresize="noresize"> 
    </frameset>
  
  <body>
    <%
        User user=(User)session.getAttribute("user");
        if(user==null){
          //request.getRequestDispatcher("../login/login.jsp?msg=0").forward(request,response);
          response.sendRedirect("../login/login.jsp?msg=0");
           
        }
     %>
  </body>
</html>
