<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>

<%@ include file="commons.jsp" %>
<%
	UserDao userDao=new UserDaoImpl();
	BoardDao boardDao=new BoardDaoImpl();
	TopicDao topicDao=new TopicDaoImpl();
	Board board=new Board();
	Topic topic=new Topic();
	
	try{
		//String boardIdStr=request.getParameter("boardId");
		String topicIdStr=request.getParameter("topicId");
		String userIdStr=request.getParameter("userId");
		String loginUserIdStr=request.getParameter("loginUserId");
		//out.print("topicIdStr:"+topicIdStr);
		//out.print("userId:"+userIdStr);
		//out.print("loginUserId:"+loginUserIdStr);
if((userIdStr==null||"".equals(userIdStr))||(topicIdStr==null||"".equals(topicIdStr))||(loginUserIdStr==null||"".equals(loginUserIdStr))){
		}else{
	
		int topicId=Integer.parseInt(topicIdStr);
		int userId=Integer.parseInt(userIdStr);
		int loginUserId=Integer.parseInt(loginUserIdStr);
		
		if(userId==loginUserId){
    
		//board=boardDao.findBoard(boardId);
		topic=topicDao.findTopic(topicId);
		out.print("4545454");
 %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>青鸟学院论坛-回新帖</title>
		<LINK href="style.css" type="text/css" rel="stylesheet">
		<style type="text/css">
<!--
body {
	font-size: 12px;
	color: #333333;
}

.titleName {
	background-color: #E8E8E8;
	font-size: 14px;
	color: #000000;
	font-weight: 700;
}
-->
</style>
		<script type="text/javascript">
	<!--
			//标题
			function checkTitleName(){
			    var tname=document.myForm.titleName.value;
			    if(tname.length==0){
			    	document.getElementById("tdtitle").innerHTML="标题不能为空！";
			    	return false;
			    }
			    else{
			    	document.getElementById("tdtitle").innerHTML="成功";
			    	return true;
			    }
			}
			    //内容
			function checkContent(){
			    var cname=document.myForm.content.value;
			    if(cname.length==0){
			    	window.alert("不能为空11");
			    	return false;
			    }
			    if(cname.length>1000){
			    	window.alert("不能大于一千字");
			    	return false;
			    }
			    else{
			    	window.alert("成功！！！");
			    	return true;
			    }
			}
			//总
			function check(){
				if(checkTitleName()&&checkContent()){
					//window.alert("输入成功！");
					return true;
				}
				else{
					//window.alert("输入失败！");
					return false;
				}
			}
	//-->
	</script>
	<LINK href="style.css" type="text/css" rel="stylesheet">
	</head>

	<body>
		<div style="width: 953px; height: 620px;" align="center">
			<div style="width: 750px; height: 450px;  align="center">
				<table width="750" height="81" border="0" cellpadding="0"
					cellspacing="0">
					<tbody>
						<tr>
							<td>
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
				<div
					style="background-image:url(image/title.gif);width: 748px; height: 20px;" align="left">
					<font style="font-size: 14px; font-weight: 900;">>><a href="index.jsp">论坛首页</a>>><a href="list.jsp?boardId=<%=board.getBoardId()%>&page=1"><%=board.getBoardTitle()%></a>>><a href="detail.jsp?topicId=<%=topic.getTopicId()%>&boardId=<%=board.getBoardId()%>&page=1"><%=topic.getTitle()%></a></font></div>

				<div style="width: 750px; height: 180px;">
					<form action="doReply.jsp?" id="myForm" name="myForm" method="post" onSubmit="return check()">
					            <!-- 以隐式表单域的形式提交（boardId,topicId） -->  
										<input type="hidden" name="boardId" value="<%=board.getBoardId()%>">
										<input type="hidden" name="topicId" value="<%=topic.getTopicId()%>">
										<input type="hidden" name="userId" value="<%=loginUser.getUId()%>">
                                
					  <table width="750" border="0" cellpadding="0" cellspacing="0"
							style="font-size:12px;">
                        <tbody>
                          <tr>
                            <td width="750" height="15" align="right" background="image/d_r11_15.jpg"
							style="border-left:1px #FF0000 solid; border-right:1px #FF0000 solid;" ">&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;<font size="3px" color="#FFFFFF" face="黑体">修&nbsp;改&nbsp;主&nbsp;题</font>&nbsp;&nbsp;<br>                            </td>
                          </tr>
                          <tr align="left">
                            <td height="282" rowspan="1" align="left">
							<table width="750" height="267" border="0" cellspacing="0" style="border-left:1px #FF0000 solid; border-right:1px #FF0000 solid;">
                              <tr>
                                <td width="36" height="33" align="center"> 标题 <br>                                </td>
                                <td width="534" > &nbsp;&nbsp;&nbsp;&nbsp;
                                 <input type="text" name="titleName" id="titleName" size="50" onBlur="checkTitleName()" class="register-input"  onMouseOver="this.className='mouseOverStyle'" onMouseOut="this.className='mouseOutStyle'" readonly="true"> </td>
                                <td width="172"  id="tdtitle" name="tdtitle">
                                <%
													  String msg= (String)request.getAttribute("msg");
													  if(msg!=null){
													  	out.print(msg);
													  }
													  
													  /*
													  //标准写法！！
													  String msg=(String)request.getAttribute("msg");
       												   if(msg!=null){
       												   		out.print(msg);
       												   		}
													  */
			  
								%>                                
								</td>
                              </tr>
                              <tr>
                                <td height="230" rowspan="2" align="center" valign="top"> 内容 </td>
                                <td height="217" valign="top" >
&nbsp;&nbsp;&nbsp;&nbsp;
<textarea name="content"  id="content" cols="70" rows="15" style="border: 1px #FF6666 solid;" wrap="hard"></textarea></td>
                                <td rowspan="2" valign="top" >&nbsp;</td>
                              </tr>
                              <tr>
                                <td align="right" valign="top" >&nbsp;							    （不能大于：1000字）</td>
                              </tr>
                            </table>
                              <div style="width: 750px; height: 30px;" align="center">
                                  <input type="submit"  id="sub" name="sub" value="提 交"
												style="border: none; background-image:url(image/next.gif); width:73px; height:29px;" />
                              &nbsp;&nbsp;&nbsp;&nbsp;
                              <input type="reset" id="res" name="res" value="重 置"
												style="border: none; background-image:url(image/next.gif); width:73px; height:29px;" />
                              </div>							  </td>
                          </tr>
                      </table>
					</form>
					<!-- 底部-->
					<%@ include file="footCommons.jsp" %>
					<%
					           }else{
					           		
					           }
					       }
						}catch(Exception e){
									}
					 %>
				</div>
			</div>
			
		</div>
		
	</body>

</html>
