<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="dao.impl.*" %>
<%@ page import="entity.*" %>
<%@page import="dao.UserDao"%>
<%
    String strUserId=request.getParameter("userId");
    //userName=new String(userName.getBytes("ISO-8859-1"),"UTF-8");
    int userId=0;
    if(strUserId!=null && !"".equals(strUserId)){
       userId=Integer.parseInt(strUserId);
    }
    UserDao userDao=new UserDaoImpl();
    User user=userDao.findUser(userId);
    String userName=user.getUName();
    //System.out.println(userName);
    Map maps=null;
    if(userName!=null && !"".equals(userName)){
       maps=(Map)application.getAttribute("mapUser");
       maps.remove(userName);
       session.removeAttribute("user");
       //response.sendRedirect();
       out.print("<script type='text/javascript'>window.open('/com.t47.company/index.jsp');</script>");
       
    }
    
%>
