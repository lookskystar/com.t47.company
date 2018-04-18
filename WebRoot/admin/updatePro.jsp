<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>



<%@page import="java.text.DecimalFormat"%>
<%@include file="/commons/taglibs.jsp" %>

<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>

<% 
               
                request.setCharacterEncoding("UTF-8");
                //消息：把删除产品、更新产品的结果传递给msg，显示在跳转的页面上
                String msg="";
                msg=(String)request.getAttribute("msg");
                if(msg==null||"".equals(msg)){
                    msg="无信息";
                }
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

<!--上一页，下一页开始-->
                 //分页
                  function findPage(page,pageCount){
		            if(page<1){
		            	page=1;
		            }
		            if(page>pageCount){
		            	page=pageCount;
		            }
			  		location.href="updatePro.jsp?page="+page;
			  		}

<!--上一页，下一页结束-->


<!--表单元素判断开始-->

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
	<table width="750" height="300" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="152" rowspan="2" valign="top" id="left" style="padding-left:3px; padding-top:5px;border:1px #FF0000 solid; border-style:solid; background-color:#f4f8fc;"><%@ include file="../commons/menuAdmin.jsp" %>
	 
	</td>
	
    <td width="26" rowspan="2" valign="top">
	<div style="background-image:url(${ctx}/image/feir.gif); width:20px; height:32px;" onClick="menuDivNone()"></div>	</td>
    <td width="622" height="39" align="left" valign="top" style="padding-left:10px; padding-top:15px;">
	<div style="width:600px; height:20px;"><img src="${ctx}/image/ico_oversea.gif" />更新产品</div>	</td>
  </tr>
  <tr>
    <td valign="top" style="padding-left:10px;" align="left">
	<!--上一页，下一页开始-->
	<div
					style="width: 555px; height: 30px; padding-left: 0px; padding-top: 10px; padding-bottom: 10px;"
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
	<% 
	 for(int i=0;i<productList.size();i++){
	 	Product product=(Product)productList.get(i);
	%>
	  <table width="524" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="109" align="center" style="padding-left:10px; padding-right:10px;"><a href="${ctx}/proDetail/doProduct.jsp?productId=<%=product.getProductId() %>"><img src="${ctx }<%=product.getPicture()%>" width="71" height="56" style="border: none;" /></a></td>
    <td width="415" align="right">
	
	<div style="border:1px #0099FF solid; padding:2px;">
	<table width="460" border="0" cellpadding="0" cellspacing="0" style="border:1px #AECDF7 solid;">
  <tr>
    <td width="77" style="padding:3px; border-bottom:1px #AECDF7 solid; border-right:1px #AECDF7 solid;" bgcolor="#EEEEEE">产品名称</td>
    <td width="132" style="padding:3px; border-bottom:1px #AECDF7 solid; font-weight:900;"><a href="${ctx}/proDetail/doProduct.jsp?productId=<%=product.getProductId() %>"><%=product.getNames() %></a></td>
    <td width="75" style="padding:3px; border-bottom:1px #AECDF7 solid; border-right:1px #AECDF7 solid;" bgcolor="#EEEEEE">产品品牌</td>
    <td width="127" style="padding:3px; border-bottom:1px #AECDF7 solid;"><%=product.getBrand() %></td>
    <td width="47" align="center" style="padding:3px; border-left:1px #AECDF7 solid; color:#0000FF;"><a href="updateProDetail.jsp?productId=<%=product.getProductId() %>">[修改]</a></td>
  </tr>
  <tr>
    <td style="padding:3px; border-bottom:1px #AECDF7 solid; border-right:1px #AECDF7 solid;" bgcolor="#EEEEEE">产品型号</td>
    <td style="padding:3px; border-bottom:1px #AECDF7 solid;"><%=product.getModel() %></td>
    <td style="padding:3px; border-bottom:1px #AECDF7 solid; border-right:1px #AECDF7 solid;" bgcolor="#EEEEEE">产品价格</td>
    <td style="padding:3px; border-bottom:1px #AECDF7 solid; color:#FF0000;">￥<%=new DecimalFormat("0.00").format(product.getPrice()) %></td>
    <td align="center" style="padding:3px; border-left:1px #AECDF7 solid; color:#0000FF;"><a href="updateProDelAction.jsp?productId=<%=product.getProductId() %>&productName=<%=product.getNames() %>&productImage=<%=product.getPicture() %>">[删除]</a></td>
  </tr>
</table>
</div>	</td>
  </tr>
</table>
<%
}
 %>
<br />

<!--上一页，下一页开始-->
	<div
					style="width: 555px; height: 30px; padding-left: 0px; padding-top: 10px; padding-bottom: 10px;"
					align="left">
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
  
	</td>
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
