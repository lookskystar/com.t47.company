<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="entity.*" %>
<%@page import="dao.*" %>
<%@page import="dao.impl.*" %>
<%
TopicDao topicDao=new TopicDaoImpl();

request.setCharacterEncoding("UTF-8");
String boardIdStr=request.getParameter("boardId");
String topicIdStr=request.getParameter("topicId");
String titleName=request.getParameter("titleName");
String content=request.getParameter("content");

if((boardIdStr==null||"".equals(boardIdStr))||(topicIdStr==null||"".equals(topicIdStr))||(titleName==null||"".equals(titleName))||(content==null||"".equals(content))){

}else{
   
    Topic topic=new Topic();
    
    int boardId=Integer.parseInt(boardIdStr);
    int topicId=Integer.parseInt(topicIdStr);
    
    topic.setTopicId(topicId);
    topic.setTitle(titleName);
    topic.setContent(content);
    
    out.print("topicId:"+topicId+"--");
    out.print("titleName:"+titleName+"--");
    out.print("content:"+content+"--");
	int count=topicDao.updateTopic(topic);
	Topic topicTile=topicDao.findTopic(topicId);
	if(count>0){
		out.print("修改主题成功！");
		request.setAttribute("msg","删除回帖 "+topicTile.getTitle()+" 成功！");
		request.getRequestDispatcher("detail.jsp?topicId="+topicId+"&page=1&boardId="+boardId+"").forward(request,response);	
	}else{
		out.print("修改主题失败！");
		request.setAttribute("msg","删除回帖 "+topicTile.getTitle()+" 失败！");
		request.getRequestDispatcher("detail.jsp?topicId="+topicId+"&page=1&boardId="+boardId+"").forward(request,response);	
	}
}

%>