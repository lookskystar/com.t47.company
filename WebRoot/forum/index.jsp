<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="dao.*,
		         entity.*,
			     dao.impl.*"%>


<%
	BoardDao boardDao=new BoardDaoImpl();   //得到板块Dao的实例
	TopicDao topicDao=new TopicDaoImpl();   //得到子版块实例
	ReplyDao replyDao=new ReplyDaoImpl();   //得到回复的实例
	
	UserDao userDao=new UserDaoImpl();      //得到用户实例
	Map mapBoard=boardDao.findBoard();      //取得Map形式的主板块信息
	Map mapSonBoard=new HashMap();          //保存主版块和子版块的的map
	List listSonBoard=new ArrayList();  //保存主版块下子版块的集合
	
	
	
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>问红人生论坛（落红岂无情？化泥更护花！）</title>

		<title>欢迎访问青鸟学员论坛</title>
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
	</head>

	<body>
		<div style="width: 953px; height: 900px;" align="center">
			<!-- 用户信息、登录、注册 -->
             <%@ include file="loginCommons.jsp" %>
			<table width="750" border="0" cellpadding="0" cellspacing="0"
				style="border-left: 1px solid #FF0000;border-right:1px solid #FF0000;font-size: 12px;" height="75">
				<tbody>
					<tr>
						<td width="30" height="21" background="image/d_r11_15.jpg"
							style="background-color: #CACACA; border-top: 2px #CCCCCC ">&nbsp;</td>
						<td width="418" background="image/d_r11_15.jpg"
							style="background-color: #CACACA; border-top: 2px #CCCCCC ; font: 13px; color: #FFFFFF; font-weight: 900;">
							&nbsp;论坛版块						</td>
						<td width="101" background="image/d_r11_15.jpg"
							style="background-color: #CACACA; border-top: 2px #CCCCCC ; font: 13px; color: #FFFFFF; font-weight: 900;">
							&nbsp; 点击次数						</td>
						<td width="249" background="image/d_r11_15.jpg"
							style="background-color: #CACACA; border-top: 2px #CCCCCC ; font: 13px; color: #FFFFFF; font-weight: 900;">
							&nbsp;&nbsp;&nbsp;&nbsp;最后发表						</td>
					</tr>
					<!-- 主板块 -->
					<%-- 新的整型，值为0的对象 get为根据键返回相关联的值，如果不存在指定的键，返回null--%>
					<%                                       
								List listMainBoard=(List)mapBoard.get(new Integer(0));
							    for(int i=0;i<listMainBoard.size();i++){
									Board mainBoard=(Board)listMainBoard.get(i);  //主版块
							 %>
					<tr align="left">
						<td height="20" colspan="4" rowspan="1" bgcolor="#FF9999" id="tileA"
							style="border-bottom: 1px dotted #FFCCCC;">
							<a href="list.jsp?page=1&boardId=<%=mainBoard.getBoardId()%>">&nbsp;&nbsp;<%=mainBoard.getBoardTitle()%></a>
						    【显示该版块第一页主题（最后发布的10个主题）】&nbsp;
					  </td>
					</tr>
					<!-- 子版块 -->
					<%
						//把主版块ID和对应的子版块List加到map中（专门创建一个map保存）
					    mapSonBoard.put(mainBoard.getBoardId(),topicDao.findListTopic(1,mainBoard.getBoardId()));  
					    //根据主版块ID得到子版块集合
					    listSonBoard = (List)mapSonBoard.get( new Integer(mainBoard.getBoardId()) );  
  						for(int j=0; j<listSonBoard.size();j++){
  						Topic title=(Topic)listSonBoard.get(j);
			            
			              
					%>
					<tr>
						<td height="32" id="titleId">&nbsp;
							
						</td>
						<td valign="middle" id="titleIdBottom">
							<img src="image/board.gif" />
							<a href="detail.jsp?topicId=<%=title.getTopicId()%>&boardId=<%=mainBoard.getBoardId()%>&page=1">
							<%=title.getTitle()%>
							</a>
						</td>
						<td align="center" id="titleIdBottom">
							<%=title.getTClickCount() %>
						</td>
						<td id="titleIdBottom" >
						&nbsp;
							<a href="#">
							<%
							Reply reply=new Reply();
							reply=replyDao.getReplyByTopicId(title.getTopicId());
							%>
							<%=reply.getTitle() %>
							</a>
						</td>
					</tr>
							<%
								}
							}
							 %>
				
			</table>
			<!-- 底部-->
          <%@ include file="footCommons.jsp" %>
		</div>
	</body>

</html>
