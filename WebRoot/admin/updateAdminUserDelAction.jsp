<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>

<%
   List listT=new ArrayList();  //主题list
   List listR=new ArrayList();  //回帖list
   int countT=0;   //主贴数
   int countR=0;   //回帖数
   
   int delCount=0;   //删除主贴下所有回帖数
   int delTCount=0;  //删除主贴数
   int count=0;      //删除用户数  
   
   int zCount=0;  //主贴下所有回帖总数 
   
   
   request.setCharacterEncoding("UTF-8");
   String uIDStr=request.getParameter("uID");
   	String uName=new String(request.getParameter("uName").getBytes("ISO-8859-1"),"UTF-8");
      if((uIDStr==null||"".equals(uIDStr))||(uName==null||"".equals(uName))){
   		out.print("传输错误！");   
   }else{
       int uID=Integer.parseInt(uIDStr);
      
       UserDao userDao=new UserDaoImpl();
       TopicDao topicDao=new TopicDaoImpl();
       ReplyDao replyDao=new ReplyDaoImpl();
      
       //在删除用户信息前，先判断该用户是否在论坛有主贴和回帖,如果有，则把主贴和回帖的Id分别存到List中，后跳到处理页面
       listR=replyDao.findReplyByUId(uID);
       countR=listR.size();
       
       		int num=replyDao.deleteReplyById(uID);
       	
       			
       			
       			listT=topicDao.findTopicByUId(uID);
       			countT=listT.size();
       				for(int i=0;i<countT;i++){
       					Topic topic=(Topic)listT.get(i);
       					//删除该主贴下所有回帖
       					delCount=replyDao.deleteReplyByTopicId(topic.getTopicId());
       					zCount=zCount+delCount;
       				}
       				
       						out.print("删除主贴下所有回帖成功！");
       						//删除主贴
       						delTCount=topicDao.deleteTopicById(uID);
       						
       							out.print("删除主贴成功！");
       							
       							
       							
       							
       							
       							//删除用户
       							count=userDao.deleteUser(uID);
      						    if(count>0){
       		                          out.print("删除成功！");
       		
       		                          //删除产品图片
			                          String url=application.getRealPath("/"); //获得服务器上传的路径
			                          String   filePath="/image/loadHead/"+uID;       
                                      java.io.File   myDelFile=new   java.io.File(url+filePath);   
            
			                          if(myDelFile.exists()){
			                                myDelFile.delete(); 
				                            out.print("删除头像图片成功！");	  
			                           }else{
				                            out.print("删除头像图片失败！");
			                           }
       		
       		
       		                           request.setAttribute("msg","删除用户 "+uName+" 信息成功！(删除回帖 "+countR+" 条,主贴 "+delTCount+" 条！）");
		                               request.getRequestDispatcher("updateAdminUser.jsp?page=1").forward(request,response);
                               }else{
       		                           out.print("删除成功！");
       		                           request.setAttribute("msg","删除用户 "+uName+" 信息失败！");
		                               request.getRequestDispatcher("updateAdminUser.jsp?page=1").forward(request,response);
                                }
       							
       							
       							
       							
       							
       							
       							
       					
       						
       				

    }
 %>
