<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>

<%@ include file="commons.jsp" %>
<%
	UserDao userDao=new UserDaoImpl();
	BoardDao boardDao=new BoardDaoImpl();
	TopicDao topicDao=new TopicDaoImpl();
	ReplyDao replyDao=new ReplyDaoImpl();
	Board board=new Board();
	Topic topic=new Topic();
	
	try{
		String boardIdStr=request.getParameter("boardId");  //
		String topicIdStr=request.getParameter("topicId");   //
		String replyIdStr=request.getParameter("replyId");     //
		String userIdTopicStr=request.getParameter("userIdTopic");      //
		String userIdReplyStr=request.getParameter("userIdReply");  //回复用户Id
		String loginUserIdStr=request.getParameter("loginUserId");
		//out.print("topicIdStr:"+topicIdStr);
		//out.print("userIdStr:"+userIdStr);
		//out.print("loginUserId:"+loginUserIdStr);
if((boardIdStr==null||"".equals(boardIdStr))||(replyIdStr==null||"".equals(replyIdStr))||(userIdTopicStr==null||"".equals(userIdTopicStr))||(topicIdStr==null||"".equals(topicIdStr))||(userIdReplyStr==null||"".equals(userIdReplyStr))||(loginUserIdStr==null||"".equals(loginUserIdStr))){
		}else{
	    int boardId=Integer.parseInt(boardIdStr);
		int topicId=Integer.parseInt(topicIdStr);
		int replyId=Integer.parseInt(replyIdStr);
		int userId=Integer.parseInt(userIdTopicStr);
		int userIdReply=Integer.parseInt(userIdReplyStr);
		int loginUserId=Integer.parseInt(loginUserIdStr);
		
		if(userIdReply==loginUserId){
    
		//board=boardDao.findBoard(boardId);
		topic=topicDao.findTopic(topicId);
		
		Reply reply=replyDao.findReply(replyId);
		
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
		<!--先倒5个jar包到库中    使用标签调用FCKeditor（1） -->
		<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

		<!--（OFCeditor配置1）必须导入这个文件-->
		<script type="text/javascript" src="fckeditor/fckeditor.js"></script>
		<!--（OFCeditor配置2）通过替换textarea调用-->
		<!-- 
    <script type="text/javascript">
        var oFCKeditor=new FCKeditor('content');
    	window.onload=function(){
    		oFCKeditor.Config["CustomConfigurationsPath"]="/com.t47.bbs/fckeditor/editor/myConfig.js";   //指定配置文件
    		oFCKeditor.BasePath="fckeditor/";
    		oFCKeditor.Width="680";
    		oFCKeditor.Height="370";
    		oFCKeditor.Value=" ";    //必须设置，且不能为空
    		oFCKeditor.ToolbarSet="bbstool";
    		//oFCKeditor.ReplaceTextarea();
    	} 
    </script>
       -->



		<script type="text/javascript">
	<!--FCKeditor判断
	// FCKeditor_OnComplete is a special function that is called when an editor
// instance is loaded ad available to the API. It must be named exactly in
// this way.
function InsertHTML()
{
	// Get the editor instance that we want to interact with.
	var oEditor = FCKeditorAPI.GetInstance('content') ;

	// Check the active editing mode.
	if ( oEditor.EditMode == FCK_EDITMODE_WYSIWYG )
	{
		// Insert the desired HTML.
		oEditor.InsertHtml( '- This is some <a href="/Test1.html">sample<\/a> HTML -' ) ;
	}
	else
		alert( 'You must be on WYSIWYG mode!' ) ;
}

function SetContents()
{
	// Get the editor instance that we want to interact with.
	var oEditor = FCKeditorAPI.GetInstance('content') ;

	// Set the editor contents (replace the actual one).
	oEditor.SetData( 'This is the <b>new content<\/b> I want in the editor.' ) ;
}

function GetContents()
{
	// Get the editor instance that we want to interact with.
	var oEditor = FCKeditorAPI.GetInstance('content') ;
    
	// Get the editor contents in XHTML.
	alert( oEditor.GetXHTML() ) ;		// "true" means you want it formatted.
}

function ExecuteCommand( commandName )
{
	// Get the editor instance that we want to interact with.
	var oEditor = FCKeditorAPI.GetInstance('content') ;

	// Execute the command.
	oEditor.Commands.GetCommand( commandName ).Execute() ;
}

function GetLength()
{
	// This functions shows that you can interact directly with the editor area
	// DOM. In this way you have the freedom to do anything you want with it.

	// Get the editor instance that we want to interact with.
	var oEditor = FCKeditorAPI.GetInstance('content') ;

	// Get the Editor Area DOM (Document object).
	var oDOM = oEditor.EditorDocument ;

	var iLength ;

	// The are two diffent ways to get the text (without HTML markups).
	// It is browser specific.

	if ( document.all )		// If Internet Explorer.
	{
		iLength = oDOM.body.innerText.length ;
	}
	else					// If Gecko.
	{
		var r = oDOM.createRange() ;
		r.selectNodeContents( oDOM.body ) ;
		iLength = r.toString().length ;
	}

	//alert( 'Actual text length (without HTML markups): ' + iLength + ' characters' ) ;
	if(iLength<10){
	   alert("不能小于10！");
	   return false
	}
	if(iLength>1000){
		 alert("不能大于1000！");
	      return false
	}else{
	    // alert("成功！");
	     return true;
	}
}

function GetInnerHTML()
{
	// Get the editor instance that we want to interact with.
	var oEditor = FCKeditorAPI.GetInstance('content') ;

	alert( oEditor.EditorDocument.body.innerHTML ) ;
}

function CheckIsDirty()
{
	// Get the editor instance that we want to interact with.
	var oEditor = FCKeditorAPI.GetInstance('content') ;
	alert( oEditor.IsDirty() ) ;
}

function ResetIsDirty()
{
	// Get the editor instance that we want to interact with.
	var oEditor = FCKeditorAPI.GetInstance('content') ;
	oEditor.ResetIsDirty() ;
	alert( 'The "IsDirty" status has been reset' ) ;
}
	
	
	
	
	
	////////////////////////////////
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
			//function checkContent(){
			   // var cname=document.myForm.content.value;
			    //if(cname.length==0){
			    	//window.alert("不能为空11");
			    	//return false;
			    //}
			    //if(cname.length>1000){
			    	//window.alert("不能大于一千字");
			    	//return false;
			    //}
			    //else{
			    	//window.alert("成功！！！");
			    	//return true;
			    //}
			//}
			
	
			
			//总
			function check(){
				if(checkTitleName()&& GetLength()){
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
					<form action="doUpdatReply.jsp?" id="myForm" name="myForm" method="post" onSubmit="return check()">
					            <!-- 以隐式表单域的形式提交（boardId,topicId） -->  
										<input type="hidden" name="boardId" value="<%=boardId%>">
										<input type="hidden" name="topicId" value="<%=topic.getTopicId()%>">
										<input type="hidden" name="replyId" value="<%=reply.getReplyId()%>">
										<input type="hidden" name="userId" value="<%=loginUser.getUId()%>">
                                
					  <table width="750" border="0" cellpadding="0" cellspacing="0"
							style="font-size:12px;">
                        <tbody>
                          <tr>
                            <td width="750" height="15" align="right" background="image/d_r11_15.jpg"
							style="border-left:1px #FF0000 solid; border-right:1px #FF0000 solid;" ">&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;<font size="3px" color="#FFFFFF" face="黑体">修&nbsp;改 回 贴</font>&nbsp; <br>                            </td>
                          </tr>
                          <tr align="left">
                            <td height="282" rowspan="1" align="left">
							<table width="750" height="267" border="0" cellspacing="0" style="border-left:1px #FF0000 solid; border-right:1px #FF0000 solid;">
                              <tr>
                                <td width="39" height="40" align="left">标题 <br>                                </td>
                                <td width="669" > &nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="text" name="titleName" id="titleName" size="50" onBlur="checkTitleName()" class="register-input"  onMouseOver="this.className='mouseOverStyle'" onMouseOut="this.className='mouseOutStyle'" readonly="true" value="<%=reply.getTitle() %>"> </td>
                                <td width="34"  id="tdtitle" name="tdtitle">
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
			  
								%>								</td>
                              </tr>
                              <tr>
                                <td height="230" width="39" rowspan="2" align="left" valign="top">内容 </td>
                                <td height="217" colspan="2" valign="top" >
&nbsp;&nbsp;&nbsp;&nbsp;
<!-- 
<textarea name="content"  id="content" cols="70" rows="15" style="border: 1px #FF6666 solid;" wrap="hard"></textarea>
-->
<script type="text/javascript">
                               var contentTxt='<%=reply.getContent()%>';   //得到回复内容的String类型
							   var oFCKeditor=new FCKeditor('content');
							   oFCKeditor.Config["CustomConfigurationsPath"]="/com.t47.company/forum/fckeditor/editor/myConfig.js";   //指定配置文件
    		                   oFCKeditor.BasePath="fckeditor/";
    		                   oFCKeditor.Width="680";
    		                   oFCKeditor.Height="370"; 
    		                   oFCKeditor.Value=contentTxt;    //必须设置，且不能为空，把String类型的回复内容放入ofckeditor中
    		                   oFCKeditor.ToolbarSet="bbstool";
    		                   oFCKeditor.Create();
    		                   //alert('<%=reply.getContent()%>');
							   </script>
							   
							   <!-- 解决在火狐中textarea不能自动换行的问题js代码 -->	
								<script type="text/javascript">
		                            var d=document.getElementById("content");
									var i=0;
									d.onkeydown=function(){
									if(i>40){
										d.value+="\n";i=0
									}
										i++;
									}
							  </script></td>
                              </tr>
                              <tr>
                                <td align="right" valign="top" >&nbsp;							    （不能大于：1000字）</td>
                                <td valign="top" >&nbsp;</td>
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
