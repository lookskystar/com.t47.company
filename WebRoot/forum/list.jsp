<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>

<%
	TopicDao topicdao=new TopicDaoImpl();    //得到主题dao的实例
	UserDao userDao=new UserDaoImpl();      //得到用户dao的实例
	ReplyDao replyDao=new ReplyDaoImpl();   //得到回复dao的实例
	BoardDao boardDao=new BoardDaoImpl();   //得到版块实例
	Board board=new Board();                //得到版块实体类实例
	//在此转换判断时候要用try语句把可能出错的地方括起，防止在浏览器上输入不是数字的值的变量
	try{
	String boardIdStr=(String)request.getParameter("boardId");
	String pStr=(String)request.getParameter("page");
	
	//得到返回的信息
	String msg=(String)request.getAttribute("msg");
	//out.print("msg:"+msg);
	if(msg==null||"".equals(msg)){
		msg="无信息！";
	}
		
	int pageCount=0; //保存最大页面值
	//此判断，防止在浏览器上输入变量值直接访问
	if((boardIdStr==null||"".equals(boardIdStr))||
	(pStr==null||"".equals(pStr))
	){}
	else{

			int p=1;
			int boardId=1;
			List listTopic=new ArrayList();
			
			
			p=Integer.parseInt(pStr);                              //页数为1(现在改为从index.jsp接收的页数)
			boardId=Integer.parseInt(boardIdStr);                  //版块ID为“JSPj技术”的版块ID 为1(现在改为接收index,jsp传来的boardId)
			board=boardDao.findBoard(boardId);                         //取得板块信息
			board.getBoardInfo();
			
			listTopic=topicdao.findListTopic(p,boardId);          //根据版块ID取得该版块下所有主题信息的list
		    //客户端判断当前页面数是否小于1或大于最大页面值
			pageCount=topicdao.getCountRows(boardId);             //得到最最大页面值
			int num=topicdao.findCountTopic(boardId);             //该版块下所有主题数
				if(p<1){
					p=1;
				}
				if(p>pageCount){
					p=pageCount;
				}
	      
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>问品红人生论坛-主题</title>
    <LINK href="style.css" type="text/css" rel="stylesheet">
	<style type="text/css">
    <!--
       body {
	         margin-left: 0px;
	         margin-top: 0px;
	         margin-right: 0px;
	         margin-bottom: 0px;
	         font-size: 12px;
	         color: black;
            }
      td {
      		font-size: 12px;
      		color:#333333;
			font-family:"新宋体";
      	 }
-->
</style>
	<script type="text/javascript">
		<!--
		      function findPage(page,pageCount,boardId){
		            if(page<1){
		            	page=1;
		            }
		            if(page>pageCount){
		            	page=pageCount;
		            }
			  		location.href="list.jsp?page="+page+"&boardId="+boardId;
			  		}
		//-->
	</script>
	</head>
	
	<body>
		<div style="width: 953px; height: 900px;"
			align="center">
			<div style="width: 750px; height: 900px;"
				align="center">
				<table width="750" height="81" border="0" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
						  <td width="750" style="border-right:none;">
						  <!-- 用户信息、登录、注册 -->
						  <%@ include file="loginCommons.jsp" %>
						  
						  </td>
						</tr>
						<tr>
							<td>
							</td>
						</tr>
					</tbody>
	</table>
				<div style=" width:750px; height:30px; padding-left:5px; padding-top:10px;" align="left">
				<font style="font-size:14px; font-weight:900;">>><a href="index.jsp">论坛首页>></a><%=board.getBoardTitle()%></font>
				</div>
					<div style=" width:750px; height:30px; padding-left:5px; padding-top:10px;" align="left">
					<table width="73" border="0" cellpadding="0" cellspacing="0" height="25">
  <tr>
    <td width="10"><img src="image/titlemu_1.gif" width="12" height="25"></td>
    <td width="52" background="image/titlemu_2.gif" style="padding-top:3px;"><a href="post.jsp?boardId=<%=boardId%>">新&nbsp;主&nbsp;题</a></td>
    <td width="10"><img src="image/titlemu_3.gif" width="12" height="25"></td>
  </tr>
</table>

				</div>
								<div style=" width:750px; height:30px; padding-left:5px; padding-top:10px; padding-bottom: 10px;" align="right">
		         <input type="button"  onClick="findPage(<%=p - 1%>,<%=pageCount %>,<%=boardId %>)" value="上一页" style="background-image:url(image/next.gif); width:73px; height:29px; border:none;"> &nbsp;&nbsp;&nbsp;&nbsp; 
		         <input type="button" onClick="findPage(<%=p + 1%>,<%=pageCount %>,<%=boardId %>)" value="下一页" style="background-image:url(image/next.gif);width:73px; height:29px;border:none ;">
				</div>
					
				<div style="width: 750px; height: 800px;">
					<table width="750" border="0" cellpadding="0" cellspacing="0" style="border-left: 1px solid #FF0000; border-right:1px solid #FF0000; font-size: 12px;" height="94">
						<tbody>
							<tr>
								<td height="22" colspan="4"  style=" border-top:2px #CCCCCC"><table width="750" border="0" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td width="456" height="20" background="image/title.gif">&nbsp;&nbsp;共&nbsp;<%=pageCount%>&nbsp;页(每页&nbsp;10&nbsp;条主题)&nbsp;&nbsp;现在是第&nbsp;<font color="#FF0000"><%=p%></font>&nbsp;页	&nbsp;&nbsp;有&nbsp;<%=num%>	&nbsp;条主题</td>
                                    <td width="294" background="image/title.gif">提示信息：<%=msg%></td>
                                  </tr>
                                </table></td>
							</tr>
							<tr align="left">
							  <td height="20" colspan="2" rowspan="1" align="center" background="image/d_r11_15.jpg"  id="titleIdBottom" style="background-color: #CACACA; border-top: 2px #CCCCCC ; font: 13px; color: #FFFFFF; font-weight: 900;">主 &nbsp;&nbsp;题</td>
							    <td width="185" height="20" rowspan="1" align="center" background="image/d_r11_15.jpg"  id="titleIdBottom" style="background-color: #CACACA; border-top: 2px #CCCCCC ; font: 13px; color: #FFFFFF; font-weight: 900;">作&nbsp;&nbsp;者</td>
							    <td width="193" height="20" rowspan="1" align="center" background="image/d_r11_15.jpg" id="titleIdBottom" style="background-color: #CACACA; border-top: 2px #CCCCCC ; font: 13px; color: #FFFFFF; font-weight: 900;">回&nbsp;&nbsp;复</td>
							</tr>
								<%//if(p==1){
										for(int i=0; i<listTopic.size();i++){
										Topic topic=(Topic)listTopic.get(i);
							 %>
							<tr>
						
								<td width="65" height="32" id="titleIdBottom" style="padding-left: 2px;">
								主题：<font color="#FF0000"><%=num-(10*p-10)-i %></font>								</td>
								<td width="307" valign="middle" id="titleIdBottom">
									<img src="image/board.gif" /><a href="detail.jsp?page=1&boardId=<%=boardId%>&topicId=<%=topic.getTopicId() %>"><%=topic.getTitle()%></a></td>
								<td align="center" id="titleIdBottom">
								<%=(userDao.findUser(topic.getUid())).getUName()%>		                        </td>
								<td align="center" id="titleIdBottom">
								<%=replyDao.findCountReply(topic.getTopicId())%>								</td>
							</tr>
							<%
									//}
								} 

							%>
							<tr>
                                <td height="20" background="image/title.gif" align="right" colspan="4">共&nbsp;<%=pageCount%>&nbsp;页(每页&nbsp;10&nbsp;条主题)&nbsp;&nbsp;现在是第&nbsp;<font color="#FF0000"><%=p%></font>&nbsp;页	&nbsp;&nbsp;有&nbsp;<%=num%>	&nbsp;条主题&nbsp;&nbsp;</td>
                            </tr>
				  </table>
				  <div style=" width:750px; height:30px; padding-left:5px; padding-top:10px; padding-bottom: 10px;" align="left">
		         <input type="button"  onClick="findPage(<%=p - 1%>,<%=pageCount %>,<%=boardId %>)" value="上一页" style="background-image:url(image/next.gif); width:73px; height:29px; border:none;"> &nbsp;&nbsp;&nbsp;&nbsp; 
		         <input type="button" onClick="findPage(<%=p + 1%>,<%=pageCount %>,<%=boardId %>)" value="下一页" style="background-image:url(image/next.gif);width:73px; height:29px;border:none ;">
				</div>
				
				<div style=" width:750px; height:30px; padding-right:15px; padding-top:10px;" align="right">
					<table width="73" border="0" cellpadding="0" cellspacing="0" height="25">
  <tr>
    <td width="10"><img src="image/titlemu_1.gif" width="12" height="25"></td>
    <td width="52" background="image/titlemu_2.gif" style="padding-top:3px;"><a href="post.jsp?boardId=<%=boardId%>">新&nbsp;主&nbsp;题</a></td>
    <td width="10"><img src="image/titlemu_3.gif" width="12" height="25"></td>
  </tr>
</table>

				</div>
		   <!-- 底部-->
				  <%@ include file="footCommons.jsp" %>
				  <%
					}
				 	 }catch(Exception e){
			    	  	   }
				 %>
		</div>
		</div>
		</div>
	</body>
	
	</html>
