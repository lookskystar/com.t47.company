<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>


<%@include file="/commons/taglibs.jsp" %>

<%
               //废代码
             	//ProuctDao productDao = new ProductDaoImpl();
             	//Product product=new Product();
             	
             	//product=productDao.findProduct(1);
             	
             	//int proCount=productList.size();
             	//session.setAttribute("product",product);
             	//
             	
             
                 try{
             	Product product=(Product)request.getAttribute("product");
             	
             	if(product==null||"".equals(product)){
             		out.print("输入错误！");
             	}else{
             	//el表达式只能从作用域中取值
             	pageContext.setAttribute("product",product);
             	
             	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>品红人生—商品展示-商品信息</title>
  </head>
  
  <body>
  <div style="width:1000px;" align="center">
  
  
  
   <!-- 用户信息、登录、注册 -->
      <%@ include file="/commons/top.jsp" %>
	  <div style="width:750px; height:20px; " align="left"><a href="${ctx}/index.jsp">首页</a> >> <a href="${ctx }/proShowList/productList.jsp?page=1">商品展示</a> >> <a href="#">商品信息</a></div>
	  <table width="750" border="0" cellpadding="0" cellspacing="0" style="border-bottom:2px #FFB5B5 solid; ">
  <tr>
    <td width="184" height="33" valign="top">
	  <%@ include file="../commons/left.jsp" %>	</td>
		
	<td width="10" rowspan="2" valign="top" style="border-right:2px #FFB5B5 solid;">&nbsp;</td>
	
    <td width="556" rowspan="2" align="right" valign="top">
	
	  <table width="550" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="196" height="186" align="center" valign="top" style="padding-left:0px; padding-right:0px;"><img src="${ctx }${product.picture }" width="143" height="112" /></td>
    <td width="354" align="right" valign="top">
	
	<div style="border:1px #0099FF solid; padding:2px;">
	  <table width="348" height="183" border="0" cellpadding="0" cellspacing="0" style="border:1px #AECDF7 solid;">
  <tr>
    <td width="83" style="padding:3px; border-bottom:1px #AECDF7 solid; border-right:1px #AECDF7 solid;" bgcolor="#EEEEEE">产品名称</td>
    <td style="padding:3px; border-bottom:1px #AECDF7 solid; font-weight:900;">${pageScope.product.names}</td>
    </tr>
	<tr>
	    <td width="83" style="padding:3px; border-bottom:1px #AECDF7 solid; border-right:1px #AECDF7 solid;" bgcolor="#EEEEEE">产品品牌</td>
    <td width="263" style="padding:3px; border-bottom:1px #AECDF7 solid;">${product.brand }</td>
	</tr>
  <tr>
    <td style="padding:3px; border-bottom:1px #AECDF7 solid; border-right:1px #AECDF7 solid;" bgcolor="#EEEEEE">产品型号</td>
    <td style="padding:3px; border-bottom:1px #AECDF7 solid;">${product.model }</td>
    </tr>
	<tr>
	<td width="83" bgcolor="#EEEEEE" style="padding:3px; border-bottom:1px #AECDF7 solid; border-right:1px #AECDF7 solid;">产品价格</td>
    <td width="263" style="padding:3px; border-bottom:1px #AECDF7 solid; color:#FF0000;">￥${product.price }</td>
	</tr>
  <tr>
    <td height="66" bgcolor="#EEEEEE" style="padding:3px; border-bottom:1px #AECDF7 solid; border-right:1px #AECDF7 solid;">产品简介</td>
    <td valign="top" style="padding:3px; border-bottom:1px #AECDF7 solid;">${product.descriptions}</td>
    </tr>
</table>
</div>	
<!-- 购物车开始 -->
<%
if(loginUser==null){
 %>
<div style="width:348px; height:25px; color: red;">请登陆后订购该产品！</div>
 <%
 }else
 {
  %>

<div style="width:348px; height:25px; border-bottom:1px #0099FF solid;padding-top: 20px;"><img src="../image/buy_cn.gif" onClick="javascript:location.href='${ctx }/proShowList/productListAddCartAction.jsp?productId=<%=product.getProductId() %>&productName=<%=product.getNames() %>'">&nbsp;&nbsp;&nbsp;&nbsp;
<img src="../image/lcart_cn.gif" onClick="javascript:window.open('${ctx }/proShowList/productCart.jsp','','top=0,left=0,width=615,height=350,scrollbars=0,resizable=0'); "></div>

  
    <%
  }
%>

   <!-- 购物车结束 -->
</td>
  </tr>
</table>
<table width="200" height="47" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="../image/flay.jpg" width="530" height="195"></td>
  </tr>
</table>
	</td>
  </tr>
  <tr>
    <td valign="bottom"><img src="../image/hye.gif" width="186" height="198"></td>
  </tr>
</table>



  
  
  
  </div>
    <%@ include file="/commons/bottom.jsp" %>
    
    <%
   }
    }catch(Exception e){
    	e.printStackTrace();
    }
    
     %>
  </body>
</html>
