<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/commons/taglibs.jsp" %>

<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>




<%
               //消息：把删除产品、更新产品的结果传递给msg，显示在跳转的页面上
                String msg="";
                msg=(String)request.getAttribute("msg");
                if(msg==null||"".equals(msg)){
                    msg="无信息";
                }
                
                

   List list=new ArrayList();
   AdminDao adminDao=new AdminDaoImpl();
   list=adminDao.ListByFindAdmin();
   if(list.size()==0){
   		out.print("数据错误！");
   }else{
 %>



      
      
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>品红人生-后台管理</title>

<LINK href="style.css" type="text/css" rel="stylesheet">
<script language="javascript">
<!--tab键改回车键开始-->
function changeFocus()
{
	if(event.keyCode==13 && event.srcElement.type!='button' && event.srcElement.type!='submit' && event.srcElement.type!='reset' && event.srcElement.type!='textarea' && event.srcElement.type!='')
	{
		event.keyCode=9;
	}
}
document.onkeydown=changeFocus;
<!--tab键改回车键结束-->
<!--菜单隐藏开始-->
function menuDivNone()
{
   
      if(document.getElementById("left").style.display=='none')
	  { //判断目前左边栏的状态（显示、隐藏）
          document.getElementById("left").style.display='block';  //显示左边栏
      }
      else
	  {
	  document.getElementById("left").style.display='none';  //隐藏左边栏
	  }
}
<!--菜单隐藏结束-->

<!--树形菜单开始-->
function show(d1){
if(document.getElementById(d1).style.display=='none'){
document.getElementById(d1).style.display='block';  //触动的层如果处于隐藏状态，即显示
}
else{document.getElementById(d1).style.display='none';  //触动的层如果处于显示状态，即隐藏
}
}
<!--树形菜单结束-->


<!--表单元素判断开始-->
<!--表单元素判断开始-->

<!--表单元素判断结束-->
</script>


<style type="text/css">
<!--
.text
{
border: 1px #0099FF solid;
}

DIV {
	FONT-SIZE: 12px; COLOR: #000000; LINE-HEIGHT: 22px;
}
A{FONT-SIZE: 13px; COLOR: #000000; TEXT-DECORATION: none}
A:hover {FONT-SIZE: 13px; COLOR: #FF0000}
.red {color: #666666;}


-->
   </style>
  </head>
  
  <body>
    <div id="main" align="center">
<!--头开始-->

<div id="mainLogin" style=" height:148px;">
 <!-- 判断管理人员是否正常登陆 -->
      <%@ include file="/commons/adminTop.jsp" %>
<!--头结束-->


<!--主体开始-->
<div style=" width:750px; height:18px;" align="left"><font color="red">信息：<%=msg%></font></div>
<table width="750" height="380" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
	<table width="750" height="300" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="152" rowspan="2" valign="top" id="left" style="padding-left:10px; padding-top:5px;border:1px #FF0000 solid; border-style:solid; background-color:#f4f8fc;">
	<div style="width:112px; height:300px;">
	 <%@ include file="../commons/menuAdmin.jsp" %>
	 </div>
	<br></td>
	
    <td width="26" rowspan="2" valign="top">
		<br></td>
    <td width="622" height="39" align="left" valign="top" style="padding-left:10px; padding-top:15px;">
	<div style="width:600px; height:20px;"><img src="${ctx}/image/ico_oversea.gif" />更新管理员</div>	</td>
  </tr>
  <tr>
    <td valign="top" style="padding-left:10px;" align="left">
	
	<table width="370" border="0" cellpadding="0" cellspacing="0" >
      <tr>
        <td height="22" colspan="4" align="center" >

		<table width="370" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="11" style="background-image:url(${ctx}/image/titlemu_1.gif)">&nbsp;</td>
            <td width="332"  style="background-image:url(${ctx}/image/titlemu_2.gif)">&nbsp;</td>
            <td width="14" style="background-image:url(${ctx}/image/titlemu_3.gif); background-repeat:no-repeat">&nbsp;</td>
          </tr>
        </table></td>
        </tr>
      <tr>
        <td width="87" align="center" style="font-size: 13px; color: blue; font-weight:600;">管理员名</td>
        <td width="133" align="center" style="font-size: 13px; color: blue; font-weight:600;">级别</td>
        <td width="76" align="center" style="font-size: 13px; color: blue; font-weight:600;">修改</td>
        <td width="74" align="center" style="font-size: 13px; color: blue; font-weight:600;">删除</td>
      </tr>
	  
      <%
	  if(adminSe.getAdminStatus()==0){
      for(int i=0;i<list.size();i++){
      	Admin admin=(Admin)list.get(i);
       %>
      <tr>
        <td align="center"><%=admin.getAdminName()%></td>
        <td align="center"><%=admin.getAdminStatus()%></td>
        <td align="center"><a href="updateAdminDetail.jsp?adminID=<%=admin.getAdminId()%>">修改</a></td>
        <td align="center"><a href="updateAdminDelAction.jsp?adminID=<%=admin.getAdminId()%>&adminName=<%=admin.getAdminName()%>">删除</a></td>
      </tr>
      <%
      }
      }else{
      %>
       <tr>
        <td align="center"><%=adminSe.getAdminName()%></td>
        <td align="center"><%=adminSe.getAdminStatus()%></td>
        <td align="center"><a href="updateAdminDetail.jsp?adminID=<%=adminSe.getAdminId()%>">修改</a></td>
        <!-- <td align="center"><a href="updateAdminDelAction.jsp?adminID=<%//=admin.getAdminId()%>&adminName=<%//=admin.getAdminName()%>">删除</a></td> -->
      </tr>
       <%
       }
        %>
      <tr>
        <td colspan="4" align="right">&nbsp;</td>
        </tr>
      
      <tr>
        <td colspan="4" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      </tr>
      <tr>
        <td colspan="4" align="center"><table width="370" border="0" cellpadding="0" cellspacing="0">
		
          <tr>
            <td width="65" height="19" style="background-image:url(${ctx}/image/T_bottomleft.gif)">&nbsp;</td>
            <td width="158" style="background-image:url(${ctx}/image/T_bottombg.gif)">&nbsp;</td>
            <td width="146" style="background-image:url(${ctx}/image/T_bottomright.gif); background-repeat:no-repeat;">&nbsp;</td>
          </tr>
        </table>		 </td>
        </tr>
    </table>
	<p>&nbsp;</p>
	<table width="589" height="91" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="63" valign="top" style="overflow:hidden;background-color: #FFFFFF; font-size: 12px; font-family: '新宋体'; color: #666666; border-bottom: 1px #9BB4FB dashed; padding-left: 10px; letter-spacing: 0.1em; line-height: 110%; word-wrap: break-word; word-break: break-all; width: 589px; padding-top:5px;"><p>系统管理员手册</p>
          <p>&nbsp;&nbsp;&nbsp;&nbsp;本系统系统管理员分为最高管理员（1个），管理员（9个），最高系统管理员拥有系统管理所有操作权限，能对管理员进行增删操作。管理员拥有除了不能对其他管理员和最高管理员进行操作的所有操作。如：需要增加新的管理员需要最高管理员进行，而其他管理员无此权限！</p></td>
      </tr>
      <tr>
        <td height="28" align="right" valign="top"><img src="../image/tpinghong.gif" width="124" height="46"></td>
      </tr>
    </table>	
	<p>&nbsp;</p></td>
  </tr>
</table>

	</td>
  </tr>
</table>
	
<!--主体结束-->

<!--尾开始-->
<div id="end0" style="width:750px; height:40px; padding-top:8px;">
<div id="end2" style=" width:750px; height:30px; padding-top:8px; font-size:12px; color:#333333; letter-spacing: 0.2em;line-height: 130%;" align="center">
<!-- 底部-->
<%@ include file="/commons/bottom.jsp" %>
</div>
</div>
<!--尾结束-->
</div>
  </body>
</html>
<%
}
%>