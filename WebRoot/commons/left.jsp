<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="taglibs.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'left.jsp' starting page</title>
	
       <style type="text/css">
    <!--
       body {
	         margin-left: 0px;
	         margin-top: 0px;
	         margin-right: 0px;
	         margin-bottom: 0px;
	         font-size: 12px;
	         color: black;
            }
      td {
      		font-size: 12px;
      		color:#333333;
			font-family:"新宋体";
      	 }
-->
</style>
  </head>
  
  <body>
   <table width="177" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2" align="center" onClick="javascript:location.assign('${ctx}/newsShowList/newsList.jsp?page=1')"><img src="${ctx }/image/cg1_r1_c2.jpg"></td>
    </tr>
  <tr>
    <td colspan="2" align="center" onClick="javascript:location.assign('${ctx}/proShowList/productList.jsp?page=1')"><img src="${ctx }/image/cg1_r2_c2.jpg"></td>
    </tr>
  <tr>
    <td colspan="2"></td>
    </tr>
  <tr>
    <td colspan="2" align="center" onClick="javascript:location.assign('${ctx}/after/after.jsp')"><img src="${ctx }/image/cg1_r4_c2.jpg"></td>
    </tr>
  <tr>
    <td colspan="2" align="center" onClick="javascript:location.assign('${ctx}/about/about.jsp')"><img src="../image/cg1_r6_c2.jpg"></td>
    </tr>
  <tr>
    <td width="27">&nbsp;</td>
    <td width="173">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"><img src="${ctx }/image/cg1_r10_c1.jpg"></td>
    </tr>
  <tr>
    <td><img src="${ctx }/image/cg5_1.jpg"></td>
    <td>业务专线：010-88888888</td>
  </tr>
  <tr>
    <td><img src="${ctx }/image/cg5_1.jpg"></td>
    <td>售后服务：010-99999999</td>
  </tr>
    <tr>
    <td><img src="${ctx }/image/cg5_1.jpg"></td>
    <td>传真号码：010-66666666</td>
  </tr>
</table>

  </body>
</html>
