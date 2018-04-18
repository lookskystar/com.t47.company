<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@include file="/commons/taglibs.jsp" %>
<% 

String msg=request.getParameter("msg");

//out.print(msg);
if(msg==null||"".equals(msg)){
     out.print("<font color='red' size=2px>登陆输入错误，请返回！</font>");
}else{
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>问红人生主页-登录</title>
    <LINK href="style.css" type="text/css" rel="stylesheet">
      <script type="text/javascript">
     <!--
      		//用户名
      		function checkName(){
      		    var name=document.myForm.userName.value;
      			if(name.length==0){
      				document.getElementById("userTd").innerHTML="<font color='red' size=2px>用户名不能为空！</font>";
      				return false;
      			}
      			else{
      				document.getElementById("userTd").innerHTML="<font color='red' size=2px>√</font>";
      				return true;
      			}
      		}
      		//密码
      		function checkPwd(){
      			var passwd=document.myForm.pwd.value;
      			if(passwd.length==0){
      				document.getElementById("pwdTd").innerHTML="<font color='red' size=2px>密码不能为空！</font>";
      				return false;
      			}
      			if(passwd.length<6){
      				document.getElementById("pwdTd").innerHTML="<font color='red' size=2px>密码不能少于6位！</font>";
      				return false;
      			}
      			else{
      				document.getElementById("pwdTd").innerHTML="<font color='red' size=2px>√</font>";
      				return true;
      			}
      		}
      		
      		
      		//总检查
      		function check(){
      			if(checkName()&&checkPwd()){
      				//window.alert("输入正确！");
      				return true;
      			}
      			else{
      				window.alert("提交失败！");
      				return false;
      			}
      		}
      		
     //-->
     </script>
	  <style type="text/css">
<!--
.text
{
border: 1px #0099FF solid;
}
-->
   </style>
</head>

<body>
<div style="width: 953px; height: 300px;"
			align="center">
			<div style="width: 750px; height: 180px;"
				align="center">
<!-- 用户信息、登录、注册 -->				
 <%@ include file="/commons/top.jsp" %>
<table width="750" height="80" border="0" cellpadding="0" cellspacing="0">
  
    <tr>
      <td style="border-bottom:1px #FF0000 dotted; border-left:1px #FF0000 solid; border-right:1px #FF0000 solid;">&nbsp;</td>
    </tr>
    <tr>
      <td>
	  
	  </td>
    </tr>
    <tr>
      <td>
	       <%
	       if(msg.equals("0")){
	       	 out.print("<font color='red' size=2px>请输入注册用户名和密码登陆！</font>");
	       }
	         if(msg.equals("1")){
	       	 out.print("<font color='red' size=2px>输入不正确，请重新登陆！</font>");
	       }
	         if(msg.equals("2")){
	          out.print("<font color='red' size=2px>该用户在线！</font>");
	         }
	         if(msg.equals("3")){
	          out.print("<font color='red' size=2px>修改用户信息成功！</font>");
	         }
	          if(msg.equals("4")){
	          out.print("<font color='red' size=2px>修改用户信息失败！</font>");
	         }
	         if(msg.equals("5")){
	          out.print("<font color='red' size=2px> 你没有修改权限，请确认！</font>");
	         }
	        
	        %>
	  </td>
    </tr>
 
</table>
<form name="myForm" id="myForm" action="doLogin.jsp" method="post" onSubmit="return check()">
<table width="750" height="100" border="0" style=" border-left:1px #FF0000 solid; border-right:1px #FF0000 solid;" align="center">
  <tr>
    <td height="100" align="center"><table width="400" border="0" cellpadding="0" cellspacing="0" >
      <tr>
        <td width="91" height="26" style="font-size:12px; color:#666666">用&nbsp;户&nbsp;名</td>
        <td ><input type="text" class="text"  name="userName" id="userName" onBlur="checkName()" value="" /></td>
         <td  width="130" id="userTd" name="userTd"></td>
      </tr>
      <tr>
        <td height="26" style="font-size:12px; color:#666666">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</td>
        <td><input type="password" class="text" name="pwd" id="pwd"  onBlur="checkPwd()" value=""  /></td>
         <td id="pwdTd" name="pwdTd"><br></td>
      </tr>
      <tr>
        <td></td>
      </tr>
      <tr>
        <td colspan="2" align="center" style="font-size:12px; color:#666666"><label></label></td>
           <td ><br></td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td height="20" align="center">
        <input type="submit" value="登   录" width="45" height="20" style="border:none; background-color:#FF9933; padding-top:0px;">
	</td>
  </tr>
</table>
</form>
 <!-- 底部-->
<%@ include file="/commons/bottom.jsp" %>
 </div>
 </div>
 <%} %>
</body>
</html>
