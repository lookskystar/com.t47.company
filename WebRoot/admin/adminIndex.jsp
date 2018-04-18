<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>


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
    <title>品红人生—管理登入</title>
	 <style type="text/css">
<!--
.text
{
border: 1px #0099FF solid;
}
-->
   </style>
   
   
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



//提交
function checkUser()
{
	if(LostFocusCheckAdminUser()&&LostFocusCheckAdminPwd())
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

</script>
  </head>
  
  <body>
  <div style="width:1000px;" align="center">
  
  
  
   <!-- 用户信息、登录、注册 -->
      <%@ include file="/commons/top.jsp" %>
	  	  <div style="width:750px; height:20px; " align="left"><a href="${ctx}/index.jsp">首页</a> >> <a href="#">管理登入</a> </div>
	  <form name="myForm" id="myForm" action="adminIndexAction.jsp"  method="post" onSubmit="return checkUser()">
	  <table width="750" border="0" cellpadding="0" cellspacing="0" style="border-bottom:2px #FFB5B5 solid; ">
  <tr>
    <td width="184" height="33" valign="top">
	  <%@ include file="../commons/left.jsp" %>	</td>
		
	<td width="10" rowspan="2" valign="top" style="border-right:2px #FFB5B5 solid;">&nbsp;</td>
	
    <td width="556" rowspan="2" align="center" valign="middle">
	  <table width="550" height="233" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="222" align="center" valign="middle" style="padding-left:0px; padding-right:0px;">
    
	<table width="370" border="0" cellpadding="0" cellspacing="0" >
      <tr>
        <td height="22" colspan="4" align="center" >

		<table width="370" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="11" style="background-image:url(../image/titlemu_1.gif)">&nbsp;</td>
            <td width="332"  style="background-image:url(../image/titlemu_2.gif)">&nbsp;</td>
            <td width="14" style="background-image:url(../image/titlemu_3.gif); background-repeat:no-repeat">&nbsp;</td>
          </tr>
        </table></td>
        </tr>
      <tr>
        <td colspan="4" align="center">管理人员登入</td>
      </tr>
      <tr>
        <td colspan="4" align="center">&nbsp;</td>
      </tr>
	   <tr>
        <td colspan="4" align="right"><font color="#FF0000"><%=msg %></font></td>
      </tr>
	   <tr>
        <td colspan="4" align="center">&nbsp;</td>
      </tr>
      <tr>
        <td width="97" align="right">用户名：</td>
        <td width="15">&nbsp;</td>
        <td width="170"><input type="text" class="text" name="adminUser" maxlength="10" onBlur="LostFocusCheckAdminUser()"></td>
        <td width="88" id="errorname" >&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td align="right">密&nbsp;&nbsp;码：</td>
        <td>&nbsp;</td>
        <td><input type="password" class="text" name="adminPwd" id="adminPwd" onBlur="LostFocusCheckAdminPwd()"></td>
        <td id="errorpwd">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="4" align="center">&nbsp;</td>
        </tr>
      <tr>
        <td colspan="4" align="center"><input type="submit" name="Submit" value="提  交" style="border:none; background-color:#FF9933; padding-top:0px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" name="Submit" value="重  置" style="border:none; background-color:#FF9933; padding-top:0px;">
		</td>
      </tr>
      <tr>
        <td colspan="4" align="center"><table width="370" border="0" cellpadding="0" cellspacing="0">
		
          <tr>
            <td width="65" height="19" style="background-image:url(../image/T_bottomleft.gif)">&nbsp;</td>
            <td width="158" style="background-image:url(../image/T_bottombg.gif)">&nbsp;</td>
            <td width="146" style="background-image:url(../image/T_bottomright.gif); background-repeat:no-repeat;">&nbsp;</td>
          </tr>
        </table>
        </td>
        </tr>
    </table>
    
    </td>
    </tr>
</table>
<br /></td>
  </tr>
  <tr>
    <td valign="bottom"><img src="../image/hye.gif" width="186" height="198"></td>
  </tr>
</table>
</form>


  
  
  
  </div>
    <%@ include file="/commons/bottom.jsp" %>
    
 
  </body>
</html>
