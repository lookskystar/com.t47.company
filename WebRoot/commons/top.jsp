<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>

<%@include file="taglibs.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>品红人生</title>
  
<style>
.xmenu td{
font-size:12px;
font-family:verdana,arial;
font-weight:bolder;color:#ffffff;
border:0px solid #cdc9c8;
background:#870b01;
filter:blendtrans(duration=0.6);
cursor:hand;text-align:center;
}


</style>
<script language=javascript>
// 绑定菜单的事件
function attachXMenu(objid)
{
	var tds=objid.getElementsByTagName('td');
	for(var i=0;i<tds.length;i++){
		with(tds[i]){
			onmouseover=function(){
				with(this){
					filters[0].apply();
					style.background='#fb938b';        //鼠标移上去时的背景颜色
					style.border='0px solid #cdc9c8';  //边框
					style.color='black';               //文字颜色
					filters[0].play();
				}
			}
			onmouseout=function(){
				with(this){
					filters[0].apply();
					style.background='#870b01';       //这是鼠标离开时的背景颜色
					style.border='0px solid #cdc9c8'; //边框
					style.color='#ffffff';            //文字颜色
					filters[0].play();
				}
			}
		}
	}
}
</script>
</head>
<body>
<div align="center" style="width: 1000px;">
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
<tr><td height="3" background="image/d.jpg"></td>
</tr>
<tr>
    <td  height="151"><img src="${ctx}/image/d_r1_c1.jpg"></td>
  </tr>
  </table>
  
  <!-- 用户信息、登录、注册 -->
                            <%
                                 User loginUser=null;
	                             if(session.getAttribute("user")==null){
                             %>
  <div align="center" style="width:750px">
  <table width="750" border="0" cellpadding="0" cellspacing="0">
    <tr>
  <td width="140" height="20" background="${ctx}/image/T_left.gif" style="width: 140px; height: 20px;  font-size: 12px; color: #CC0000; ">&nbsp;</td>
                                                                                            

       <!-- 此处msg为1，是为了login.jsp接受一值，无意义 -->            
                                    <td width="556" height="20" align="right" 

background="${ctx}/image/Tt_bg.gif"; style="color:#FFFFFF; font-size:12px;">您尚未: <a 

href="${ctx}/login/login.jsp?msg=0" id="alogin">登录</a> | <a 

href="${ctx}/userReg/userReg.jsp" id="alogin">注册</a> | </td>
                                    <td width="54" 

background="${ctx}/image/T_right.gif">&nbsp;</td>
                                  </tr>
                                </table>
  </div>
  <%
  } else{
  loginUser=(User)session.getAttribute("user");
  
  //Map map=new HashMap();
  //map=(Map)application.getAttribute("mapUser");
  //out.print("map.keySet():"+map.keySet());
  //out.print("在点*关闭网页的时候，这个用户退出，map中从全局application得到的用户名，还时候这个用户，这样就不能进行用户有没有重复登陆了"); 
  
   %>
  <div align="center" style="width:750px">
 <table width="750" border="0" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td width="140" height="21" 

background="${ctx}/image/T_left.gif" style="width: 140px; height: 20px;  font-size: 12px; color: 

#CC0000; ">&nbsp;</td>
                                    <td width="557" height="21" align="right" 

background="${ctx}/image/Tt_bg.gif"; style="color:#FFFFFF; font-size:12px;">您好：<%=loginUser.getUName() %>&nbsp; | <a href="${ctx }/userReg/updateUserReg.jsp">设置</a> | &nbsp;<a href="${ctx }/login/doLogout.jsp">退出</a> | </td>
                                    <td width="53" 

background="${ctx}/image/T_right.gif">&nbsp;</td>
                                  </tr>
                                </table>
  </div>
  <%
  }
   %>
  <table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
   <tr>
  <td width="750" height="3" background="${ctx}/image/d.jpg"></td>
  </tr>
  <tr>
    <td>
	  <table class="xmenu" id="xmenu1" width="750" height="25" cellpadding="0" 

cellspacing="0" border="0"  align="center">
	<tr>
	<td width="115" height="20" onClick="javascript:location.assign('${ctx }/index.jsp')">首页</td>
	<td width="115" onClick="javascript:location.assign('${ctx }/proShowList/productList.jsp?page=1')" >商品展示</td>
	<td width="115" onClick="javascript:location.assign('${ctx }/newsShowList/newsList.jsp?page=1')">站内新闻</td>
	<td width="115" onclick="javascript:location.assign('${ctx }/chat/main.jsp')" >在线聊天</td>
	<td width="115" onClick="javascript:location.assign('${ctx}/forum/index.jsp')">问红论坛</td>
	<td width="115" onClick="javascript:location.assign('${ctx }/admin/adminIndex.jsp')">后台管理</td>
	
	</tr>
</table>
	</td>
  </tr>
  	<tr>
  <td width="750" height="3" background="${ctx}/image/d.jpg"></td>
  </tr>
</table>

 
 
<script>attachXMenu(xmenu1);</script> 
<div>
</body>
</html>
