<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="entity.*" %>
<%@page import="dao.*" %>
<%@page import="dao.impl.*" %>

<%
request.setCharacterEncoding("UTF-8");
int boardId=Integer.parseInt(request.getParameter("boardId"));     //接收来自reply.jsp中的版块ID（boardId）
int topicId=Integer.parseInt(request.getParameter("topicId"));     //接收来自reply.jsp中的主题ID（topicId）
int userId=Integer.parseInt(request.getParameter("userId"));       //接收来自reply.jsp中的登陆用户名（userId）
String title=request.getParameter("titleName");                    //回帖的标题
String content=request.getParameter("content");                    //回帖的内容
ReplyDao replyDao=new ReplyDaoImpl();
//int topicId=2;                              //主题ID固定

Reply reply=new Reply();
reply.setTitle(title);
reply.setContent(content);
reply.setTopicId(topicId);
reply.setUid(userId);
//回复时间和修改时间将由Dao类生成

		
		int count=replyDao.addReply(reply);                 //保存主题帖子
		if(count>0){
             //可以利用重定向来中发送页面时候来传递参数
             response.sendRedirect("detail.jsp?topicId="+topicId+"&page=1&boardId="+boardId+"");
		}else{
				
				response.sendRedirect("post.jsp");
		     }

 %>
<html>
  <head>

    
    <title>My JSP 'doReplyDao.jsp' starting page</title>

  </head>
  
  <body>iipaga&nbsp; 
    This is my JSP page. <br>
  </body>
</html>
