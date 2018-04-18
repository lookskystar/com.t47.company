<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
//String msg=(String)request.getAttribute("msg");
//request.setCharacterEncoding("utf-8");
//请求get中的中文字符不乱码的处理
//String msg=new String(request.getParameter("msg").getBytes("ISO-8859-1"));

String msg=(String)request.getParameter("msg");

//out.print(msg);
if(msg==null||"".equals(msg)){
//out.print("登陆输入错误，请返回！");

}else{
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>问红人生论坛-登录</title>
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
      		
      		
      		//总检查
      		function check(){
      			if(checkName()&&checkPwd()){
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
<div style="width: 953px; height: 300px;"
			align="center">
			<div style="width: 750px; height: 180px;"
				align="center">

<table width="750" height="80" border="0" cellpadding="0" cellspacing="0">
  <tbody>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>
	  <!-- 用户信息、登录、注册 -->
             <%@ include file="loginCommons.jsp" %>
	  </td>
    </tr>
    <tr>
      <td>
	       <%
	       if(msg.equals("0")){
	       	 out.print("<font color='red' size=2px>请输入你的用户名和密码！</font>");
	       }
	         if(msg.equals("1")){
	       	 out.print("<font color='red' size=2px>输入不正确，请重新登陆！</font>");
	       }
	        %>
	  </td>
    </tr>
  </tbody>
</table>
<form name="myForm" id="myForm" action="doLogin.jsp" method="post" onSubmit="return check()">
<table width="750" height="100" border="0" style=" border-left:1px #FF0000 solid; border-right:1px #FF0000 solid;" align="center">
  <tr>
    <td height="100" align="center"><table width="400" border="0" cellpadding="0" cellspacing="0" >
      <tr>
        <td width="91" height="26" style="font-size:12px; color:#666666">用&nbsp;户&nbsp;名</td>
        <td ><input type="text" class="register-input"  name="userName" id="userName" onMouseOver="this.className='mouseOverStyle'" onMouseOut="this.className='mouseOutStyle'"   onBlur="checkName()" value="" /></td>
         <td  width="130" id="userTd" name="userTd"></td>
      </tr>
      <tr>
        <td height="26" style="font-size:12px; color:#666666">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</td>
        <td><input type="password" class="register-input" name="pwd" id="pwd" onMouseOver="this.className='mouseOverStyle'" onMouseOut="this.className='mouseOutStyle'"  onBlur="checkPwd()" value=""  /></td>
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
 <%@ include file="footCommons.jsp" %>
 </div>
 </div>
 <%} %>
</body>
</html>
