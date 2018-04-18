<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>


<%

        ReplyDao replyDao=new ReplyDaoImpl();
        TopicDao topicDao=new TopicDaoImpl();

		String boardIdStr=request.getParameter("boardId");
		String topicIdStr=request.getParameter("topicId");
		String userIdStr=request.getParameter("userId");
		String loginUserIdStr=request.getParameter("loginUserId");
		
		//out.print("topicIdStr:"+topicIdStr);
		    
	    if((boardIdStr==null||"".equals(boardIdStr))||(topicIdStr==null||"".equals(topicIdStr))||(userIdStr==null||"".equals(userIdStr))||(topicIdStr==null||"".equals(topicIdStr))||(loginUserIdStr==null||"".equals(loginUserIdStr))){
		}else{
		    int boardId=Integer.parseInt(boardIdStr);
			int topicId=Integer.parseInt(topicIdStr);
			int userId=Integer.parseInt(userIdStr);
			int loginUserId=Integer.parseInt(loginUserIdStr);
			
			//得到该主题下回复贴数，如果是0就可以删除，否则不允许删除
			int count=replyDao.findCountReply(topicId);
			Topic topic=topicDao.findTopic(topicId);
			//out.print(topic.getTitle());
		
			if(userId==loginUserId){
				//out.print(count);
				if(count==0){
					int delCount=topicDao.deleteTopic(topicId);
					if(delCount>0){
						out.print("删除成功！");
						request.setAttribute("msg","删除主题 "+topic.getTitle()+" 成功！");
					    request.getRequestDispatcher("list.jsp?boardId="+boardId+"&page=1").forward(request,response);
					}else{
						out.print("删除失败！");
						request.setAttribute("msg","删除主题 "+topic.getTitle()+" 失败！");
					    request.getRequestDispatcher("list.jsp?boardId="+boardId+"&page=1").forward(request,response);
					}
				}else{
					out.print("不能删除存在回帖的主题！");
					request.setAttribute("msg","主题 "+topic.getTitle()+" 存在回帖，不能删除！");
					request.getRequestDispatcher("detail.jsp?boardId="+boardId+"&topicId="+topicId+"&page=1").forward(request,response);
				}
			}else{
				out.print("您没有删除此帖子的权限！");
			}
		}
	


 %>
		
		
		

