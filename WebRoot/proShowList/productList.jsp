<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>

<%@ page import="java.text.*" %>

<%@include file="/commons/taglibs.jsp" %>

<%
                 
             String msgShow="无信息！";
             String msgStr = request.getParameter("msg"); //页数
             if(msgStr==null||"".equals(msgStr)){
             	msgShow="无信息！";
             }else{
              	int msg=Integer.parseInt(msgStr);
              	if(msg==0){
              		msgShow="产品添加到购物车成功！";
              	}
              	if(msg==1){
              		msgShow="购物车取消购物成功！";
              	}
             }
           
             	
            
       	
             	//session.setAttribute("productList",productList);
             	
             	
             	//分页
             	int pageCount=0;  //最大页面数
             	int p=1;    //当前页面数
             	
             	String pStr = request.getParameter("page"); //页数
                p = Integer.parseInt(pStr); //获得当前页面数
             	
             	
             	ProuctDao productDao = new ProductDaoImpl();
             
             	List productList = productDao.findListProduct(p);	
             	
             	int num = productDao.findCountProduct(); //取得该产品条数
             	
             	int proCount=productList.size();          
             	//out.print("list:"+proCount);
                 
             	pageCount = productDao.getCountRows(); //取得总页数
             	//当前页数最大最小判断，如果小于最小页面就等于最小页面，大于最大页面就等于最大页面
             	
			if (p < 1) {
				p = 1;
			}
			if (p > pageCount) {
				p = pageCount;
			}
             
             	
             	
%>








<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>品红人生——商品展示</title>
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
      	 /*超链接无下划线样式*/
	  A
		{
			/*color:#FF9900;*/
			color:#666666;
			text-decoration:none;
			font-size:12px;
		}
	A:hover
		{
			color:#0099FF;
			text-decoration:none;
		}
		.cartTitle{
		     color:#000000;
			 font-weight:700;
		}
-->
</style>
    
    
    <script type="text/javascript">
<!--              
                 //分页
                  function findPage(page,pageCount){
		            if(page<1){
		            	page=1;
		            }
		            if(page>pageCount){
		            	page=pageCount;
		            }
			  		location.href="productList.jsp?page="+page;
			  		}
