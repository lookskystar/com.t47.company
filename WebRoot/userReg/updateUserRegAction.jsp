<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@page import="entity.*" %>
<%@page import="dao.impl.*" %>
<%@page import="dao.UserDao"%>

<%
request.setCharacterEncoding("UTF-8");
String uName=request.getParameter("uName");
String uPass=request.getParameter("uPass");
String newPwd=request.getParameter("newPwd");
String fnewPwd=request.getParameter("fnewPwd");
String genderStr=request.getParameter("gender");
String uIdentification=request.getParameter("uIdentification");
String headPath=request.getParameter("headPath");
String uAaddress=request.getParameter("uAaddress");
String uLink=request.getParameter("uLink");
String Email=request.getParameter("Email");
String uRemark=request.getParameter("uRemark");

//out.print("headPath:"+headPath);

if(
(uName==null||"".equals(uName))
||(uPass==null||"".equals(uPass))
||(newPwd==null||"".equals(newPwd))
||(fnewPwd==null||"".equals(fnewPwd))
||(genderStr==null||"".equals(genderStr))
||(uIdentification==null||"".equals(uIdentification))
||(headPath==null||"".equals(headPath))
||(uAaddress==null||"".equals(uAaddress))
||(uLink==null||"".equals(uLink))
||(Email==null||"".equals(Email))
||(uRemark==null||"".equals(uRemark))
)
{
	out.print("输入错误！");
}else{
    //out.print("newPwd:"+newPwd);
    //out.print("fnewPwd:"+fnewPwd);
	 if(!newPwd.equals(fnewPwd)){
   		out.print("新密码和重复新密码不相等，请返回！");
   }else{
         UserDao userDao=new UserDaoImpl();
         //User userPwd=new User();
         List list=new ArrayList();
         //判断用户的旧密码是否正确
         list=userDao.getListByfindUser(uName);   //通过用户名得到list。
         for(int i=0;i<list.size();i++){
         	User userList=(User)list.get(i);       //通过list得到密码
         	
         	 //判断数据库密码是否和输入的旧密码相等
         	if(userList.getUPass().equals(uPass)){       
         		//转换性别为INT型
         		int gender=Integer.parseInt(genderStr);
         		
         		//headName=loadPathName.substring(loadPathName.lastIndexOf("/")+1);
         		//String pathHeadSub=headPath.substring(16,headPath.length());
         		//out.print(pathHeadSub);

				User user=new User();
				user.setUId(userList.getUId());
				user.setUName(uName);
				user.setUPass(newPwd);
				user.setUGender(gender);
				user.setUIdentification(uIdentification);
				user.setHead(headPath);
				user.setUAaddress(uAaddress);
				user.setULink(uLink);
				user.setEmail(Email);
				user.setURemark(uRemark);
	            
				//调用函数修改用户信息
				int count=userDao.updateUser(user);
				if(count>0){
					out.print("修改用户信息成功！");
					response.sendRedirect("../login/login.jsp?msg=3");
				}else{
					out.print("修改用户信息失败！");
					response.sendRedirect("../login/login.jsp?msg=4");
				}
         		
         		
         		
         	}else{
         		out.print("你没有修改权限，请确认！");
         		response.sendRedirect("../login/login.jsp?msg=5");
         	}
         }
         
         
        
   }
}
%>