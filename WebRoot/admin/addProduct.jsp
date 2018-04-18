<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="java.io.*"%>


      
<%@include file="/commons/taglibs.jsp" %>

<% 
            //上传图片信息
           String msgImg="";
           msgImg = (String)request.getAttribute("msgImg"); //页数   
            if(msgImg==null||"".equals(msgImg)){
            	msgImg="无信息！";
            }
                   
               //添加信息    
             String msgShow="无信息！";
             String msgStr = request.getParameter("msg"); 
             if(msgStr==null||"".equals(msgStr)){
             	msgShow="无信息！";
             }else{
              	int msg=Integer.parseInt(msgStr);
              	if(msg==0){
              		msgShow="添加产品成功！";
              	}
              	if(msg==1){
              		msgShow="添加产品失败！";
              	}
              	if(msg==2){
              		msgShow="上传产品图片成功！";
              	}
              	if(msg==3){
              		msgShow="该图片名存在，请重新改名上传！";
              	}
              	if(msg==4){
              		msgShow="添加产品失败！";
              	}
             }

	String fileName=request.getParameter("fileName");
	if(fileName==null||"".equals(fileName)){
		fileName="无";
	}else{
	    //fileName
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">



<html>
  <head>

    
    <title>品红人生-后台管理</title>

<LINK href="style.css" type="text/css" rel="stylesheet">
<script language="javascript">

//上传层
			function workshow(div){
			    document.getElementById(div).style.display='block';
				document.getElementById('bgdiv').style.display='block';
			
			}
			function workclose(div){
				document.getElementById(div).style.display='none';
				document.getElementById('bgdiv').style.display='none';
			}
            
            //自选头像路径
			function show(headName){
				document.getElementById('headPath').value='/image/head/'+headName;  //选择地点显示在text
				document.getElementById('headPathShow').value=headName;
				document.getElementById('head').style.display='none';  //选择层隐藏
				document.getElementById('bgdiv').style.display='none';
				
			}
			//上传头像路径
			function loadShow(headName){

				//document.getElementById('headPath').value='/image/loadHead/'+headName;  //选择地点显示影藏域上
				document.getElementById('headPath').value=headName;
				//alert(document.getElementById(document.getElementById('headPath').value);
				//document.getElementById('headPath').value=document.getElementById("ln").value;  //选择地点显示在text上
				document.getElementById('headPathShow').value=headName;
				document.getElementById('head').style.display='none';  //选择层隐藏
				document.getElementById('bgdiv').style.display='none';
				
			}
			
			function trainshow(box,showid,closediv){
				var ss="";
 			    var tt, n=0; 
  				var nn =document.all.item(box); 
  
  				for (j=0; j<nn.length; j++) {
    				if (document.all.item(box,j).checked) {    //复选框被选中
     				 	 n = n + 1;
     					 tt =document.all.item(box,j).value+"";       //选中复选框的值
      					 if(n==1) {
       						 ss= tt;
     					 }
     			 else {
      		  ss=ss + "<br>"+ tt;
     	 }
 	 }
  }
 	document.getElementById(showid).innerHTML=ss;   //所选内容显示在ID为showid单元格
	document.getElementById(closediv).style.display='none';   //隐藏行业选择层
	
}

     //-->
     
     	//div的移动开始
	var tag = false;
	var dx=0;
	var dy=0;
	var ex;
	var ey;
	function init(objDiv)
	{
 		tempDiv = document.getElementById(objDiv);
 		dx = tempDiv.style.pixelLeft;
 		dy = tempDiv.style.pixelTop;
	}
	function mouseDowning()
	{
 		ex=event.x;
 		ey=event.y;
 		tag = true;
 	document.body.onmousemove=function()
 	{
  		if(tag)
  	{
  	 var tempEx = event.x;
	 var tempEy = event.y;
   	 tempDiv.style.pixelLeft=tempDiv.style.pixelLeft-(ex-tempEx);
     tempDiv.style.pixelTop=tempDiv.style.pixelTop-(ey-tempEy);
     ex=tempEx;
     ey=tempEy;
  }
 }
}
function mouseUping()
{
 	tag=false;
}
	//div的移动结束




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
//产品名
function LostFocusCheckProName()
{
     var name=document.myForm.proName.value;
	if(name.length==0)
	{
	    document.getElementById("errorname").innerHTML="<font color='red'>&nbsp;&nbsp;产品名不能为空</font>";
		document.myForm.proName.value="";
		return false;
	} 
	else if(name.length>10)
	{
	    document.getElementById("errorname").innerHTML="<font color='red'>&nbsp;&nbsp;产品名不能大于10个字符</font>";
		document.myForm.proName.value="";
		return false;
	} 
	else
	{
	    document.getElementById("errorname").innerHTML="<font color='red'>&nbsp;&nbsp;√</font>";
		return true;
	}
	return false;
}

//品牌
function LostFocusCheckProBrand()
{
     var brand=document.myForm.proBrand.value;
	if(brand=="")
	{
	    document.getElementById("errorbrand").innerHTML="<font color='red'>&nbsp;&nbsp;品牌名不能为空</font>";
		document.myForm.proBrand.value="";
		return false;
	} 
	else if(brand.length>10)
	{
	    document.getElementById("errorbrand").innerHTML="<font color='red'>&nbsp;&nbsp;品牌名不能大于10个字符</font>";
		document.myForm.proBrand.value="";
		return false;
	} 
	else
	{
	    document.getElementById("errorbrand").innerHTML="<font color='red'>&nbsp;&nbsp;√</font>";
		return true;
	}
	return false;
}

//型号
function LostFocusCheckProModel()
{
     var model=document.myForm.proModel.value;
	if(model.length==0)
	{
	    document.getElementById("errormodel").innerHTML="<font color='red'>&nbsp;&nbsp;品牌名不能为空</font>";
		document.myForm.proModel.value="";
		return false;
	} 
	else if(model.length>10)
	{
	    document.getElementById("errormodel").innerHTML="<font color='red'>&nbsp;&nbsp;品牌名不能大于10个字符</font>";
		document.myForm.proModel.value="";
		return false;
	} 
	else
	{
	    document.getElementById("errormodel").innerHTML="<font color='red'>&nbsp;&nbsp;√</font>";
		return true;
	}
	return false;
}

//价格
function LostFocusCheckProPrice()
{
	var price=document.myForm.proPrice.value;
	var myReg = /^[0-9]+(.[0-9]{2})?$/; 
    if(!myReg.test(price)) 
	{
		 document.getElementById("errorprice").innerHTML="<font color='red' >&nbsp;&nbsp;价格格式不正确</font>";
		 document.myForm.proPrice.value="";
		 return false;
	}
    else
	{
		document.getElementById("errorprice").innerHTML="<font color='red'>&nbsp;&nbsp;√</font>";
		return true;
	}
	return false;
}

//描述

function LostFocusCheckProDescriptions()
{
     //document.myForm.proDescriptions.value='无内容！';
     var descriptions=document.myForm.proDescriptions.value;
	if(descriptions.length==0)
	{
	    document.getElementById("errordescriptions").innerHTML="<font color='red'>&nbsp;&nbsp;描述不能为空</font>";
		document.myForm.descriptions.value="";
		return false;
	} 
	else if(descriptions.length>100)
	{
	    document.getElementById("errordescriptions").innerHTML="<font color='red'>&nbsp;&nbsp;描述不能大于100个字符</font>";
		document.myForm.descriptions.value="";
		return false;
	} 
	else
	{
	    document.getElementById("errordescriptions").innerHTML="<font color='red'>&nbsp;&nbsp;√</font>";
		return true;
	}
	return false;
}


//提交
function checkPro()
{
	if(LostFocusCheckProName()&&LostFocusCheckProBrand()&&LostFocusCheckProModel()&&LostFocusCheckProPrice()&&LostFocusCheckProDescriptions())
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


//图片尺寸判断:输入要限制的宽度，高度
function checkImage(){
    var img=document.createElement('img');//创建一个img元素
	img.src="file:///C|/Documents and Settings/Administrator/桌面/图片修改软件/d_r11_10_r1_c221.jpg";//指定src 必须是图片名，不能加路径
	img.style.visibility='hidden';//藏起来
	var inj=document.getElementById('imgBox').appendChild(img);//插入到box中。当然插入到document.body也可以
	
	
	     alert('宽：'+inj.offsetWidth);//然后就可以通过 offset 取得宽和高了
         alert('高：'+inj.offsetHeight);
	
	
	


	
	
	//if(inj.offsetWidth>=w||inj.offsetHeight>=h){
		//alert("图片的宽和高必须小于：143*112:");
		//return false;
	//}else{
	     //alert("图片的宽和高合格");
	//}

	// return true;
	//alert("123456");
	//alert('宽：'+inj.offsetWidth);//然后就可以通过 offset 取得宽和高了
    //alert('高：'+inj.offsetHeight);
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
<div style=" width:750px; height:18px;" align="left"><font color="red">信息：<%=msgShow%></font></div>
<table width="750" height="380" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
	<table width="750" height="303" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="155" rowspan="2" valign="top" id="left" style="padding-left:10px; padding-top:10px;border:1px #FF0000 solid; border-style:solid; background-color:#f4f8fc;"><%@ include file="../commons/menuAdmin.jsp" %>	<br></td>
	
    <td width="26" rowspan="2" valign="top"> 
		<div style="background-image:url(${ctx}/image/feir.gif); width:20px; height:32px;" onClick="menuDivNone()"></div>		</td>
    <td width="400" height="39" align="left" valign="top" style="padding-left:10px; padding-top:15px;">
	<div style="width:600px; height:20px;"><img src="${ctx}/image/ico_oversea.gif" />添加商品</div>	</td>
  </tr>
  <tr>
    <td valign="middle" style="padding-left:10px; padding-top:15px;" align="center">
	<form name="myForm" id="myForm" action="addProductAction.jsp" method="post" onSubmit="return checkPro()" >
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
          <td colspan="4" align="center">添加商品</td>
        </tr>
        <tr>
          <td colspan="4" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td align="right" style="color:#FF0000">商品编号：</td>
          <td align="left" style="color:#FF0000">&nbsp;</td>
          <td width="188" align="left" style="color:#FF0000"><input type="text" class="text" name="seriaNumber" id="seriaNumber" value="自动编号" readonly="readonly"></td>
          <td align="left" style="color:#FF0000"><input type="button" name="butt" value="上传图片" style="border:1px #0099FF solid" onClick="workshow('head')">
            (请先上传需要的图片！)</td>
        </tr>
        <tr>
          <td colspan="4" align="right"  style="color:#FF0000">&nbsp;</td>
        </tr>
        <tr>
          <td width="116" align="right">商品名称：</td>
          <td width="13">&nbsp;</td>
          <td><span style="color:#FF0000">
            <input name="proName" type="text" class="text" id="proName" maxlength="10" onBlur="LostFocusCheckProName()">
          </span></td>
          <td width="216" id="errorname">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td align="right">商品品牌：</td>
          <td>&nbsp;</td>
          <td><span style="color:#FF0000">
            <input name="proBrand" type="text" class="text" id="proBrand" maxlength="10" onBlur="LostFocusCheckProBrand()">
          </span></td>
          <td id="errorbrand">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="4" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td  align="right">商品型号：</td>
          <td >&nbsp;</td>
          <td ><span style="color:#FF0000">
            <input name="proModel" type="text" class="text" id="proModel" maxlength="10" onBlur="LostFocusCheckProModel()">
          </span></td>
		  <td width="216" id="errormodel">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="4" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td align="right">上传图片：</td>
          <td align="center">&nbsp;</td>
          <td align="left"><input type="text" name="proImage" id="proImage" style="border:1px #0099FF solid;" value="<%=fileName %>" readonly="readonly"></td>
          <td align="left"><span style="color:#FF0000"><%=msgImg%></span></td>
        </tr>
        <tr>
          <td colspan="4" align="center" style="color:#FF0000">&nbsp;</td>
        </tr>
        <tr>
          <td  align="right">商品价格：</td>
          <td >&nbsp;</td>
          <td ><span style="color:#FF0000">
            <input name="proPrice" type="text" class="text" id="proPrice" onBlur="LostFocusCheckProPrice()" maxlength="7">
            ￥          </span></td>
		  <td width="216" id="errorprice"><font color='red'>价格格式如：（8888.88）</font></td>
        </tr>
        <tr>
          <td colspan="4" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td  align="right">商品描述：</td>
          <td >&nbsp;</td>
          <td colspan="2" >
            <table width="400" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="340"><textarea name="proDescriptions" cols="45" rows="8" id="proDescriptions" style="border:1px #0099FF solid;" onBlur="LostFocusCheckProDescriptions()">无内容！</textarea></td>
                <td width="60">&nbsp;</td>
              </tr>
              <tr>
                <td align="right" id="errordescriptions"><font color="#FF0000">（不能大于100字）</font></td>
                <td width="60">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        <tr>
          <td colspan="4" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="4" align="center"><input type="submit" name="Submit" value="添  加" style="border:none; background-color:#FF9933; padding-top:0px;">
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




<DIV id="bgdiv" style=" display: none ;FILTER:alpha(opacity=20);background-color:blue; height: 768px; width: 100%;top: 0px;left: 0px ;position:absolute;"></DIV>



<!--tu层设置开始-->
<DIV class="search-top" id="head" style="display:none; width:615px; left:192px; top:197px; position:absolute;  border-left::1px #0000FF solid; height: 303px;" onMouseDown="init('head');mouseDowning()" onMouseUp="mouseUping()">
<DIV class="search-menu" ><TABLE width="617" border="0" cellspacing="0" cellpadding="0">
  <TR>
    <TD width="11"  style="background-image:url(../image/titlemu_1.gif); background-repeat:no-repeat">&nbsp;</TD>
    <TD width="589" align="left" style="background-image:url(../image/titlemu_2.gif);font-size:12px" ><A href="javascript:workclose('head')" class="A-white">[关 闭]</A></TD>
    <TD width="14" align="right" style="background-image:url(../image/titlemu_3.gif); background-repeat:no-repeat"></TD>
  </TR>
</TABLE>
</DIV>
<div style="width:614px; height:260px;background-color:#FFFFFF; border-left:1px #FF0000 solid;border-right:1px #FF0000 solid;overflow-y:auto;white-space:nowrap;" >
  <table width="100%" border="0" cellspacing="0" cellpadding="0"  
>


<!--上传开始  -->
    <tr>
      <td width="600" height="15px" colspan="7" align="left" ><img src="${ctx }/image/board.gif" /><font size="2">【上传产品图片】</font> </td>
    </tr>
    <tr>
      <td width="600" height="15px" colspan="7" align="right"  style="background-image:url(${ctx }/image/title.gif);">
      <form id="myFormLoad" name="myFormLoad" action="addProductLoadAction.jsp"  method="post" enctype="multipart/form-data">
        <input type="file" name="s" value="浏  览"  style="border:1xp #FF0000 solid;"/>
        <!--  <input type="hidden" name="productPath" id="productPath" value="<%//=loginUser.getUId() %>"  />-->
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" name="sub" value="上  传" style="border:1xp #FF0000 solid;" />
      </form></td>
    </tr>
   
    <tr align="center">
	<!-- <td height="150"><a href="javascript:loadShow('<%//=loadPathName %>')"><img src="${ctx }<%//=loadPathName%>" style="border:none; padding:2px;" /></a></td>-->
      <td height="150" align="left" style="color:#FF0000;">&nbsp;&nbsp;&nbsp;&nbsp;温馨提示：本产品图片上传功能暂时不支持中文名图片,图片大小应小于143*112，且只支持JPG、bmp、gif三种格式，而且本机上保存图片的路径不能有中文，若上传图片为中文名，请修改，否则不能正常显示。</td>
      <td><a href="javascript:loadShow('2.gif')"></a></td>
      <td><a href="javascript:loadShow('3.gif')"></a></td>
      <td><a href="javascript:loadShow('4.gif')"></a></td>
      <td><a href="javascript:loadShow('5.gif')"></a></td>
      <td><a href="javascript:loadShow('6.gif')"></a></td>
    </tr>

    <tr>
      <td width="600" height="20" colspan="7" align="left"  style="border-top:1px #FF0000 solid;"><font size="2"></font></td>
    </tr>

<!--上传结束  -->

  </table>
  

</div>

  <TABLE width="614" border="0" cellspacing="0" cellpadding="0">
  <TR>
    <TD width="100" height="26"  style="background-image:url(../image/T_bottomleft.gif); background-repeat:no-repeat">&nbsp;</TD>
    <TD width="53%" align="right" style="background-image:url(../image/T_bottombg.gif)" ></TD>
    <TD width="100" align="right" style="background-image:url(../image/T_bottomright.gif); background-repeat:no-repeat;" >&nbsp;</TD>
  </TR>
</TABLE>
</DIV>
<!--tu层设置结束-->
