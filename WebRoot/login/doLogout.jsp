<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="entity.User"%>


    <%
        //陈斌杰
        Map mapUser=(Map)application.getAttribute("mapUser");
        User user=(User)session.getAttribute("user");
        if(mapUser!=null){
           mapUser.remove(user);
        }
        if(user!=null){
           session.removeAttribute("user");
        }
    	  //if(session.getAttribute("user")!=null){
    		// session.removeAttribute("user");
    	 // }
    	response.sendRedirect("/com.t47.company/index.jsp");
     %>

