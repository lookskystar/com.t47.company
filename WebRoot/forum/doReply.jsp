<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="entity.*" %>
<%@page import="dao.*" %>
<%@page import="dao.impl.*" %>

<%
request.setCharacterEncoding("UTF-8");
//int boardId=Integer.parseInt(request.getParameter("boardId"));     //接收来自reply.jsp中的版块ID（boardId）
//int topicId=Integer.parseInt(request.getParameter("topicId"));     //接收来自reply.jsp中的主题ID（topicId）
//int userId=Integer.parseInt(request.getParameter("userId"));       //接收来自reply.jsp中的登陆用户名（userId）

String boardIdStr=(String)request.getParameter("boardId");          //接收来自reply.jsp中的版块ID（boardId）
String topicIdStr=(String)request.getParameter("topicId");         //接收来自reply.jsp中的主题ID（topicId）
String userIdStr=(String)request.getParameter("userId");           ////接收来自reply.jsp中的登陆用户名（userId）

	if((boardIdStr==null||"".equals(boardIdStr))
	||(topicIdStr==null||"".equals(topicIdStr))
	||(userIdStr)==null||"".equals(userIdStr))
	{
	out.print("输入错误！");
	}else{
		int boardId=Integer.parseInt(boardIdStr);
		int topicId=Integer.parseInt(topicIdStr);
		int userId=Integer.parseInt(userIdStr);

		String title=request.getParameter("titleName");                    //回帖的标题
		String content=request.getParameter("content");                    //回帖的内容
		ReplyDao replyDao=new ReplyDaoImpl();

		Reply reply=new Reply();
		reply.setTitle(title);
		reply.setContent(content);
		reply.setTopicId(topicId);
		reply.setUid(userId);
		//回复时间和修改时间将由Dao类生成
		int count=replyDao.addReply(reply);                 //保存回帖子
		if(count>0){
            	 //可以利用重定向来中发送页面时候来传递参数
             	response.sendRedirect("detail.jsp?topicId="+topicId+"&page=1&boardId="+boardId+"&userId="+userId+"");
		}else{
				//response.sendRedirect("reply.jsp");
				out.print("增加值错误！返回重来！");
		     }
}
 %>
<html>
  <head>

    
    <title></title>

  </head>
  
  <body>
  </body>
</html>
