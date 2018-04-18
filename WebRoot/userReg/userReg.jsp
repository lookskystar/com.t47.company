<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@include file="/commons/taglibs.jsp" %>


<% 
//String msg=(String)request.getParameter("msg");
//if(msg==null||"".equals(msg)){
	//out.print("输入错误，请返回！");
//}else{

String headFilePath=(String)request.getParameter("headFilePath");
//out.print("headFilePath:"+headFilePath);
String loadPathName="";
String headName="";
if(headFilePath==null||"".equals(headFilePath)){
   loadPathName="";
}else{
	loadPathName=headFilePath;
	headName=loadPathName.substring(loadPathName.lastIndexOf("/"));
	//out.print("headName:"+headName);
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>问红人生论坛-注册</title>
    

   <script type="text/javascript">
     <!--
      		//用户名
      		function checkName(){
      		    var name=document.myForm.uName.value;
      			if(name.length==0){
      				document.getElementById("userTd").innerHTML="<font color='red' size=2px>&nbsp;&nbsp;用户名不能为空！</font>";
      				document.myForm.uName.value="";
      				return false;
      			}
      			else{
      				document.getElementById("userTd").innerHTML="<font color='red' size=2px>&nbsp;&nbsp;√</font>";
      				return true;
      			}
      		}
      		//密码
      		function checkPwd(){
      			var passwd=document.myForm.uPass.value;
      			if(passwd.length==0){
      				document.getElementById("pwdTd").innerHTML="<font color='red' size=2px>&nbsp;&nbsp;密码不能为空！</font>";
      				document.myForm.uPass.value="";
      				return false;
      			}
      			if(passwd.length<6){
      				document.getElementById("pwdTd").innerHTML="<font color='red' size=2px>&nbsp;&nbsp;密码不能少于6位！</font>";
      				document.myForm.uPass.value="";
      				return false;
      			}
      			else{
      				document.getElementById("pwdTd").innerHTML="<font color='red' size=2px>&nbsp;&nbsp;√</font>";
      				return true;
      			}
      		}
      		//重复密码
      		function checkFPwd(){
      			var fpasswd=document.myForm.fpwd.value;
      			var passwdf=document.myForm.uPass.value;
      			if(fpasswd.length==0){
      				document.getElementById("fpwdTd").innerHTML="<font color='red' size=2px>&nbsp;&nbsp;重复密码不能为空</font>";
      				document.myForm.fpwd.value="";
      				return false;
      			}
      			if(passwdf!=fpasswd){
      				document.getElementById("fpwdTd").innerHTML="<font color='red' size=2px>&nbsp;&nbsp;密码不等！</font>";
      				document.myForm.fpwd.value="";
      				return false;
      			}
      			else{
      				document.getElementById("fpwdTd").innerHTML="<font color='red' size=2px>&nbsp;&nbsp;√</font>";
      				return true;
      			}
      		}
      		//身份证
      		 function checkUidentification(){
	  				  var paperTest=/^([0-9]{15}|[0-9]{18})$/;
					 var id=document.myForm.uIdentification.value;
					 	if(id=="无"){
					 		document.getElementById("sIdTd").innerHTML="<font color='red' size=2px>&nbsp;&nbsp;无验证</font>";
							return true;
					}
					 if(!paperTest.test(id)){
							document.getElementById("sIdTd").innerHTML="<font color='red' size=2px>&nbsp;&nbsp;格式不正确!</font>";
							document.myForm.uIdentification.value="";
							return false;
					}
					else
					{
		    			document.getElementById("sIdTd").innerHTML="<font color='red' size=2px>&nbsp;&nbsp;√</font>";
		   	 			return true; 
					}

      		}
      		
      		//头像
      		 //function checkHead(){
	  				  
					// var head=document.myForm.headPath.value;
					 	//if(head==""){
					 		//document.getElementById("headTd").innerHTML="<font color='red'>&nbsp;&nbsp;请选择头像</font>";
							//return false;
					   //}
					   //if(head!=""){
					   		//document.getElementById("headTd").innerHTML="<font color='red'>&nbsp;&nbsp;√</font>";
					   		//document.myForm.headPathShow.value=substring(head.lastIndexOf("/"));
							//return true;
					   //}
      		//}
      		
      		//Email
      		function checkEmail(){
      		    var email=document.myForm.Email.value;
      			var myReg = /^[_a-z0-9]+@([_a-z0-9]+\.)+[a-z0-9]{2,3}$/; 
   			   if(!myReg.test(email)) 
				{
					 document.getElementById("EmailTd").innerHTML="<font color='red'  size=2px>&nbsp;&nbsp;不正确！</font>";
					 document.myForm.Email.value="";
					 return false;
				}
    			else
				{
					 document.getElementById("EmailTd").innerHTML="<font color='red' size=2px>&nbsp;&nbsp;√</font>";
					 return true;
				}
					 return false;
      		}
      		
      		//地址
      		function checkaddress()
			{
				var address=document.myForm.uAaddress.value;
				if(address.length==0){
				document.getElementById("addressTd").innerHTML="<font color='red' size=2px>&nbsp;&nbsp 不为空！</font>";
				document.myForm.uAaddress.value="";
				return false;
				}
				else
				{
	    			document.getElementById("addressTd").innerHTML="<font color='red' size=2px>&nbsp;&nbsp√</font>";
					return true;
				}
			return false;
			}
      		//电话
      		function checkLink()
			{
				var link=document.myForm.uLink.value;
				if(link.length==0){
				document.getElementById("uLinkTd").innerHTML="<font color='red' size=2px>&nbsp;&nbsp 不为空！</font>";
				document.myForm.uLink.value="";
				return false;
				}
				else
				{
	    			document.getElementById("uLinkTd").innerHTML="<font color='red' size=2px>&nbsp;&nbsp√</font>";
					return true;
				}
			return false;
			}
      	    //备注
      		function checkRemark()
			{
				var remark=document.myForm.uRemark.value;
				if(remark.length==0){
				document.getElementById("uRemarkTd").innerHTML="<font color='red' size=2px>&nbsp;&nbsp 不为空！</font>";
				document.myForm.uRemark.value="";
				return false;
				}
					if(remark.length>20){
				document.getElementById("uRemarkTd").innerHTML="<font color='red' size=2px>&nbsp;&nbsp 不能大于20字！</font>";
				document.myForm.uRemark.value="";
				return false;
				}
				else
				{
	    			document.getElementById("uRemarkTd").innerHTML="<font color='red' size=2px>&nbsp;&nbsp√</font>";
					return true;
				}
			return false;
			}
      		//总检查
      		function check(){
      			if(checkName()&&checkPwd()&&checkFPwd()&&checkUidentification()&&checkEmail()&&checkaddress()&&checkaddress()&&checkaddressRemark()){
      				window.alert("输入正确！");
      				return true;
      			}
      			else{
      				window.alert("输入失败！");
      				return false;
      			}
      		}
      		
      		
      		
      		
      		//头像层
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
				document.getElementById('headPath').value='/image/head/'+headName;  //选择地点显示在按钮上
				document.getElementById('headPathShow').value=headName;
				document.getElementById('head').style.display='none';  //选择层隐藏
				document.getElementById('bgdiv').style.display='none';
				
			}
			//上传头像路径
			function loadHeadShow(headName){
				document.getElementById('headPath').value='/image/loadHead/'+headName;  //选择地点显示在text上
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
     </script>
	 
	
	 
   <style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.text
{
border: 1px #0099FF solid;
}
-->
   </style>
</head>

<body>
 <%@ include file="/commons/top.jsp" %>
<div style="width: 953px; height: 600px;"
			align="center">
			<div style="width: 749px; height: 600px; border-left:1px #FF0000 solid; border-right:1px #FF0000 solid;"
				align="center" >

<table width="720" height="81" border="0" cellpadding="0" cellspacing="0" style="border-bottom:1xp #FF0000 solid;">
  <tbody>
    <tr>
      <td>
	  <!-- 用户信息、登录、注册 -->
      <%//@ include file="loginCommons.jsp" %>
	  </td>
    </tr>
    <tr>
      <td><div style="width: 720px; height: 25px; background-image:url(image/titlemu_2.gif); font-size:14px; color:#FF0000;padding-left: 3px; padding-top: 3px; border-bottom:1xp #FF0000 solid;">
	     会员注册
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%//=msg%></div></td>
    </tr>
  </tbody>
</table>
<form name="myForm" id="myForm" action="userRegAction.jsp" method="post" onSubmit="return check()">
<table width="720" height="477" border="0" cellpadding="0" cellspacing="0" style="border-left:1px #FF0000 solid; border-right:1px #FF0000 solid;">
  <tr>
    <td width="720" height="325" align="center"><table width="473" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="21" height="30" style="font-size:12px; color:#666666"><span class="STYLE1">*</span></td>
        <td width="100" align="right" valign="middle" style="font-size:12px; color:#666666">用&nbsp;户&nbsp;名</td>
        <td width="33" valign="middle" style="font-size:12px; color:#666666">&nbsp;</td>
        <td width="180" valign="middle"><input type="text" name="uName" id="uName" class="text"  onBlur="checkName()"/></td>
        <td  width="139" id="userTd" name="userTd"></td>
      </tr>
      <tr>
        <td height="30" style="font-size:12px; color:#666666"><span class="STYLE1">*</span></td>
        <td height="30" align="right" valign="middle" style="font-size:12px; color:#666666">密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
        <td height="30" valign="middle" style="font-size:12px; color:#666666">&nbsp;</td>
        <td valign="middle"><input type="password" name="uPass" id="uPass" class="text"  onBlur="checkPwd()"/></td>
        <td id="pwdTd" name="pwdTd"><br></td>
      </tr>
      <tr>
        <td height="30" style="font-size:12px; color:#666666"><span class="STYLE1">*</span></td>
        <td height="30" align="right" style="font-size:12px; color:#666666">重复密码</td>
        <td height="30" style="font-size:12px; color:#666666">&nbsp;</td>
        <td><input type="password" name="fpwd" id="fpwd" class="text" onBlur="checkFPwd()"/></td>
        <td id="fpwdTd" name="fpwdTd"></td>
      </tr>
      <tr>
        <td height="30" style="font-size:12px; color:#666666"><span class="STYLE1">*</span>
            <label></label></td>
        <td height="30" align="right" style="font-size:12px; color:#666666">性&nbsp;&nbsp;&nbsp;&nbsp;别</td>
        <td height="30" style="font-size:12px; color:#666666">&nbsp;</td>
        <td><span style="font-size:12px; color:#666666"> &nbsp;&nbsp;&nbsp;
              <input type="radio" name="gender" value="1" />
          男
          <label> &nbsp;&nbsp;&nbsp;
            <input name="gender" type="radio" value="0" checked="checked" />
            </label>
          女</span></td>
        <td id="genderTd" name="genderTd"></td>
      </tr>
      <tr>
        <td height="30" style="font-size:12px; color:#666666">&nbsp;</td>
        <td height="30" align="right" style="font-size:12px; color:#666666">身份证号</td>
        <td height="30" style="font-size:12px; color:#666666">&nbsp;</td>
        <td><input type="text" name="uIdentification" id="uIdentification" class="text" value="无" onBlur="checkUidentification()"/></td>
        <td id="sIdTd" name="sIdTd"></td>
      </tr>
      <tr>
        <td height="40" style="font-size:12px; color:#666666"><span class="STYLE1">*</span></td>
        <td height="40" align="right" style="font-size:12px; color:#666666">头&nbsp;&nbsp;&nbsp;&nbsp;像</td>
        <td height="40" style="font-size:12px; color:#666666">&nbsp;</td>
        <td><input name="headPath" type="hidden"  id="headPath" value="/image/head/wu.gif" readonly="readonly"/>
            <input name="headPathShow" type="text"  id="headPathShow" class="text" value="默认头像" readonly="readonly"/>        </td>
        <td id="fpwdTd" name="fpwdTd"><label>
          <input type="button" name="headShow" class="text" value="浏览头像" onClick="workshow('head')">
        </label></td>
      </tr>
      <tr>
        <td height="30" style="font-size:12px; color:#666666">&nbsp;</td>
        <td height="30" align="right" style="font-size:12px; color:#666666">地&nbsp;&nbsp;&nbsp;&nbsp;址</td>
        <td height="30" style="font-size:12px; color:#666666">&nbsp;</td>
        <td><input name="uAaddress" type="text"  id="uAaddress" class="text" value="无" onBlur="checkaddress()" /></td>
        <td id="addressTd" name="addressTd"></td>
      </tr>
      <tr>
        <td height="30" style="font-size:12px; color:#666666"><span class="STYLE1"></span></td>
        <td height="30" align="right" style="font-size:12px; color:#666666">电&nbsp;&nbsp;&nbsp;&nbsp;话</td>
        <td height="30" style="font-size:12px; color:#666666">&nbsp;</td>
        <td><input type="text" name="uLink" id="uLink" class="text" value="无"  onBlur="checkLink()"/></td>
        <td id="uLinkTd" name="uLinkTd"></td>
      </tr>
      <tr>
        <td height="30" style="font-size:12px; color:#666666"><span class="STYLE1">*</span></td>
        <td height="30" align="right" style="font-size:12px; color:#666666">E-mail</td>
        <td height="30" style="font-size:12px; color:#666666">&nbsp;</td>
        <td><input type="text" name="Email" id="Email" class="text"  onBlur="checkEmail()"/></td>
        <td id="EmailTd" name="EmailTd">&nbsp;</td>
      </tr>
      <tr>
        <td height="78" valign="top" style="font-size:12px; color:#666666">&nbsp;</td>
        <td height="78" align="right" valign="top" style="font-size:12px; color:#666666">备&nbsp;&nbsp;&nbsp;&nbsp;注</td>
        <td height="78" valign="top" style="font-size:12px; color:#666666">&nbsp;</td>
        <td colspan="2"><label>
          <textarea name="uRemark" class="text" cols="40" rows="5" onBlur="checkRemark()">无信息！</textarea>
        </label></td>
      </tr>
      <tr>
        <td height="19" colspan="5" align="right" id="uRemarkTd" name="uRemarkTd" style="font-size:12px; color:#666666">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="71" align="center" style=" font-size:12px; color:#ffffff; font-weight:500; padding-top:2px;">
      <label>
      <input type="submit" name="Submit" class="text" value="提  交" style="border:none; background-color:#FF9933; padding-top:0px;">&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="reset" name="Submit2" class="text" value="重  置" style="border:none; background-color:#FF9933; padding-top:0px;">
      </label></td>
  </tr>
  <tr>
    <td height="29" align="center" style="padding-top:10px; background-image:url(../image/d_r11_8.jpg)">&nbsp;</td>
  </tr>
</table>
</form>
</div>
 <!-- 底部-->
</div>
<%//} %>
<%@ include file="/commons/bottom.jsp" %>








</body>
</html>

<DIV id="bgdiv" style=" display: none ;FILTER:alpha(opacity=20);background-color:blue; height: 768px; width: 100%;top: 0px;left: 0px ;position:absolute;"></DIV>




<!--头像层设置开始-->
<DIV class="search-top" id="head" style="display:none; width:615px; left:192px; top:197px; position:absolute;  border-left::1px #0000FF solid; height: 312px;" onMouseDown="init('head');mouseDowning()" onMouseUp="mouseUping()">
<DIV class="search-menu" ><TABLE width="617" border="0" cellspacing="0" cellpadding="0">
  <TR>
    <TD width="11"  style="background-image:url(${ctx }/image/titlemu_1.gif); background-repeat:no-repeat">&nbsp;</TD>
    <TD width="589" align="left" style="background-image:url(${ctx }/image/titlemu_2.gif);font-size:12px" ><A href="javascript:workclose('head')" class="A-white">[关 闭]</A></TD>
    <TD width="14" align="right" style="background-image:url(${ctx }/image/titlemu_3.gif); background-repeat:no-repeat"></TD>
  </TR>
</TABLE>
</DIV>
<div style="width:614px; height:320px;background-color:#FFFFFF; border-left:1px #FF0000 solid;border-right:1px #FF0000 solid;overflow-y:auto;white-space:nowrap;" >
  <table width="100%" border="0" cellspacing="0" cellpadding="0"  
>
<!--
    <tr>
      <td width="600" height="15px" colspan="7" align="left" bgcolor="#AEBFFB" style="border-bottom:2px #0066FF dotted;"><img src="${ctx }/image/board.gif" />【上传头像】（只能上传6个头像） </td>
    </tr>
    <tr>
      <td width="600" height="15px" colspan="7" align="left" bgcolor="#AEBFFB" style="border-bottom:2px #0066FF dotted;"><form id="myFormLoad" name="myFormLoad" action="userRegLoadAction.jsp"  method="post" enctype="multipart/form-data">
        <input type="file" name="S" value="浏  览"  style="border:1xp #FF0000 solid;"/>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" name="sub" value="上  传" style="border:1xp #FF0000 solid;" />
      </form></td>
    </tr>
    <tr align="center">
      <td height="40"><a href="javascript:show('<%=headName %>')"><img src="${ctx }<%=loadPathName%>" style="border:none; padding:2px;" /></a></td>
      <td><a href="javascript:show('2.gif')"></a></td>
      <td><a href="javascript:show('3.gif')"></a></td>
      <td><a href="javascript:show('4.gif')"></a></td>
      <td><a href="javascript:show('5.gif')"></a></td>
      <td><a href="javascript:show('6.gif')"></a></td>
    </tr>
	
    <tr>
      <td width="600" height="30" colspan="7" align="left" bgcolor="#0099FF"><img src="${ctx }/image/board.gif" /> 自选头像</td>
    </tr>
	-->
    <tr>
      <td height="15" colspan="7" align="right" style="background-image:url(${ctx }/image/title.gif); font-size:12px">【请选择头像】</td>
    </tr>
    <tr align="center">
      <td height="40"><a href="javascript:show('1.gif')"><img src="${ctx }/image/head/1.gif" style="border:none; padding:2px;" /></a></td>
      <td><a href="javascript:show('2.gif')"><img src="${ctx }/image/head/2.gif" style="border:none; padding:2px;" /></a></td>
      <td><a href="javascript:show('3.gif')"><img src="${ctx }/image/head/3.gif" style="border:none; padding:2px;" /></a></td>
      <td><a href="javascript:show('4.gif')"><img src="${ctx }/image/head/4.gif" style="border:none; padding:2px;" /></a></td>
      <td><a href="javascript:show('5.gif')"><img src="${ctx }/image/head/5.gif" style="border:none; padding:2px;" /></a></td>
      <td><a href="javascript:show('6.gif')"><img src="${ctx }/image/head/6.gif" style="border:none; padding:2px;" /></a></td>
    </tr>
    <tr align="center">
      <td height="37"><a href="javascript:show('7.gif')"><img src="${ctx }/image/head/7.gif" style="border:none; padding:2px;" /></a></td>
      <td><a href="javascript:show('8.gif')"><img src="${ctx }/image/head/8.gif" style="border:none; padding:2px;" /></a></td>
      <td><a href="javascript:show('9.gif')"><img src="${ctx }/image/head/9.gif" style="border:none; padding:2px;" /></a></td>
      <td><a href="javascript:show('10.gif')"><img src="${ctx }/image/head/10.gif" style="border:none; padding:2px;" /></a></td>
      <td><a href="javascript:show('11.gif')"><img src="${ctx }/image/head/11.gif" style="border:none; padding:2px;" /></a></td>
      <td><a href="javascript:show('12.gif')"><img src="${ctx }/image/head/12.gif" style="border:none; padding:2px;" /></a></td>
    </tr>
    <tr>
      <td width="600" height="15px" colspan="7" align="left" style="background-image:url(../image/T_bottombg.gif);font-size:12px">&nbsp;</td>
    </tr>
    <tr align="center">
      <td height="48"><a href="javascript:show('13.bmp')"><img src="${ctx }/image/head/13.bmp" style="border:none; padding-top::5px;" /></a></td>
      <td><a href="javascript:show('14.bmp')"><img src="${ctx }/image/head/14.bmp" style="border:none; padding-top::5px;" /></a></td>
      <td><a href="javascript:show('15.bmp')"><img src="${ctx }/image/head/15.bmp" style="border:none; padding-top::5px;" /></a></td>
      <td><a href="javascript:show('16.bmp')"><img src="${ctx }/image/head/16.bmp" style="border:none; padding-top::5px;" /></a></td>
      <td><a href="javascript:show('17.bmp')"><img src="${ctx }/image/head/17.bmp" style="border:none; padding-top::5px;" /></a></td>
      <td><a href="javascript:show('18.bmp')"><img src="${ctx }/image/head/18.bmp" style="border:none; padding-top::5px;" /></a></td>
    </tr>
    <tr align="center">
      <td height="47"><a href="javascript:show('19.bmp')"><img src="${ctx }/image/head/19.bmp" style="border:none; padding-top::5px;" /></a></td>
      <td><a href="javascript:show('20.bmp')"><img src="${ctx }/image/head/20.bmp" style="border:none; padding-top::5px;" /></a></td>
      <td><a href="javascript:show('21.bmp')"><img src="${ctx }/image/head/21.bmp" style="border:none; padding-top::5px;" /></a></td>
      <td><a href="javascript:show('22.bmp')"><img src="${ctx }/image/head/22.bmp" style="border:none; padding-top::5px;" /></a></td>
      <td><a href="javascript:show('23.bmp')"><img src="${ctx }/image/head/23.bmp" style="border:none; padding-top::5px;" /></a></td>
      <td><a href="javascript:show('24.bmp')"><img src="${ctx }/image/head/24.bmp" style="border:none; padding-top::5px;" /></a></td>
    </tr>
    <tr align="center">
      <td height="49"><a href="javascript:show('25.gif')"><img src="${ctx }/image/head/25.bmp" style="border:none; padding-top::5px;" /></a></td>
      <td><a href="javascript:show('26.bmp')"><img src="${ctx }/image/head/26.bmp" style="border:none; padding-top::5px;" /></a></td>
      <td><a href="javascript:show('27.bmp')"><img src="${ctx }/image/head/27.bmp" style="border:none; padding-top::5px;" /></a></td>
      <td><a href="javascript:show('28.bmp')"><img src="${ctx }/image/head/28.bmp" style="border:none; padding-top::5px;" /></a></td>
      <td><a href="javascript:show('29.bmp')"><img src="${ctx }/image/head/29.bmp" style="border:none; padding-top::5px;" /></a></td>
      <td><a href="javascript:show('30.bmp')"><img src="${ctx }/image/head/30.bmp" style="border:none; padding-top::5px;" /></a></td>
    </tr>
  </table>
  

</div>

  <TABLE width="614" border="0" cellspacing="0" cellpadding="0">
  <TR>
    <TD width="100"  style="background-image:url(${ctx }/image/T_bottomleft.gif); background-repeat:no-repeat">&nbsp;</TD>
    <TD width="53%" align="right" style="background-image:url(${ctx }/image/T_bottombg.gif)" ></TD>
    <TD width="100" align="right" style="background-image:url(${ctx }/image/T_bottomright.gif); background-repeat:no-repeat;" >&nbsp;</TD>
  </TR>
</TABLE>
</DIV>
<!--头像层设置结束-->






