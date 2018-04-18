<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>

<%@include file="/commons/taglibs.jsp" %>

<%
             	NewsDao newsDao = new NewsDaoImpl();
             	News news=new News();
             	
             	news=newsDao.findNews(2);
             	
             	//int proCount=productList.size();
             	//session.setAttribute("product",product);
             	//el表达式只能从作用域中取值
             	pageContext.setAttribute("news",news);
             	
             	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>品红人生—售后服务</title>
  </head>
  
  <body>
  <div style="width:1000px;" align="center">
  
  
  
   <!-- 用户信息、登录、注册 -->
      <%@ include file="/commons/top.jsp" %>
	  <div style="width:750px; height:20px; " align="left"><a href="${ctx}/index.jsp">首页</a> >> <a href="#">售后服务</a></div>
	  <table width="750" border="0" cellpadding="0" cellspacing="0" style="border-bottom:2px #FFB5B5 solid; ">
  <tr>
    <td width="184" height="33" valign="top">
	  <%@ include file="../commons/left.jsp" %>	</td>
		
	<td width="10" rowspan="2" valign="top" style="border-right:2px #FFB5B5 solid;">&nbsp;</td>
	
    <td width="556" rowspan="2" align="left" valign="top">
	
	  <table width="550" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="23" height="186" align="center" valign="top" style="padding-left:0px; padding-right:0px;">&nbsp;</td>
    <td width="527" align="left" valign="top">
	
	<div style="padding:2px;">
	  <table width="509" height="183" border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <td colspan="2"  style="padding:3px; ">
	<table width="506" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="496" background="../image/cg2.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" style="font-weight:900">态度决定一切，沟通解决一切</td>
  </tr>
  <tr>
    <td background="../image/cg2.jpg">&nbsp;</td>
  </tr>
</table>	</td>
    </tr>
	<tr>
	    <td colspan="2"  style="padding:3px; ">&nbsp;</td>
    </tr>
  <tr>
    <td colspan="2"  style="padding-left:3px; overflow:hidden;background-color: #FFFFFF; font-size: 14px; font-family: '宋体'; color: #666666;  padding-left: 10px; letter-spacing: 0.2em; line-height: 150%; word-wrap: break-word; word-break: break-all; width: 500px; padding-top:5px;">&nbsp;&nbsp;&nbsp;&nbsp;
    本公司购买的商品，保证七天内无条件退、换商品；如有质量问题保证在一个月内换货，三个月内免费维
修。
<br/>
保修期内的维修服务：
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;此类商品所承诺的免费服务期内,您所购货物出现故障时,可拨打售后服务免费热线电话进行报修.我们将会

在下一工作日或您指定的日期(法定节假日除外)提供免费服务.如损坏零件不属于保修范围之内,仅收取零

件的成本费用,并进行更换.

6.2保修期外的维修服务:

对您购买的,但已处于保修期外的商品,我们将按保修期外维修服务标准向您提供服务,对于保修期外的维修

,您需要承担的费用,包括维修所更换的零配件成本,维修费用;如果您需要上门服务,不定期需承担工程师现

场维修的上门服务费.
    </td>
    </tr>
	<tr>
	<td colspan="2"  style="padding:3px; ">&nbsp;</td>
    </tr>
  <tr>
    <td width="349" height="66" rowspan="2"  style="padding:3px; border-bottom:1px #AECDF7 solid; border-right:1px #AECDF7 solid;">&nbsp;</td>
    <td width="158" align="center" valign="top" style="padding:3px; border-top: 1px #AECDF7 solid; border-right: 1px #AECDF7 solid;"><p><img src="../image/tpinghong.gif"></td>
    </tr>
  <tr>
    <td align="center" valign="top" style="padding:3px; border-bottom:1px #AECDF7 solid; font-weight:800; color:#FF0000"></td>
  </tr>
</table>
</div>	</td>
  </tr>
</table>
<br />
	</td>
  </tr>
  <tr>
    <td valign="bottom"><img src="../image/hye.gif" width="186" height="198"></td>
  </tr>
</table>



  
  
  
  </div>
    <%@ include file="/commons/bottom.jsp" %>
  </body>
</html>
