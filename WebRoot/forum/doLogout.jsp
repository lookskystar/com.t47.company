<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

     <%
    	if(session.getAttribute("user")!=null){
    		session.removeAttribute("user");
    	}
    	response.sendRedirect("index.jsp");
     %>

