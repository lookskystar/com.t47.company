<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="entity.*" %>
<%@page import="dao.*" %>
<%@page import="dao.impl.*" %>

<% 
	request.setCharacterEncoding("UTF-8");   

	String boardIdStr=request.getParameter("boardId");//取得post.jsp传来的隐式表单域（boardId,版块ID
	String userIdStr=request.getParameter("userId");
	//out.println("boardIdStr:"+boardIdStr);
	//out.println("userId"+userIdStr);

if((boardIdStr==null||"".equals(boardIdStr))||(userIdStr==null||"".equals(userIdStr)))
{
	out.print("输入错误！");
}
else{

	int boardId=Integer.parseInt(boardIdStr);   
	int userId=Integer.parseInt(userIdStr);

	String title=request.getParameter("titleName");      //取得帖子标题
	String content=request.getParameter("content");       //取得帖子内容
	TopicDao topicDao=new TopicDaoImpl();                 //得到主题dao的实例

	Topic topic=new Topic();
	topic.setTitle(title);
	topic.setContent(content);
	topic.setBoardId(boardId);  
	topic.setUid(userId);                                      //固定的发帖用户
	//发表时间和修改时间将由Dao类生成
	String titleName=topic.getTitle();
	out.print(titleName);
    int num=topicDao.getTileFindTopic(titleName);
    if(num<=0){
    	int count=topicDao.addTopic(topic);                    //保存主题帖子
		if(count>0){
   			response.sendRedirect("list.jsp?boardId="+boardId+"&page=1");                      //重定向 
		}else{
				response.sendRedirect("post.jsp");
		     }
	}else{
		request.setAttribute("msg","该主题已经存在！"); 
		request.getRequestDispatcher("post.jsp").forward(request,response); 
    }
   
 }  
%>

