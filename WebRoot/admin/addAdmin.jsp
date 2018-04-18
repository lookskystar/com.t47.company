<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/commons/taglibs.jsp" %>

<%
  //消息：把删除产品、更新产品的结果传递给msg，显示在跳转的页面上
                String msg="";
                msg=(String)request.getAttribute("msg");
                if(msg==null||"".equals(msg)){
                    msg="无信息";
                }
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
//管理员检查
function LostFocusCheckAdminUser()
{
     var name=document.myForm.adminUser.value;
	if(name.length==0)
	{
	    document.getElementById("errorname").innerHTML="<font color='red'>名称不能为空</font>";
		document.myForm.adminUser.value="";
		return false;
	} 
	else
	{
		document.getElementById("errorname").innerHTML="<font color='red'>&nbsp;&nbsp;√</font>";
	    return true;
	}
	return false;
}


//密码检查
function LostFocusCheckAdminPwd()
{
     var pwd=document.myForm.adminPwd.value;
	if(pwd.length==0)
	{
	    document.getElementById("errorpwd").innerHTML="<font color='red'>密码不能为空</font>";
		document.myForm.adminPwd.value="";
		return false;
	} 
	else if(pwd.length<6)
	{
	    document.getElementById("errorpwd").innerHTML="<font color='red'>不能小于6字符</font>";
		document.myForm.adminPwd.value="";
		return false;
	} 
	else
	{
		document.getElementById("errorpwd").innerHTML="<font color='red'>&nbsp;&nbsp;√</font>";
	    return true;
	}
		
	return false;
}

//重复密码检查
function LostFocusCheckAdminPwdf()
{
     var pwd=document.myForm.adminPwd.value;
	 var pwdf=document.myForm.adminPwdf.value;
	if(pwdf!=pwd)
	{
	    document.getElementById("errorpwdf").innerHTML="<font color='red'>重复密码不能为空</font>";
		document.myForm.adminPwdf.value="";
		return false;
	} 
	else
	{
		document.getElementById("errorpwdf").innerHTML="<font color='red'>&nbsp;&nbsp;√</font>";
	    return true;
	}
		
	return false;
}

//提交
function checkUser()
{
	if(LostFocusCheckAdminUser()&&LostFocusCheckAdminPwd()&&LostFocusCheckAdminPwdf())
	{
		//alert("成功提交");
		return true;
	}
	else
	{
		alert("提交失败");
		return false;
	}
}

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
</div>

<!--头结束-->
<!--主体开始-->
<div style=" width:750px; height:18px;" align="left"><font color="red">信息：<%=msg%></font></div>
<table width="750" height="380" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
	<table width="750" height="303" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="152" rowspan="2" valign="top" id="left" style="padding-left:10px; padding-top:10px;border:1px #FF0000 solid; border-style:solid; background-color:#f4f8fc;">
	 <%@ include file="../commons/menuAdmin.jsp" %>
	</td>
	
    <td width="26" rowspan="2" valign="top">
	<div style="background-image:url(${ctx}/image/feir.gif); width:20px; height:32px;" onClick="menuDivNone()"></div>	</td>
    <td width="622" height="39" align="left" valign="top" style="padding-left:10px; padding-top:15px;">
	<div style="width:600px; height:20px;"><img src="${ctx}/image/ico_oversea.gif" />添加管理员</div>	</td>
  </tr>
  <tr>
    <td valign="middle" style="padding-left:10px; padding-top:15px;" align="center">
	<form name="myForm" id="myForm" action="addAdminAction.jsp" method="post" onSubmit="return checkUser()">
	<table width="404" border="0" cellpadding="0" cellspacing="0" >
      <tr>
        <td height="22" colspan="4" align="center" >

		<table width="399" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="11" style="background-image:url(${ctx}/image/titlemu_1.gif)">&nbsp;</td>
            <td width="344"  style="background-image:url(${ctx}/image/titlemu_2.gif)">&nbsp;</td>
            <td width="29" style="background-image:url(${ctx}/image/titlemu_3.gif); background-repeat:no-repeat">&nbsp;</td>
          </tr>
        </table></td>
        </tr>
		 <tr>
        <td colspan="4" align="center">添加管理人员</td>
      </tr>
      <tr>
	   <tr>
        <td colspan="4" align="center">&nbsp;</td>
      </tr>
      <tr>
      <tr>
        <td colspan="4" align="left" style="color:#FF0000">提示：本系统只能添加10个管理人员(含最高管理员1个)</td>
      </tr>
      <tr>
        <td colspan="4" align="right" >&nbsp;</td>
      </tr>
      <tr>
        <td width="106" align="right">管理员用户名：</td>
        <td width="9">&nbsp;</td>
        <td width="172"><input type="text" class="text" name="adminUser" id="adminUser" maxlength="10" onBlur="LostFocusCheckAdminUser()"></td>
        <td width="117" id="errorname">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="right">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
        <td>&nbsp;</td>
        <td><input type="password" class="text" name="adminPwd" id="adminPwd" onBlur="LostFocusCheckAdminPwd()"></td>
        <td id="errorpwd">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="4" align="center">&nbsp;</td>
        </tr>
      <tr>
        <td  align="right">确&nbsp;认&nbsp;&nbsp;密&nbsp;码：</td>
        <td >&nbsp;</td>
        <td ><input type="password" class="text" name="adminPwdf" id="adminPwdf" onBlur="LostFocusCheckAdminPwdf()"></td>
		 <td id="errorpwdf">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="4" align="center">&nbsp;</td>
      </tr>
      <tr>
        <td align="right">级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
        <td align="center">&nbsp;</td>
        <td align="left"><select name="levelSel" id="levelSel">
          <option value="1">1</option>
        </select></td>
        <td align="center">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="4" align="center">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="4" align="center"><input type="submit" name="Submit" value="添  加" style="border:none; background-color:#FF9933; padding-top:0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" name="Submit" value="重  置" style="border:none; background-color:#FF9933; padding-top:0px;">		</td>
      </tr>
      <tr>
        <td colspan="4" align="center"><table width="403" border="0" cellpadding="0" cellspacing="0">
		
          <tr>
            <td width="65" height="19" style="background-image:url(${ctx}/image/T_bottomleft.gif)">&nbsp;</td>
            <td width="158" style="background-image:url(${ctx}/image/T_bottombg.gif)">&nbsp;</td>
            <td width="164" style="background-image:url(${ctx}/image/T_bottomright.gif); background-repeat:no-repeat;">&nbsp;</td>
          </tr>
        </table>		        </td>
        </tr>
    </table>
	</form>
	</td>
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
