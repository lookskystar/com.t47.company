<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="java.io.*" %>

<%@page import="entity.*" %>
<%@page import="dao.impl.*" %>
<%@page import="dao.UserDao"%>

<%
request.setCharacterEncoding("UTF-8");
String uName=request.getParameter("uName");
String uPass=request.getParameter("uPass");
String genderStr=request.getParameter("gender");
String uIdentification=request.getParameter("uIdentification");
String headPath=request.getParameter("headPath");
String uAaddress=request.getParameter("uAaddress");
String uLink=request.getParameter("uLink");
String Email=request.getParameter("Email");
String uRemark=request.getParameter("uRemark");

if(
(uName==null||"".equals(uName))
||((uPass==null||"".equals(uPass))
||(genderStr==null||"".equals(genderStr))
||(uIdentification==null||"".equals(uIdentification))
||(headPath==null||"".equals(headPath))
||(uAaddress==null||"".equals(uAaddress))
||(uLink==null)||"".equals(uLink))
||(Email==null||"".equals(Email))
||(uRemark==null||"".equals(uRemark))
)
{
out.print("输入错误！");
}
else
{
	int gender=Integer.parseInt(genderStr);
	
	UserDao userDao=new UserDaoImpl();
	
	User user=new User();
	user.setUName(uName);
	user.setUPass(uPass);
	user.setUGender(gender);
	user.setUIdentification(uIdentification);
	user.setHead(headPath);
	user.setUAaddress(uAaddress);
	user.setULink(uLink);
	user.setEmail(Email);
	user.setURemark(uRemark);
	
	int count=userDao.addUser(user);
	if(count>0){
	    User userList=null;
	    List list=new ArrayList();
	    list=userDao.getListByfindUser(user.getUName());
	    for(int i=0;i<list.size();i++){
	     	 userList=(User)list.get(i);
	     }
	   		 //如果添加用户成功，则建立这个用户的一个上传头像目录
	   		 String path=application.getRealPath("/");    //获得上传的路径
	    	 File file=new File(path+"/image/loadHead/"+userList.getUId()+"/");
	    
	         if(file.mkdir()){
	            out.print("文件夹创建成功！");
	    	    response.sendRedirect("/com.t47.company/login/login.jsp?msg=0");       //转发请求到登入页面
	         }else{
	    	    out.print("文件夹创建失败！");
	         }
	    }else{
	           out.print("失败！");
		       response.sendRedirect("/com.t47.company/userReg/userReg.jsp?msg=1");       //转发请求到登入页面
	}	
}


 %>

