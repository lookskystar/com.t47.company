<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="java.io.*"%>
<%@page import="dao.NewsDao"%>
<%@page import="dao.impl.NewsDaoImpl"%>
<%@page import="entity.News"%>




<%@include file="/commons/taglibs.jsp" %>

<% 
                 request.setCharacterEncoding("UTF-8");
                //消息：把删除产品、更新产品的结果传递给msg，显示在跳转的页面上
                String msg="";
                msg=(String)request.getAttribute("msg");
                if(msg==null||"".equals(msg)){
                    msg="无信息";
                }
                
                String newsIDStr=request.getParameter("newsID");
                if(newsIDStr==null||"".equals(newsIDStr)){
                	out.print("传输错误！");
                }else{
                	int newsID=Integer.parseInt(newsIDStr);
                	News news=new News();
                	NewsDao newDao=new NewsDaoImpl();
                	news=newDao.findNews(newsID);
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
//标题
function LostFocusCheckNewTitle()
{
     var model=document.myForm.newsName.value;
	if(model.length==0)
	{
	    document.getElementById("errortitl").innerHTML="<font color='red'>&nbsp;&nbsp;新闻标题不能为空</font>";
		document.myForm.newsName.value="";
		return false;
	} 
	else if(model.length>10)
	{
	    document.getElementById("errortitl").innerHTML="<font color='red'>&nbsp;&nbsp;新闻标题名不能大于10个字符</font>";
		document.myForm.newsName.value="";
		return false;
	} 
	else
	{
	    document.getElementById("errortitl").innerHTML="<font color='red'>&nbsp;&nbsp;√</font>";
		return true;
	}
	return false;
}

//描述

function LostFocusCheckContent()
{
     //document.myForm.proDescriptions.value='无内容！';
     var descriptions=document.myForm.newsContent.value;
	if(descriptions.length==0)
	{
	    document.getElementById("errorcontent").innerHTML="<font color='red'>&nbsp;&nbsp;内容不能为空</font>";
		document.myForm.newsContent.value="";
		return false;
	} 
	else if(descriptions.length>1500)
	{
	    document.getElementById("errorcontent").innerHTML="<font color='red'>&nbsp;&nbsp;内容不能大于1500个字符</font>";
		document.myForm.newsContent.value="";
		return false;
	} 
	else
	{
	    document.getElementById("errorcontent").innerHTML="<font color='red'>&nbsp;&nbsp;√</font>";
		return true;
	}
	return false;
}


//提交
function checkNews()
{
	if(LostFocusCheckNewTitle()&&LostFocusCheckContent())
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
    <td width="155" rowspan="2" valign="top" id="left" style="padding-left:10px; padding-top:10px;border:1px #FF0000 solid; border-style:solid; background-color:#f4f8fc;"><%@ include file="../commons/menuAdmin.jsp" %>	<br></td>
	
    <td width="26" rowspan="2" valign="top"><div style="background-image:url(${ctx}/image/feir.gif); width:20px; height:32px;" onClick="menuDivNone()"></div>
		</td>
    <td width="400" height="39" align="left" valign="top" style="padding-left:10px; padding-top:15px;">
	<div style="width:600px; height:20px;"><img src="${ctx}/image/ico_oversea.gif" />修改新闻</div>	</td>
  </tr>
  <tr>
    <td valign="middle" style="padding-left:10px; padding-top:15px;" align="center">
	<form name="myForm" id="myForm" action="updateNewsDetailAction.jsp" method="post"  onSubmit="return checkNews()">
	<input type="hidden" name="newsID" id="newsID" value="<%=newsID %>">
	  <table width="533" border="0" cellpadding="0" cellspacing="0" >
        <tr>
          <td height="22" colspan="4" align="center" ><table width="533" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="10" style="background-image:url(${ctx}/image/titlemu_1.gif)">&nbsp;</td>
                <td width="504"  style="background-image:url(${ctx}/image/titlemu_2.gif)">&nbsp;</td>
                <td width="19" style="background-image:url(${ctx}/image/titlemu_3.gif); background-repeat:no-repeat">&nbsp;</td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td colspan="4" align="center">修改新闻</td>
        </tr><tr>
          <td colspan="4" align="center">&nbsp;</td>
        </tr><tr>
          <td align="right" style="color:#FF0000">&nbsp;</td>
          <td align="left" style="color:#FF0000">&nbsp;</td>
          <td width="237" align="left" style="color:#FF0000">&nbsp;</td>
          <td align="left" style="color:#FF0000">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="4" align="right" >&nbsp;</td>
        </tr>
        <tr>
          <td width="88" align="right">新闻名称：</td>
          <td width="8">&nbsp;</td>
          <td><span style="color:#FF0000">
            <input name="newsName" type="text" class="text" id="newsName" maxlength="10" value="<%=news.getTitle() %>" onBlur="LostFocusCheckNewTitle()">
          </span></td>
          <td width="134" id="errortitl">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td  align="right">新闻内容：</td>
          <td >&nbsp;</td>
          <td colspan="2" ><table width="381" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="340"><textarea name="newsContent" cols="45" rows="15" id="newsContent" style="border:1px #0099FF solid;" onBlur="LostFocusCheckContent()"><%=news.getContent() %></textarea></td>
                <td width="41">&nbsp;</td>
              </tr>
              <tr>
                <td align="right" id="errorcontent"><font color="#FF0000">(新闻内容不能大于1500字)</font></td>
                <td>&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        <tr>
          <td colspan="4" align="right">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="4" align="center"><input type="submit" name="Submit" value="修  改" style="border:none; background-color:#FF9933; padding-top:0px;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" name="Submit" value="重  置" style="border:none; background-color:#FF9933; padding-top:0px;" onClick="checkImage()">          </td>
        </tr>
        <tr>
          <td colspan="4" align="center"><table width="529" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="76" height="19" style="background-image:url(${ctx}/image/T_bottomleft.gif)">&nbsp;</td>
                <td width="308" style="background-image:url(${ctx}/image/T_bottombg.gif)">&nbsp;</td>
                <td width="145" style="background-image:url(${ctx}/image/T_bottomright.gif); background-repeat:no-repeat;">&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      </table>
	</form>	</td>
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



