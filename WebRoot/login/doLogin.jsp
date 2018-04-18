<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>




<%
request.setCharacterEncoding("UTF-8");
String name=request.getParameter("userName");    //取得请求中的登录名
String password=request.getParameter("pwd");     //取得请求中的密码
//System.out.println("name:"+name);
if((name==null||"".equals(name))||(password==null||"".equals(password))){
	out.print("输入错误！");
}else{



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
		     //out.print(user.getUName()+":"+user.getUIdentification());
			session.setAttribute("user",user);        //保存用户信息
			
			//把所有的登陆用户存放到application里，陈斌杰
		    Map mapUser=(Map)application.getAttribute("mapUser");
			if(mapUser==null){
			   mapUser=new HashMap();
			}
			application.setAttribute("mapUser",mapUser);
			Object[] keys=mapUser.keySet().toArray();
			for(int j=0;j<keys.length;j++){
			    if(name.equals(keys[i])){
			       // out.print("<script type='text/javascript'>window.location.href='login.jsp?msg=2';</script>");
			        out.print("<script type='text/javascript'>window.location.href='../index.jsp';</script>");
			        //out.print("该用户在线");
			        return;
			    }
			}
			mapUser.put(name,user); 
			//System.out.println("mapUser:"+mapUser.keySet().toString());
			response.sendRedirect("/com.t47.company/index.jsp");       //转发请求到首页
			//out.print("登陆成功！");
		}
		else {
			response.sendRedirect("login.jsp?msg=1");       //转发请求到登入页面
		}
	}
}
else{
	response.sendRedirect("login.jsp?msg=1");       //转发请求到登入页面
}


}
 %>
 


