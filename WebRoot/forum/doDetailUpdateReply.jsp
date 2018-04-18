<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>

<%
        String boardIdStr=request.getParameter("boardId");       //板块Id
		String topicIdStr=request.getParameter("topicId");        //主贴Id
		String replyIdStr=request.getParameter("replyId");           //
		String userIdReplyStr=request.getParameter("userIdReply");  //回复用户Id
		String userIdTopicStr=request.getParameter("userIdTopic");  //主题用户Id
		String loginUserIdStr=request.getParameter("loginUserId");  //登入用户Id说
		
		
		out.print(":1--boardIdStr:-"+boardIdStr);
		out.print(":2--topicIdStr:-"+topicIdStr);
		out.print(":3--replyIdStr:"+replyIdStr);
		
		out.print(":4--userIdReplyStr:"+userIdReplyStr);
		out.print(":5--userIdTopicStr:"+userIdTopicStr);
		out.print(":6--loginUserIdStr:"+loginUserIdStr);
		    
	    if((boardIdStr==null||"".equals(boardIdStr))||(topicIdStr==null||"".equals(topicIdStr))||(replyIdStr==null||"".equals(replyIdStr))||(userIdReplyStr==null||"".equals(userIdReplyStr))||(userIdTopicStr==null||"".equals(userIdTopicStr))||(loginUserIdStr==null||"".equals(loginUserIdStr))){
	    out.print("数据错误！");
		}else{
		    int boardId=Integer.parseInt(boardIdStr);
			int topicId=Integer.parseInt(topicIdStr);
			int replyId=Integer.parseInt(replyIdStr);
			int userIdReply=Integer.parseInt(userIdReplyStr);
			int userIdTopic=Integer.parseInt(userIdTopicStr);
			int loginUserId=Integer.parseInt(loginUserIdStr);
		    
		     out.print(":2--topicIdStr:-"+topicIdStr);
			if(userIdReply==loginUserId){
				out.print("正常！");
			    response.sendRedirect("updateReply.jsp?boardId="+boardId+"&topicId="+topicId+"&replyId="+replyId+"&userIdReply="+userIdReply+"&userIdTopic="+userIdTopic+"&loginUserId="+loginUserId+"");
			}else{
				out.print("您没有修改此帖子的权限！");
			}
		}
	
 %>
		
		
		

