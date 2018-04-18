<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>

<%
		 ReplyDao replyDao=new ReplyDaoImpl();
        TopicDao topicDao=new TopicDaoImpl();

		String boardIdStr=request.getParameter("boardId");
		String topicIdStr=request.getParameter("topicId");
		String replyIdStr=request.getParameter("replyId");
		String userIdStr=request.getParameter("userId");  //主贴用户Id
		String loginUserIdStr=request.getParameter("loginUserId");  //登陆用户Id
		String replyUserIdStr=request.getParameter("replyUserId");   //回帖用户Id
		
		//out.print("topicIdStr:"+topicIdStr);
		    
	    if((boardIdStr==null||"".equals(boardIdStr))||(topicIdStr==null||"".equals(topicIdStr))||(replyIdStr==null||"".equals(replyIdStr))||(userIdStr==null||"".equals(userIdStr))||(topicIdStr==null||"".equals(topicIdStr))||(loginUserIdStr==null||"".equals(loginUserIdStr))||(replyUserIdStr==null||"".equals(replyUserIdStr))){
		}else{
		    int boardId=Integer.parseInt(boardIdStr);
			int topicId=Integer.parseInt(topicIdStr);
			int replyId=Integer.parseInt(replyIdStr);
			int userId=Integer.parseInt(userIdStr);
			int loginUserId=Integer.parseInt(loginUserIdStr);
			int replyUserId=Integer.parseInt(replyUserIdStr);
		
			if(userId==loginUserId||loginUserId==replyUserId){
				  //out.print("正常！");
				Reply reply=replyDao.findReply(replyId);
				int delCount=replyDao.deleteReply(replyId);
				//out.print(delCount);
				if(delCount>0){
				    out.print("删除成功！");
				    request.setAttribute("msg","删除回帖 "+reply.getTitle()+" 成功！");
					request.getRequestDispatcher("detail.jsp?boardId="+boardId+"&topicId="+topicId+"&page=1").forward(request,response);	
			    }else{
			    	out.print("删除失败！");
				    request.setAttribute("msg","删除回帖 "+reply.getTitle()+" 失败！");
					request.getRequestDispatcher("detail.jsp?boardId="+boardId+"&topicId="+topicId+"&page=1").forward(request,response);	
			    }
			}else{
				out.print("您没有修改此帖子的权限！");
			}
		}
	


 %>
		
		
		

