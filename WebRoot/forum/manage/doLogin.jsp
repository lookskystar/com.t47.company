<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>

<%
request.setCharacterEncoding("UTF-8");
String name=request.getParameter("userName");    //取得请求中的登录名
String password=request.getParameter("pwd");     //取得请求中的密码
List list=new ArrayList();

UserDao userDaoDo=new UserDaoImpl();               //得到用户dao的实例
//User user=new User();
//user.setUName(name);
//user.setUPass(password);
list=userDaoDo.getListByfindUser(name);            //根据请求的登录名和密码查找用户

//if(list.size()>0){
//response.sendRedirect("index.jsp");
//}else{
//out.print("登入失败！");
//}

//上机7
if(list.size()>0){
	for(int i=0;i<list.size();i++){
  		
		User user=(User)list.get(i);
		if(user!=null&&user.getUPass().equals(password)){
			session.setAttribute("user",user);        //保存用户信息
			response.sendRedirect("index.jsp");       //转发请求到首页
		}
		else {
			response.sendRedirect("login.jsp");       //转发请求到登入页面
		}
	
	}
}
else{
	response.sendRedirect("login.jsp");       //转发请求到登入页面
}
 %>

<html>
  <head>
   
    
    <title>My JSP 'doLogin.jsp' starting page</title>
    


  </head>
  
  <body> 
    <br> <br>
  </body>
</html>
