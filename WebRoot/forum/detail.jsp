<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@include file="/commons/taglibs.jsp" %>

<%@ page import="entity.*"%>
<%@ page import="dao.*"%>
<%@ page import="dao.impl.*"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>


<%//@ include file="commons.jsp"%>
<%
	try {
	    request.setCharacterEncoding("UTF-8");
	    
		TopicDao topicDao = new TopicDaoImpl(); //得到主题dao的实例
		ReplyDao replyDao = new ReplyDaoImpl(); //得到回复dao的实例
		UserDao userDao = new UserDaoImpl(); //得到用户dao的实例
		BoardDao boardDao = new BoardDaoImpl();
		Board board = new Board();

		String topicIdStr = request.getParameter("topicId"); //接收来自list.jsp的主题id
		String boardIdStr = request.getParameter("boardId"); //板块Id
		String pStr = request.getParameter("page"); //页数
		
		//得到返回的信息
		String msg=(String)request.getAttribute("msg");
	    //out.print("msg:"+msg);
		if(msg==null||"".equals(msg)){
			msg="无信息！";
		}

		int pageCount = 0; //保存最大页面值
		if ((topicIdStr == null || "".equals(topicIdStr))
				|| (boardIdStr == null || "".equals(boardIdStr))) {
		} else {
		
			int p = 1;
			int boardId = 0;
			int topicId = 0;
			List listReply = new ArrayList();
          
			boardId = Integer.parseInt(boardIdStr);
			topicId = Integer.parseInt(topicIdStr);
			p = Integer.parseInt(pStr); //获得当前页面数

			//out.print("boardId:="+boardId);
			board = boardDao.findBoard(boardId); //取得板块信息
			Topic topic = topicDao.findTopic(topicId); //取得主题信息
			User topicUser = userDao.findUser(topic.getUid()); //取得主题作者
			listReply = replyDao.findListReply(p, topicId); //取得该主题回复列表
			int num = replyDao.findCountReply(topicId); //取得该主题回复条数
			pageCount = replyDao.getCountRows(topicId); //取得总页数
			
		    //out.print(topicId);
		    //out.print(topic.getTopicId());
		    
		    //更新该主题的点击次
			int icount=topicDao.updateClickCount(topicId);
			    

			
			
			//当前页数最大最小判断，如果小于最小页面就等于最小页面，大于最大页面就等于最大页面
			if (p < 1) {
				p = 1;
			}
			if (p > pageCount) {
				p = pageCount;
			}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

         
		<title>问红人生论坛-看帖</title>
		<LINK href="style.css" type="text/css" rel="stylesheet">
		<style type="text/css">

body {
	font-size: 12px;
}

.titleName {
	background-color: #E8E8E8;
	font-size: 14px;
	color: #000000;
	font-weight: 700;
}

</style>
		<script type="text/javascript">
		<!--
		      function findPage(page,pageCount,topicId,boardId){
		            if(page<1){
		            	page=1;
		            }
		            if(page>pageCount){
		            	page=pageCount;
		            }
			  		location.href="detail.jsp?page="+page+"&topicId="+topicId+"&boardId="+boardId;
			  		}
		//-->
	</script>
	<!--  自动换行1
	<script type="text/javascript">
			function toBreakWord(intLen, id){
			var obj=document.getElementById(id);
			var strContent=obj.innerHTML; 
			var strTemp="";
			while(strContent.length>intLen){
   				strTemp+=strContent.substr(0,intLen)+"<br>"; 
   				strContent=strContent.substr(intLen,strContent.length); 
			}
			strTemp+= strContent;
			obj.innerHTML=strTemp;
}
</script>
	-->
	
	<script type="text/javascript">   
	//自动换行2（可以显示图片的）    
//函数功能：在指定长度处自动添加换行符，以英文长度为准，及8代表8个英文或4个汉字  
     function fnAddBr(id, iPerLineLen){  
        var sStr=document.getElementById(id).innerHTML;  
        if(sStr.replace(/[^\x00-\xff]/g,"xx").length <= iPerLineLen){  
            return -1;  
        }  
      
        var str="";  
        var l=0;  
        var schar;  
        for(var i=0;schar=sStr.charAt(i);i++){  
            str+=schar;  
            l+=(schar.match(/[^\x00-\xff]/)!=null?2:1);  
            if(l>= iPerLineLen){  
                str+="\n";  
                l=0;  
            }  
        }  
        document.getElementById(id).innerHTML=str;  
    }  
    </script>  
	
	</head>

	<body>
	
		<!--最外层div开始-->
		<div style="width: 953px; height: 1000px;" align="center">
			<div style="width: 750px; height: 1000px;" align="center">

				<!--头开始-->
				<div style="width: 750px; height: 150px">
					<!-- 用户信息、登录、注册 -->
					<%@ include file="loginCommons.jsp"%>
				</div>
				<!--头结束-->
				
			  
              
				<!--论坛首页开始-->
				<div style="width: 750px; height: 30px; padding-top: 10px;"
					align="left">
					
					<font style="font-size: 14px; font-weight: 900;"> >><a
					href="index.jsp">论坛首页</a> >> <a
					href="list.jsp?boardId=<%=board.getBoardId()%>&page=1"><%=board.getBoardTitle()%></a>>>
						<%=topic.getTitle()%></font>
				</div>
				<!--论坛首页结束-->
                 
				<!-- 回 新 贴，新 主 题，菜单开始(顶层)-->
				<div
					style="width: 750px; height: 30px; padding-left: 0px; padding-top: 10px;"
					align="left">
					<table width="182" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="12">
								<img src="image/titlemu_1.gif" width="12" height="25">
							</td>
							<td width="54" align="center"  style="background-image:url(image/titlemu_2.gif); background-repeat:no-repeat;">
								<a href="reply.jsp?boardId=<%=boardId%>&topciId=<%=topicId%>">回
									新 贴</a>
							</td>
							<td width="14">
								<img src="image/titlemu_3.gif" width="12" height="25">
							</td>
							<td width="22">&nbsp;
								
							</td>
							<td width="12">
								<img src="image/titlemu_1.gif" width="12" height="25">
							</td>
							<td width="49" align="center" style="background-image:url(image/titlemu_2.gif); background-repeat:no-repeat;">
								<a href="post.jsp?boardId=<%=boardId%>">新 主 题</a>
							</td>
							<td width="19">
								<img src="image/titlemu_3.gif" width="12" height="25">
							</td>
						</tr>
					</table>
				</div>
				<!--回 新 贴，新 主 题，结束-->

				<!--上一页，下一页开始-->
				<div
					style="width: 750px; height: 30px; padding-left: 0px; padding-top: 10px; padding-bottom: 10px;"
					align="right">
					<input type="button"
						onClick="findPage(<%=p - 1%>,<%=pageCount%>,<%=topicId%>,<%=boardId%>)"
						value="上一页"
						style="background-image: url(image/next.gif); width: 73px; height: 29px; border: none;">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button"
						onClick="findPage(<%=p + 1%>,<%=pageCount%>,<%=topicId%>,<%=boardId%>)"
						value="下一页"
						style="background-image: url(image/next.gif); width: 73px; height: 29px; border: none;">
				</div>
				<!--上一页，下一页结束-->

				<!--+显示页数开始+-->
				
				<%
				//如果是0页就显示1页
				int count=pageCount;
				int ip=p;
				if(pageCount==0){
					count=1;
					ip=1;
				}
				 %>
			  <div
					style="width: 750px; height: 25px; border-left: 1px #FF0000 solid; border-right: 1px #FF0000 solid; font: 13px; color: #FFFFFF; background-image: url(image/title.gif); font-size: 12px; color: #333333;"
					align="left">
					&nbsp;&nbsp;共&nbsp;<%=count%>&nbsp;页(每页&nbsp;6&nbsp;条回复)&nbsp;&nbsp;现在是第&nbsp;
					<font color="#FF0000"><%=ip%></font>&nbsp;页 &nbsp;&nbsp;有&nbsp;<%=num%>
					&nbsp;条回复&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF0000">提示信息：<%=msg %></font>
				</div>
				<!--+显示页数end+-->


				<%
					//if (p == 1) {
				%>
				<!--主题开始-->
				<!--  <div style="width: 750px; height: 150 px;">-->
					<table width="750" border="0" cellpadding="0" cellspacing="0"
						style="border-left: 1px solid #FF0000; border-right: 1px solid #FF0000; border-bottom: 1px dotted #FF0000; font-size: 12px;"
						height="203">
						<tbody>
						
							<tr>
								<td height="25" colspan="4" background="image/d_r11_15.jpg"
									style="background-color: #CACACA; border-top: 2px #CCCCCC; font: 13px; color: #FFFFFF; font-weight: 900;">
									&nbsp; 本页主题：
									<!--
								  <a href="detail.jsp?page=1&boardId=<%=boardId%>">-->
									<%=topic.getTitle()%><%//=topic.getTopicId()%><!--</a>-->
								</td>
							</tr>
							<tr>
								<td width="203" rowspan="2" valign="top"
									style="border-right: 1px #FF0000 dotted; color: #0066FF">

									<table width="100" border="0" cellpadding="0" cellspacing="0"
										style="border-bottom: 1px #FF0000 dotted;">
										<tr
											style="border-bottom: 1px #FF0000; border-right: 1px #FF0000 dotted;">
										  <td width="100" height="25" valign="top"
												style="padding-left: 3px; padding-top: 3px; font-size: 12px; color: blue"><%=topicUser.getUName()%>&nbsp;</td>
										</tr>
										<tr
											style="border-bottom: 1px #FF0000; border-right: 1px #FF0000 dotted;">
											<td valign="top">
												<img src="${ctx }<%=topicUser.getHead()%>" width="70" height="70">											</td>
										</tr>
										<tr>
											<td valign="top"
												style="font-size: 12px; color: #FF0000; padding-left: 3px">
												注册：<%=topicUser.getRegTime().toString().substring(
										0, 16)%></td>
										</tr>
										<tr>
										  <td valign="top"
												style="font-size: 12px; color: #FF0000; padding-left: 0px">ID:[<%=topicUser.getUNumber()%>]</td>
									  </tr>
									</table>
							  </td>
								<td colspan="3" valign="middle" style="width: 630px;">
									<table width="630" height="7%" border="0" cellpadding="0"
										cellspacing="0" style="table-layout:fixed;   word-break:break-all;">
										<tr>
											<td width="630" height="25" class="titleName"
												style="background-image: url(image/titlemu_2.gif);">
												<font color="#FF0000">【主题】<%=topic.getTitle()%></font>
											</td>
										</tr>
										<tr>
								<td name="replyContent" id="replyContent" background="image/bg.gif"
												style="overflow:hidden;background-color: #EFEFEF; font-size: 15px; font-family: '新宋体'; color: #000000; border-top: 1px #FF0000 dotted; border-bottom: 1px #FF0000 dotted; padding-left: 8px; letter-spacing: 0.2em; line-height: 150%; word-wrap: break-word; word-break: break-all; width: 579px; padding-bottom: 20px;">
											  <p>
													【内容】
													<br />
&nbsp;&nbsp;&nbsp;&nbsp;<%=topic.getContent()%>
											  <br />
											  <br />
										  </td>
											
											<script type="text/javascript"> 
											//自动换行2（可以显示图片的） 
                                            fnAddBr("content",40);  
                                           // fnAddBr("content1",50);  
</script> 
<!--<script language="javascript">toBreakWord(60, "content");</script>  --> 
										</tr>
										<tr>
											<td width="630" align="right"
												style="width: 630px;font-size: 12px; color: #FF0000;">
												<img src="image/chinaxin.gif" width="42" height="40">【发表】[<%=topic.getPublisTime().toString().substring(0,
										16)%>]
												【最后修改】[<%=topic.getModifyTime().toString().substring(0,
										16)%>]
										  </td>
										</tr>
									</table>
							

							<tr>
								<td width="31" height="2%">
									<a href="#"></a>								</td>
								<td width="598" align="right">
								<%
									if(loginUser!=null&&loginUser.getUId()==topic.getUid()){
								 %>
									<% 
									//out.print(topic.getTopicId());
									//out.print("topicUid:"+topic.getUid());
									//out.print("loginUser:"+loginUser.getUId());
									//out.print(loginUser.getUId());
									//out.print(board.getBoardId());
									%>
									  <a href="doDetailUpdateTopic.jsp?boardId=<%=board.getBoardId()%>&topicId=<%=topic.getTopicId()%>&userId=<%=topic.getUid()%>&loginUserId=<%=loginUser.getUId()%>">[修改]</a>&nbsp;
									  <a href="doDetailDelTopic.jsp?boardId=<%=board.getBoardId()%>&topicId=<%=topic.getTopicId()%>&userId=<%=topic.getUid()%>&loginUserId=<%=loginUser.getUId()%>">[删除]</a>&nbsp;&nbsp;&nbsp;&nbsp;
								<% 
								    }else if(loginUser==null||loginUser.getUId()!=topicUser.getUId()){
								%>
								               <!--  
								                 无&nbsp;[修改]&nbsp;&nbsp;
								   	          [删除]&nbsp;权限&nbsp;&nbsp;&nbsp;&nbsp;
								   	          -->
								<%
									}
								 %>
							  </td>
								<td width="1">
									<br>
								</td>
							</tr>
					</table>
				<!--</div>-->
				<!--主题结束-->

				<br>

				<%
					//}
							for (int i = 0; i < listReply.size(); i++) {
								Reply reply = (Reply) listReply.get(i); //循环取得回复信息
								User replyUser = (User) userDao
										.findUser(reply.getUid());
				%>
				<!--回复开始-->
				<div style="width: 750px; height: 15% px;">
					<table width="750" border="0" cellpadding="0" cellspacing="0"
						style="border-left: 1px #FF0000 solid; border-right: 1px #FF0000 solid; font-size: 12px;"
						height="134">
						<tbody>
							<tr>
								<td height="25" colspan="4"
									style="background-image: url(image/titlemu_2.gif);">
									&nbsp; 回复：<%=num - (p * 6 - 6) - i%>
								</td>
							</tr>
							<tr>
								<td width="179" rowspan="2" valign="top"
									style="border-right: 1px #FF0000 dotted; color: #0099FF">
									<table width="100" border="0" cellpadding="0" cellspacing="0"
										style="border-bottom: 1px #FF0000 dotted;">
										<tr>
											<td height="25"
												style="padding-left: 3px; padding-top: 3px; color: #0000FF"><%=replyUser.getUName()%>&nbsp;</td>
										</tr>
										<tr>
											<td>
												<img src="${ctx }<%=replyUser.getHead()%>" width="70" height="70"/>											</td>
										</tr>
										<tr>
											<td
												style="font-size: 12px; color: #FF0000; padding-left: 3px;">
												注册：<%=replyUser.getRegTime().toString().substring(
										0, 16)%></td>
										</tr>
										<tr>
										  <td
												style="font-size: 12px; color: #FF0000; padding-left: 3px;">ID:[<%=replyUser.getUNumber()%>]</td>
									  </tr>
									</table>
							  </td>
								<td colspan="3" valign="middle">
									<table width="630" height="7%" border="0" cellpadding="0"
										cellspacing="0" style="table-layout:fixed;   word-break:break-all;">
										<tr>
											<td width="630" height="25" class="titleName"
												style="background-image: url(image/titlemu_2.gif);">
												【回复标题】<%=reply.getTitle()%>
												
											</td>
										</tr>
										<tr>
											<td name="replyContent" id="replyContent" background="image/bg.gif"
												style="overflow:hidden;background-color: #EFEFEF; font-size: 15px; font-family: '新宋体'; color: #333333; border-top: 1px #FF0000 dotted; border-bottom: 1px #FF0000 dotted; padding-left: 8px; letter-spacing: 0.2em; line-height: 150%; word-wrap: break-word; word-break: break-all; width: 579px; padding-bottom: 20px;">
												【内容】
												<br />
												&nbsp;&nbsp;&nbsp;&nbsp;<%=reply.getContent()%><p>
											</td>
											<script type="text/javascript"> 
											//自动换行2（可以显示图片的） 
                                           // fnAddBr("content",40);  
                                            fnAddBr("replyContent",40);  
</script> 
										</tr>
										<tr>
											<td width="630" align="right"
												style="font-size: 12px; color: #FF0000;">
												<img src="image/chinaxin.gif" width="42" height="40">【发表】[<%=reply.getPublisTime().toString().substring(0,
										16)%>]
												【最后修改】[<%=reply.getModifyTime().toString().substring(0,
										16)%>]
										  </td>
										</tr>
									</table>
								</td>
							</tr>

							<tr>
								<td width="45" height="4%">								</td>
								<td width="585" align="right"> 
		                         <% 
		                            //1、登入ID=主题ID,登入ID=回帖ID，主题ID=回帖ID
		                            if((loginUser!=null&&loginUser.getUId()==topic.getUid())&&(loginUser!=null&&loginUser.getUId()==replyUser.getUId())&&(topicUser.getUId()==replyUser.getUId())){
								 %>
								   <%//=topic.getTopicId() %>
									<a href="doDetailUpdateReply.jsp?boardId=<%=board.getBoardId()%>&topicId=<%=topic.getTopicId()%>&replyId=<%=reply.getReplyId() %>&userIdReply=<%=replyUser.getUId()%>&userIdTopic=<%=topicUser.getUId() %>&loginUserId=<%=loginUser.getUId()%>">[修改]</a>&nbsp;
									<a href="doDetailDelReply.jsp?boardId=<%=board.getBoardId()%>&topicId=<%=topic.getTopicId()%>&replyId=<%=reply.getReplyId() %>&userId=<%=topicUser.getUId()%>&loginUserId=<%=loginUser.getUId()%>&replyUserId=<%=replyUser.getUId()%>">[删除]</a>&nbsp;&nbsp;&nbsp;&nbsp;
								
								<%
								     //out.print("loginUser.getUId()=:"+loginUser.getUId()+"///");
								     //out.print("topic.getUid()=:"+topic.getUid()+"///");
								     //out.print("reply.getUid()=:"+reply.getUid()+"///");
								    }
								 %>
								 <%
								    //2、登入ID！=主题ID，登入ID=回帖ID，主题ID！=回帖ID
								     if((loginUser!=null&&loginUser.getUId()!=topic.getUid())&&(loginUser!=null&&loginUser.getUId()==replyUser.getUId())&&(topicUser.getUId()!=replyUser.getUId())){
								  %>
								  <%//=topic.getTopicId() %>
								   <a href="doDetailUpdateReply.jsp?boardId=<%=board.getBoardId()%>&topicId=<%=topic.getTopicId()%>&replyId=<%=reply.getReplyId() %>&userIdReply=<%=replyUser.getUId()%>&userIdTopic=<%=topicUser.getUId() %>&loginUserId=<%=loginUser.getUId()%>">[修改]</a>&nbsp;
									<a href="doDetailDelReply.jsp?boardId=<%=board.getBoardId()%>&topicId=<%=topic.getTopicId()%>&replyId=<%=reply.getReplyId() %>&userId=<%=topicUser.getUId()%>&loginUserId=<%=loginUser.getUId()%>&replyUserId=<%=replyUser.getUId()%>">[删除]</a>&nbsp;&nbsp;&nbsp;&nbsp;
								  <%
								  	 }
								   %>
								   
								   <%
								   	  //3、登入ID=主题ID，登入ID！=回帖ID，主题ID！=回帖ID
								   	   if((loginUser!=null&&loginUser.getUId()==topic.getUid())&&(loginUser!=null&&loginUser.getUId()!=replyUser.getUId())&&(topicUser.getUId()!=replyUser.getUId())){
								    %>
								    <%//=topic.getTopicId() %>
								    <a href="doDetailDelReply.jsp?boardId=<%=board.getBoardId()%>&topicId=<%=topic.getTopicId()%>&replyId=<%=reply.getReplyId() %>&userId=<%=topicUser.getUId()%>&loginUserId=<%=loginUser.getUId()%>&replyUserId=<%=replyUser.getUId()%>">[删除]</a>&nbsp;&nbsp;&nbsp;&nbsp;
								    <%
						              }		    
								     %>
								     
								     <%
								       //4、登入ID!=主题ID，登入ID！=回帖ID，主题ID！=回帖ID
								       if((loginUser!=null&&loginUser.getUId()!=topic.getUid())&&(loginUser!=null&&loginUser.getUId()!=replyUser.getUId())||(loginUser!=null&&loginUser.getUId()!=replyUser.getUId())){
								      %>
								       <!--  
								        无&nbsp;[修改]&nbsp;&nbsp;
								      [删除]&nbsp;权限&nbsp;&nbsp;&nbsp;&nbsp;
								       -->
								      <%
								       }
								       %>
							  </td>
							</tr>
					</table>
				</div>
				<!--回复结束-->

				<%
					}
				%>




				<!--++-->
				<div
					style="width: 750px; height: 25px; border-left: 1px #FF0000 solid; border-right: 1px #FF0000 solid; font: 13px; color: #FFFFFF; background-image: url(image/title.gif); font-size: 12px; color: #333333;"
					align="left">
					&nbsp;&nbsp;共&nbsp;<%=count%>&nbsp;页(每页&nbsp;6&nbsp;条回复)&nbsp;&nbsp;现在是第&nbsp;
					<font color="#FF0000"><%=ip%></font>&nbsp;页 &nbsp;&nbsp;有&nbsp;<%=num%>
					&nbsp;条回复
				</div>
				<!--++-->

				<!--底部下一页，上一页开始-->
				<div style="width: 750px; height: 3% px; padding-top: 10px;"
					align="left">
					<input type="button"
						onClick="findPage(<%=p - 1%>,<%=pageCount%>,<%=topicId%>,<%=boardId%>)"
						value="上一页"
						style="background-image: url(image/next.gif); width: 73px; height: 29px; border: none;">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button"
						onClick="findPage(<%=p + 1%>,<%=pageCount%>,<%=topicId%>,<%=boardId%>)"
						value="下一页"
						style="background-image: url(image/next.gif); width: 73px; height: 29px; border: none;">
				</div>
				<!--底部下一页，上一页结束-->
                 
				<!-- 回 新 贴，新 主 题，菜单开始(底层)-->
				<div
					style="width: 750px; height: 30px; padding-left: 0px; padding-top: 10px;"
					align="right">
					<table width="182" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="12">
								<img src="image/titlemu_1.gif" width="12" height="25">
							</td>
							<td width="54" align="center" style="background-image:url(image/titlemu_2.gif); background-repeat:no-repeat;">
								<a href="reply.jsp?boardId=<%=boardId%>&topciId=<%=topicId%>">回
									新 贴</a>
							</td>
							<td width="14">
								<img src="image/titlemu_3.gif" width="12" height="25">
							</td>
							<td width="22">&nbsp;
								
							</td>
							<td width="12">
								<img src="image/titlemu_1.gif" width="12" height="25">
							</td>
							<td width="49" align="center" style="background-image:url(image/titlemu_2.gif); background-repeat:no-repeat;">
								<a href="post.jsp?boardId=<%=boardId%>">新 主 题</a>
							</td>
							<td width="19">
								<img src="image/titlemu_3.gif" width="12" height="25">
							</td>
						</tr>
					</table>
				</div>
				
				<!--回 新 贴，新 主 题，结束-->
				<!-- 底部-->
				<%@ include file="footCommons.jsp"%>

				<%
					     } //if--else语句结束
						//try语句结束
					  } catch (Exception e) {
					}
				%>
              
			</div>
			<!--最外层div结束-->
		</div>
	</body>

</html>
