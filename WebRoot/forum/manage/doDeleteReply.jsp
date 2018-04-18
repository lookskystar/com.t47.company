<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>

<%
   /*
	UserDao userDao=new UserDaoImpl();
	ReplyDao replyDao=new ReplyDaoImpl();
	
	
    String replyIdStr=(String)request.getParameter("replyId");            //回帖Id
    String replyUserIdStr=(String)request.getParameter("replyUserId");    //回帖用户Id
    String loginUserIdStr=(String)request.getParameter("loginUserId");    //登入用户Id 
	
	if((replyIdStr==null||"".equals(replyIdStr))
	||(replyUserIdStr==null||"".equals(replyUserIdStr))
	||(loginUserIdStr==null||"".equals(loginUserIdStr))){
		request.setAttribute("infor","回帖Id、回帖用户Id、登陆用户Id为空或不存在！");
		request.getRequestDispatcher("detail.jsp").forward(request,response);
	}else{
		int replyIdInt=Integer.parseInt(replyIdStr);
		int replyUserIdInt=Integer.parseInt(replyUserIdStr);
		int loginUserIdInt=Integer.parseInt(loginUserIdStr);
		
		if(replyUserIdInt!=loginUserIdInt){
			request.setAttribute("infor","您不是该回复用户，不能删除该回帖！");
			request.getRequestDispatcher("detail.jsp").forward(request,response);
		}else{
			int count=replyDao.deleteReply(replyIdInt);
			if(count>0){
				request.setAttribute("infor","删除回帖成功！");
			    request.getRequestDispatcher("detail.jsp").forward(request,response);
			}else{
				request.setAttribute("infor","删除回帖失败");
				request.getRequestDispatcher("detail.jsp").forward(request,response);
			}
		}
		
	}
	*/
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'doDeleteReply.jsp' starting page</title>
 

  </head>
  
  <body>
    This is my JSP page. <br>
  </body>
</html>
