<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>

<%
        String boardIdStr=request.getParameter("boardId");
		String topicIdStr=request.getParameter("topicId");
		String userIdStr=request.getParameter("userId");
		String loginUserIdStr=request.getParameter("loginUserId");
		
		//out.print("topicIdStr:"+topicIdStr);
		    
	    if((topicIdStr==null||"".equals(topicIdStr))||(userIdStr==null||"".equals(userIdStr))||(topicIdStr==null||"".equals(topicIdStr))||(loginUserIdStr==null||"".equals(loginUserIdStr))){
		}else{
			int topicId=Integer.parseInt(topicIdStr);
			int userId=Integer.parseInt(userIdStr);
			int loginUserId=Integer.parseInt(loginUserIdStr);
			int boardId=Integer.parseInt(boardIdStr);
		
			if(userId==loginUserId){
				out.print("正常！");
			    response.sendRedirect("updateTopic.jsp?boardId="+boardId+"&topicId="+topicId+"&userId="+userId+"&loginUserId="+loginUserId+"");
			}else{
				out.print("您没有修改此帖子的权限！");
			}
		}
	


 %>
		
		
		

