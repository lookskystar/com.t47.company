<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
 <title>My JSP 'doLogout.jsp' starting page</title>
    


  </head>
  
  <body>
    <%
    	if(session.getAttribute("user")!=null){
    		session.removeAttribute("user");
    	}
    	response.sendRedirect("index.jsp");
     %>
  </body>
</html>
