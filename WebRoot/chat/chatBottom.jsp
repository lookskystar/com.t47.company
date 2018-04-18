<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<%@ page import="entity.*"%>
<%@ page import="dao.*"%>
<%@ page import="dao.impl.*"%>
<%@include file="/commons/taglibs.jsp"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    <title>底部的部分</title>
   <script type="text/javascript">
<!--
function formCheck(){
  var message=document.getElementById("message");
  if(message.value==""){
     alert("请输入发送的信息");
     message.focus();
     return false;
  }
  return true;
}
//-->
</script>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"><style type="text/css">
<!--
body {
	background-color: #EBD9FF;
}
-->
</style></head>
  
  <body>
  
  <!-- 用户信息、登录、注册 -->
                            <%
                                 User loginUser=null;
	                             if(session.getAttribute("user")==null){
	                               out.print("你没有登入！");
                            
  } else{
  loginUser=(User)session.getAttribute("user");
    
   %>
  
     <form action="chatLeft.jsp" method="post" onSubmit="return formCheck()" target="leftFrame">
        <div style="padding-left: 130px;"><font color="red"><%=loginUser.getUName()%></font>&nbsp;请输入发送信息：<input name="message" type="text" size="50"  style="border: 1px #0099FF solid;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="btnOk" type="submit" value="发 送" style="border:none; background-color:#FF9933; padding-top:0px;"></div>
     </form>
<br />
<table width="100%">
   <tr>
     <td align="left"><a onclick="javascript:window.open('../index.jsp');"><font color="red">返回首页</font></a></td>
     <td align="right"><a href="chatExit.jsp?userId=<%=loginUser.getUId() %>"><font color="red">安全退出</font></a></td>
   </tr>
</table>

  </body>
</html>
  <%
  }
   %>