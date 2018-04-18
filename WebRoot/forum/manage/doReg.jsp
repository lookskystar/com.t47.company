<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="entity.*"%>
<%@page import="dao.*" %>
<%@page import="dao.impl.*" %>

<%
request.setCharacterEncoding("UTF-8");                   
String uName=request.getParameter("userName");           //取得请求中的登录名
String uPass=request.getParameter("pwd");                 //取得请求中的密码
String head=request.getParameter("head");                //取得头像图片名
int gender=Integer.parseInt(request.getParameter("gender"));    //性别
//如果reg.jsp传的是复选择框,哪么这边就应该用String[] head = request.getParameterValues("head");来接收这个数组。
//显示的时候用for循环把这个数组显示出来
UserDao userDao=new UserDaoImpl();                             //得到用户dao的实例
User user=new User();
user.setUName(uName);
user.setUPass(uPass);
user.setHead(head);
user.setUGender(gender);
int num=userDao.addUser(user);
if(num==1){                                              //判断用户是否存在
    //request.setAttribute("success","注册成功！");        //传送到index.jsp的成功信息(这样传送不了，必须经过表单提交)
	response.sendRedirect("index.jsp");
}else{
    //request.setAttribute("error","注册失败！");          //传送到reg.jsp本页面的失败信息(这样传送不了，必须经过表单提交)
	response.sendRedirect("reg.jsp");
}
 %>


<html>
  <head>
    <title>My JSP 'doReg.jsp' starting page</title>
    
  </head>
  
  <body><br><br>&nbsp; 
    This is my JSP page. <br>
  </body>
</html>
