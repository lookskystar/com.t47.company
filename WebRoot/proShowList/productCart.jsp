



<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*"%>
<%@ page import="dao.*"%>
<%@ page import="dao.impl.*"%>
<%@include file="/commons/taglibs.jsp"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
	<head>

		<title>问红-购物车</title>

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
	color: #333333;
	font-family: "新宋体";
}

/*超链接无下划线样式*/
A { /*color:#FF9900;*/
	color: #666666;
	text-decoration: none;
	font-size: 12px;
}

A:hover {
	color: #0099FF;
	text-decoration: none;
}

.cartTitle {
	color: #000000;
	font-weight: 700;
}
-->
</style>


<script type="text/javascript">
//购物车需要，传递给影藏域值
<!--
function updateId(productId){
 	document.cartForm.productId.value=productId;
 	document.cartForm.opt.value='update';
    document.cartForm.submit();
   //alert(productId);
}
function deleteId(productId){
  document.cartForm.productId.value=productId;
  document.cartForm.opt.value='delete';
  document.cartForm.submit();
  //alert(productId);
}



//-->
</script>

	</head>
	<body>
		<%
			//书上的代码
			//显示购物车中的产品
			//Map cart=(Map)session.getAttribute("carts");
			//double total=0;

			//if(cart==null||cart.size()==0){
			//out.print("购物车为空");
			//}else{
			//创建用于显示内容的变量
			//Set cartItems=cart.keySet();
			//Object[] productId=cartItems.toArray();
			//Product product=null;
			//CartItemProduct cartItemProduct=null;

			//int qty=0;
			//double price,subtotal=0;

			/////
			//int i=0;
			//while(i< productId.length){
			//计算总和
			//cartItemProduct=(CartItemProduct)cart.get(productId[i]);
			//product=cartItemProduct.getProduct();
			//qty=cartItemProduct.getQty();
			//price=无;
			//subtotal=无;
			//total=无;
			//i++;
		%>