//-->
</script>
    
  </head>
  
  <body>
  <div style="width:1000px;" align="center">
  
  
  
   <!-- 用户信息、登录、注册 -->
      <%@ include file="/commons/top.jsp" %>
	  <div style="width:750px; height:20px; " align="left"><a href="${ctx}/index.jsp">首页</a> >> <a href="#">商品展示</a></div>
	
	<!--上一页，下一页开始-->
				<div
					style="width: 750px; height: 30px; padding-left: 0px; padding-top: 10px; padding-bottom: 10px;"
					align="right">
					<input type="button"
						onClick="findPage(<%=p - 1%>,<%=pageCount%>)"
						value="上一页"
						style="background-image: url(${ctx }/image/next.gif); width: 73px; height: 29px; border: none;">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button"
						onClick="findPage(<%=p + 1%>,<%=pageCount%>)"
						value="下一页"
						style="background-image: url(${ctx }/image/next.gif); width: 73px; height: 29px; border: none;">
				</div>
				<!--上一页，下一页结束-->
						<!--+显示页数开始+-->
				
				<%
				//如果是0页就显示1页
				int count=pageCount;
				int ip=p;
				if(pageCount==0){
					count=1;
					ip=1;
				}
				 %>
			  <div
					style="width: 750px; height: 25px; font: 13px; color: #FFFFFF; border-bottom:1px #FF0000 solid; background-image: url(${ctx }/image/title.gif); font-size: 12px; color: #333333;"
					align="left">
					&nbsp;&nbsp;共&nbsp;<%=count%>&nbsp;页(每页&nbsp;9&nbsp;条产品信息)&nbsp;&nbsp;现在是第&nbsp;
					<font color="#FF0000"><%=ip%></font>&nbsp;页 &nbsp;&nbsp;有&nbsp;<%=num%>
					&nbsp;条产品信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF0000">提示信息：<%= msgShow%></font>
	</div>
				<!--+显示页数end+-->
				
	  <table width="750" height="406" border="0" cellpadding="0" cellspacing="0" style="border-bottom:2px #FFB5B5 solid; ">
  <tr>
    <td width="184" height="30" valign="top" style="padding-top:5px;"><%@ include file="../commons/left.jsp" %>	<br></td>
		
	<td width="10" rowspan="3" valign="top" style="border-right:2px #FFB5B5 solid;">&nbsp;</td>
	
    <td width="556" rowspan="3" align="right" valign="top" style="padding-top:5px;">
	
	<%
	for(int i=0;i<productList.size();i++){
             	    Product product=(Product)productList.get(i);
    
	 %>
	  <table width="524" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="109" align="center" style="padding-left:10px; padding-right:10px;"><a href="${ctx}/proDetail/doProduct.jsp?productId=<%=product.getProductId() %>"><img src="${ctx }<%=product.getPicture()%>" width="71" height="56" style="border: none;" /></a></td>
    <td width="415" align="right">
	
	<div style="border:1px #0099FF solid; padding:2px; width:460">
	<table width="460" border="0" cellpadding="0" cellspacing="0" style="border:1px #AECDF7 solid;">
  <tr>
    <td width="80" style="padding:3px; border-bottom:1px #AECDF7 solid; border-right:1px #AECDF7 solid;" bgcolor="#EEEEEE">产品名称</td>
    <td width="134" style="padding:3px; border-bottom:1px #AECDF7 solid; font-weight:900;"><a href="${ctx}/proDetail/doProduct.jsp?productId=<%=product.getProductId() %>"><%=product.getNames() %></a></td>
    <td width="78" style="padding:3px; border-bottom:1px #AECDF7 solid; border-right:1px #AECDF7 solid;" bgcolor="#EEEEEE">产品品牌</td>
    <td width="176" style="padding:3px; border-bottom:1px #AECDF7 solid;"><%=product.getBrand() %></td>
  </tr>
  <tr>
    <td style="padding:3px; border-bottom:1px #AECDF7 solid; border-right:1px #AECDF7 solid;" bgcolor="#EEEEEE">产品型号</td>
    <td style="padding:3px; border-bottom:1px #AECDF7 solid;"><%=product.getModel() %></td>
    <td style="padding:3px; border-bottom:1px #AECDF7 solid; border-right:1px #AECDF7 solid;" bgcolor="#EEEEEE">产品价格</td>
    <td style="padding:3px; border-bottom:1px #AECDF7 solid; color:#FF0000;">￥<%=new DecimalFormat("0.00").format( product.getPrice()) %></td>
  </tr>
</table>
</div>	</td>
  </tr>
</table>
<!-- 购物车开始 -->
<%
if(loginUser==null){
 %>
<div style="width:558px; height:25px; color: red;">请登陆后订购该产品！</div>
 <%
 }else
 {
  %>
<div style="width:558px; height:25px; border-bottom:1px #0099FF solid;"><img src="../image/buy_cn.gif" onClick="javascript:location.href='productListAddCartAction.jsp?productId=<%=product.getProductId() %>&productName=<%=product.getNames() %>'">&nbsp;&nbsp;&nbsp;&nbsp;
<img src="../image/lcart_cn.gif" onClick="javascript:window.open('productCart.jsp','','top=0,left=0,width=750,height=350,scrollbars=0,resizable=0'); "></div>
<br />

<%
  }
}
 %>
 <!-- 购物车 -->
 <!--上一页，下一页开始-->
				<div
					style="width: 524px; height: 30px; padding-left: 0px; padding-top: 10px; padding-bottom: 10px;"
					align="right">
					<input type="button"
						onClick="findPage(<%=p - 1%>,<%=pageCount%>)"
						value="上一页"
						style="background-image: url(${ctx }/image/next.gif); width: 73px; height: 29px; border: none;">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button"
						onClick="findPage(<%=p + 1%>,<%=pageCount%>)"
						value="下一页"
						style="background-image: url(${ctx }/image/next.gif); width: 73px; height: 29px; border: none;">
				</div>
				<!--上一页，下一页结束-->	</td>
  </tr>
  <tr>
    <td height="126" valign="bottom"><img src="../image/yun.gif" width="186" height="260"></td>
  </tr>
  <tr>
    <td valign="bottom"><img src="../image/hye.gif" width="186" height="198"></td>
  </tr>
</table>



  
  
  
  </div>
    <%@ include file="/commons/bottom.jsp" %>
  </body>
  
 
</html>

