<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="entity.*" %>
<%@page import="dao.*" %>
<%@page import="dao.impl.*" %>
<%
TopicDao topicDao=new TopicDaoImpl();
ReplyDao replyDao=new ReplyDaoImpl();

request.setCharacterEncoding("UTF-8");
String boardIdStr=request.getParameter("boardId");
String topicIdStr=request.getParameter("topicId");
String replyIdStr=request.getParameter("replyId");
String titleName=request.getParameter("titleName");
String content=request.getParameter("content");

if((boardIdStr==null||"".equals(boardIdStr))||(topicIdStr==null||"".equals(topicIdStr))||(replyIdStr==null||"".equals(replyIdStr))||(titleName==null||"".equals(titleName))||(content==null||"".equals(content))){

}else{
   
    Topic topic=new Topic();
    Reply reply=new Reply();
    
    int boardId=Integer.parseInt(boardIdStr);
    int topicId=Integer.parseInt(topicIdStr);
    int replyId=Integer.parseInt(replyIdStr);
    
    reply.setReplyId(replyId);
    reply.setTopicId(topicId);
    reply.setTitle(titleName);
    reply.setContent(content);
    
    //out.print("topicId:"+topicId+"--");
    //out.print("titleName:"+titleName+"--");
    //out.print("content:"+content+"--");
	int count=replyDao.updateReply(reply);
	//out.print(count);
	Reply replyTile=replyDao.findReply(replyId);
	//out.print(replyTile.getTitle());
	if(count>0){
    out.print("topicId:"+topicId+"--");
    out.print("titleName:"+titleName+"--");
    out.print("content:"+content+"--");
    
         
		out.print("修改回帖成功！");
		request.setAttribute("msg","修改回帖 "+replyTile.getTitle()+" 成功！");
		request.getRequestDispatcher("detail.jsp?topicId="+topicId+"&page=1&boardId="+boardId+"").forward(request,response);	
		//request.setAttribute("msg","修改回帖 "+replyTile.getTitle()+" 成功！");
		//request.getRequestDispatcher("test.jsp?topicId="+topicId+"").forward(request,response);	
	}else{
		out.print("修改回帖失败！");
		request.setAttribute("msg","修改回帖 "+replyTile.getTitle()+" 失败！");
		request.getRequestDispatcher("detail.jsp?topicId="+topicId+"&page=1&boardId="+boardId+"").forward(request,response);	
	}
}

%>