<!-- 用户信息、登录、注册 -->
                            <%
                                 User loginUser=null;
	                             if(session.getAttribute("user")==null){
	                               out.print("你没有登入！");
                            
  } else{
  loginUser=(User)session.getAttribute("user");
    
   %>
	


		<!--购物车层设置开始-->
		<DIV class="search-top" id="cart"
			style="display: block; width: 750px; left: 2px; top: 2px; position: absolute; border-left: : 1px #0000FF solid; height: 360px;">
			<DIV class="search-menu">
				<TABLE width="752" border="0" cellspacing="0" cellpadding="0">
					<TR>
					  <TD width="9"
							style="background-image: url(${ctx }/image/titlemu_2.gif);">&nbsp;					  </TD>
						<TD width="722" align="left"
							style="background-image: url(${ctx }/image/titlemu_2.gif); font-size: 12px">
							<font color="red"><%=loginUser.getUName()%></font>&nbsp;&nbsp;的购物车
					  </TD>
						<TD width="19" align="right"
							style="background-image: url(${ctx }/image/titlemu_2.gif);"></TD>
					</TR>
			  </TABLE>
			</DIV>
			<div
				style="width: 750px; height: 320px; background-color: #FFFFFF; border-left: 1px #FF0000 solid; border-right: 1px #FF0000 solid; overflow-y: auto; white-space: nowrap;">
				<table width="750" border="0" cellspacing="0" cellpadding="0">

					<tr>
						<td height="15" colspan="9" align="right"
							style="background-image: url(${ctx }/image/title.gif); font-size: 12px">
							【购物车中商品】						</td>
					</tr>
					<tr align="center">
						<td width="100" height="20" align="left" class="cartTitle">
							编号						</td>
						<td width="180" align="left" class="cartTitle">
							名称						</td>
						<td width="80" align="left" class="cartTitle">
							型号						</td>
						<td width="35" align="left" class="cartTitle">
							数量						</td>
						<td width="130" align="left" class="cartTitle">
							价格						</td>
						<td width="150" align="left" class="cartTitle">
							总价						</td>
						<td width="47" align="center" valign="middle" class="cartTitle">修改</td>
					    <td width="105" align="center" valign="middle" class="cartTitle">删除</td>
					</tr>

					<c:set var="total" value="0 " scope="page" />

					<!--没有订购前，空指针处理？2009-06-06  -->
					<c:if test="${fn:length(sessionScope.cartSession)!=0}">
                      
                      <form name="cartForm" action="updateProductCartAction.jsp" method="post">
                       
                       <!-- 隐藏域传递产品Id和更新词 -->
		                <input type="hidden" name="opt" id="opt">
		                <input type="hidden" name="productId" id="productId">
                       
						<c:forEach items="${sessionScope.cartSession}" var="cart"
							varStatus="str">

							<tr align="center">
								<td align="left"
									style="overflow: hidden; border-top: 1px #FF0000 dotted; padding-left: 0px; letter-spacing: 0.2em; line-height: 150%; word-wrap: break-word; word-break: break-all; padding-bottom: 20px;" width="100">
									${cart.value.product.serialNumber}								</td>
								<td align="left"
									style="overflow: hidden; border-top: 1px #FF0000 dotted; padding-left: 0px; letter-spacing: 0.2em; line-height: 150%; word-wrap: break-word; word-break: break-all; padding-bottom: 20px; color: #0033FF" width="180">
									${cart.value.product.names}								</td>
								<td align="left"
									style="overflow: hidden; border-top: 1px #FF0000 dotted; padding-left: 0px; letter-spacing: 0.2em; line-height: 150%; word-wrap: break-word; word-break: break-all; padding-bottom: 20px;" width="80">
									${cart.value.product.model}								</td>
								<td align="left"
									style="overflow: hidden; border-top: 1px #FF0000 dotted; padding-left: 0px; letter-spacing: 0.2em; line-height: 150%; word-wrap: break-word; word-break: break-all; padding-bottom: 20px;" width="35">
									
									<!--以ID为产品ID的变量传递  取name值-->
									<input name="${cart.value.product.productId}" type="text" id="${cart.value.product.productId}"
										style="border: 1px #0099FF solid;" value="${cart.value.qty }"
										size="2" width="2">								</td>
								
								<td align="left"
									style="overflow: hidden; border-top: 1px #FF0000 dotted; padding-left: 0px; letter-spacing: 0.2em; line-height: 150%; word-wrap: break-word; word-break: break-all; padding-bottom: 20px;" width="130">
									￥
									<fmt:formatNumber pattern="###,###.00"
										value="${cart.value.product.price}" />								</td>
								<td width="150" align="left"
									style="color: #FF0000; overflow: hidden; border-top: 1px #FF0000 dotted; padding-left: 0px; letter-spacing: 0.2em; line-height: 150%; word-wrap: break-word; word-break: break-all; padding-bottom: 20px;">
									￥
									<fmt:formatNumber pattern="###,###.00"
										value="${cart.value.qty *cart.value.product.price}" />							  </td>
								<td width="47" align="center" valign="middle"
									style="color: #FF0000; overflow: hidden; border-top: 1px #FF0000 dotted; padding-left: 0px; letter-spacing: 0.2em; line-height: 150%; word-wrap: break-word; word-break: break-all; padding-bottom: 20px;"><input type="button"  value="修改" style="border:1px #0000FF solid" onclick="updateId(${cart.value.product.productId})"></td>
							    <td width="105" align="center" valign="middle"
									style="color: #FF0000; overflow: hidden; border-top: 1px #FF0000 dotted; padding-left: 0px; letter-spacing: 0.2em; line-height: 150%; word-wrap: break-word; word-break: break-all; padding-bottom: 20px;"><input type="button"  value="删除" style="border:1px #0000FF solid" onClick="deleteId(${cart.value.product.productId})"></td>
							</tr>
							<c:set var="total"
								value="${cart.value.qty *cart.value.product.price+total} "
								scope="page" />
						</c:forEach>
                       </form>
					<tr>
						<td height="15" colspan="9" align="left"
							style="background-image: url(../image/T_bottombg.gif); font-size: 12px">&nbsp;					  </td>
					</tr>
					<tr align="center">
						<td height="49" style="font-weight: 500; color: #0099FF;" width="20"></td>
						<td></td>
						<td style="font-weight: 700; color: red; font-size: 14px"></td>
						<td></td>
						<td class="cartTitle"></td>
						<td style="color: #FF0000; font-weight: 700;">
							总 计:￥
							<font color="#FF0000""><fmt:formatNumber
									pattern="###,###.00" value="${total}" />
							</font>						</td>
						<td style="color: #FF0000; font-weight: 700;"></td>
					    <td style="color: #FF0000; font-weight: 700;"></td>
					</tr>
</c:if>


					<tr align="center">
						<td height="49" valign="middle"
							style="font-weight: 500; color: #0099FF;">
							<img src="../image/tp009.gif" wi>
							<a href="javascript:window.close()">继续购物</a>						</td>
						<td></td>
						<td valign="middle"
							style="font-weight: 700; color: red; font-size: 14px">
							确认付款						</td>
						<td></td>
						<td style="font-weight: 500; color: #666666;">
							<a href="cartDelAction.jsp">取消此次定购</a>						</td>
						<td style="color: #FF0000; font-weight: 700;"></td>
						<td style="color: #FF0000; font-weight: 700;"></td>
					    <td style="color: #FF0000; font-weight: 700;"></td>
					</tr>
				</table>
				<%
					//}
				%>

			</div>

			<TABLE width="750" border="0" cellpadding="0" cellspacing="0">
				<TR>
				  <TD width="27" height="30"
						style="background-image: url(${ctx }/image/T_bottombg.gif);">&nbsp;				  </TD>
					<TD width="579" height="30" align="right"
						style="background-image: url(${ctx }/image/T_bottombg.gif);"></TD>
				  <TD width="144" height="30" align="right"
						style="background-image: url(${ctx }/image/T_bottombg.gif);">&nbsp;				  </TD>
				</TR>
		  </TABLE>
	</DIV>
		<!--购物车层设置结束-->
	</body>
</html>
  <%
  }
   %>