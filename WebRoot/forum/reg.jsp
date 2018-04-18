<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<% 
String msg=(String)request.getParameter("msg");
if(msg==null||"".equals(msg)){
	out.print("输入错误，请返回！");
}else{
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>问红人生论坛-注册</title>
    

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
      				document.getElementById("userTd").innerHTML="√";
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
      				document.getElementById("pwdTd").innerHTML="√";
      				return true;
      			}
      		}
      		//重复密码
      		function checkFPwd(){
      			var fpasswd=document.myForm.fpwd.value;
      			var passwdf=document.myForm.pwd.value;
      			if(fpasswd.length==0){
      				document.getElementById("fpwdTd").innerHTML="<font color='red' size=2px>重复密码不能为空</font>";
      				return false;
      			}
      			if(passwdf!=fpasswd){
      				document.getElementById("fpwdTd").innerHTML="<font color='red' size=2px>密码不等！</font>";
      				return false;
      			}
      			else{
      				document.getElementById("fpwdTd").innerHTML="√";
      				return true;
      			}
      		}
      		
      		//总检查
      		function check(){
      			if(checkName()&&checkPwd()&&checkFPwd()){
      				window.alert("输入正确！");
      				return true;
      			}
      			else{
      				window.alert("输入失败！");
      				return false;
      			}
      		}
      		
     //-->
     </script>
  </head>

<body>
<div style="width: 953px; height: 900px;"
			align="center">
			<div style="width: 750px; height: 700px; border-left:1px #FF0000 solid; border-right:1px #FF0000 solid;"
				align="center" >

<table width="750" height="81" border="0" cellpadding="0" cellspacing="0">
  <tbody>
    <tr>
      <td>
	  <!-- 用户信息、登录、注册 -->
      <%@ include file="loginCommons.jsp" %>
	  </td>
    </tr>
    <tr>
      <td><div style="width: 750px; height: 25px; background-image:url(image/titlemu_2.gif); font-size:14px; color:#FF0000;padding-left: 3px; padding-top: 3px;">
	     会员注册
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=msg%></div></td>
    </tr>
  </tbody>
</table>
<form name="myForm" id="myForm" action="doReg.jsp" method="post" onSubmit="return check()">
<table width="750" height="486" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="750" height="161" align="center"><table width="400" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="91" height="26" style="font-size:12px; color:#666666">用&nbsp;户&nbsp;名</td>
        <td>
          <input type="text" name="userName" id="userName" class="register-input"  onMouseOver="this.className='mouseOverStyle'" onMouseOut="this.className='mouseOutStyle'" onBlur="checkName()"/>
        </td>
        <td  width="130" id="userTd" name="userTd"></td>
      </tr>
      <tr>
        <td height="26" style="font-size:12px; color:#666666">密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
        <td><input type="password" name="pwd" id="pwd" class="register-input"  onMouseOver="this.className='mouseOverStyle'" onMouseOut="this.className='mouseOutStyle'" onBlur="checkPwd()"/></td>
        <td id="pwdTd" name="pwdTd"><br></td>
      </tr>
      <tr>
        <td height="24" style="font-size:12px; color:#666666">重复密码</td>
        <td><input type="password" name="fpwd" id="fpwd" class="register-input"  onMouseOver="this.className='mouseOverStyle'" onMouseOut="this.className='mouseOutStyle'" onBlur="checkFPwd()"/></td>
       <td id="fpwdTd" name="fpwdTd"></td>
      </tr>
      <tr>
        <td colspan="2" align="center" style="font-size:12px; color:#666666">性别 女
          <label>
          <input type="radio" name="gender" value="0" />
          男
          <input name="gender" type="radio" value="1" checked="checked" />
          
          </label></td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td height="17" align="center" background="image/d_r11_15.jpg" style=" font-size:12px; color:#ffffff; font-weight:500; padding-top:2px;">请选择头像</td>
  </tr>
  <tr>
    <td height="279" align="center" style="padding-top:10px;">
    <table width="574" border="0" cellpadding="0" cellspacing="0" style="border-left:1px #FF3300 solid; border-right:1px #FF3300 solid">
	<tr>
        <td height="28" colspan="5" align="center" background="image/title.gif" >&nbsp;</td>
	</tr>
      <tr>
        <td width="100"><img src="image/head/1.gif" width="70" height="70" />
          <input type="radio" name="head" value="1.gif"  checked="checked"/></td>
        <td width="110"><img src="image/head/2.gif" width="70" height="70" />
          <input type="radio" name="head" value="2.gif" /></td>
        <td width="110"><img src="image/head/3.gif" width="70" height="70" />
          <input type="radio" name="head" value="3.gif" /></td>
        <td width="110"><img src="image/head/4.gif" width="70" height="70" />
          <input type="radio" name="head" value="4.gif" /></td>
        <td width="110"><img src="image/head/5.gif" width="70" height="70" />
          <input type="radio" name="head" value="5.gif" /></td>
      </tr>
      <tr>
        <td><img src="image/head/6.gif" width="70" height="70" />
          <input type="radio" name="head" value="6.gif" /></td>
        <td><img src="image/head/7.gif" width="70" height="70" />
          <input type="radio" name="head" value="7.gif" /></td>
        <td><img src="image/head/8.gif" width="70" height="70" />
          <input type="radio" name="head" value="8.gif" /></td>
        <td><img src="image/head/10.gif" width="70" height="70" />
          <input type="radio" name="head" value="10.gif" /></td>
        <td><img src="image/head/11.gif" width="70" height="70" />
          <input type="radio" name="head" value="11.gif" /></td>
      </tr>
      <tr>
        <td><img src="image/head/11.gif" width="70" height="70" />
          <input type="radio" name="head" value="11.gif" /></td>
        <td><img src="image/head/12.gif" width="70" height="70" />
          <input type="radio" name="head" value="12.gif" /></td>
        <td><img src="image/head/13.gif" width="70" height="70" />
          <input type="radio" name="head" value="13.gif" /></td>
        <td><img src="image/head/14.gif" width="70" height="70" />
          <input type="radio" name="head" value="14.gif" /></td>
        <td><img src="image/head/15.gif" width="70" height="70" />
          <input type="radio" name="head" value="15.gif" /></td>
      </tr>
      <tr>
        <td height="28" colspan="5" align="center" background="image/title.gif" ><input type="submit" value="注   册" style="background-image:url(image/next.gif); width:73px; height:29px ;border:none;" ></td>
        </tr>
    </table> 
    
    
    </td>
  </tr>
</table>
</form>
</div>
 <!-- 底部-->
<%@ include file="footCommons.jsp" %>
</div>
<%} %>
</body>
</html>
