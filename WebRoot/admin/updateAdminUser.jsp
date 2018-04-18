<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>



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
             	
             	
             	UserDao userDao=new UserDaoImpl();
             
             	List userList = userDao.findListUser(p);	
             	
             	int num = userDao.findCountUser(); //取得该新闻条数
             	
             	int newsCount=userList.size();  
             	//out.print("list:"+proCount);
                 
             	pageCount = userDao.getCountRows(); //取得总页数
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


<!--表单元素判断开始-->


<!--表单元素判断结束-->

             
                 //分页
                  function findPage(page,pageCount){
		            if(page<1){
		            	page=1;
		            }
		            if(page>pageCount){
		            	page=pageCount;
		            }
			  		location.href="updateAdminUser.jsp?page="+page;
			  		}

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
    <td><table width="750" height="300" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="152" rowspan="2" valign="top" id="left" style="padding-left:3px; padding-top:5px;border:1px #FF0000 solid; border-style:solid; background-color:#f4f8fc;"><%@ include file="../commons/menuAdmin.jsp" %></td>
        <td width="26" rowspan="2" valign="top"><div style="background-image:url(${ctx}/image/feir.gif); width:20px; height:32px;" onClick="menuDivNone()"></div></td>
        <td width="622" height="39" align="left" valign="top" style="padding-left:10px; padding-top:15px;"><img src="${ctx}/image/ico_oversea.gif" />用户信息</td>
      </tr>
      <tr>
        <td valign="top" style="padding-left:10px;" align="left"><table width="585" border="0" cellpadding="0" cellspacing="0" >
            <tr>
              <td height="22" colspan="4" align="left" ><table width="585" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="10" style="background-image:url(${ctx}/image/titlemu_1.gif)">&nbsp;</td>
                    <td width="563"  style="background-image:url(${ctx}/image/titlemu_2.gif)">&nbsp;</td>
                    <td width="12" style="background-image:url(${ctx}/image/titlemu_3.gif); background-repeat:no-repeat">&nbsp;</td>
                  </tr>
              </table></td>
            </tr>
            <tr>
              <td width="137" align="center" style="font-size: 13px; color: blue; font-weight:600;">用户编号</td>
              <td width="212" align="center" style="font-size: 13px; color: blue; font-weight:600;">用户名</td>
              <td width="100" align="center" style="font-size: 13px; color: blue; font-weight:600;">&nbsp;</td>
              <td width="100" align="center" style="font-size: 13px; color: blue; font-weight:600;">删除</td>
            </tr>
            <tr>
              <td colspan="4" align="left" style="font-size: 13px; color: blue; font-weight:600;">&nbsp;</td>
            </tr>
            <%
      for(int i=0;i<userList.size();i++){
      	User user=(User)userList.get(i);
       %>
            <tr>
              <td align="left" bgcolor="#EEEEEE" style="border-bottom:3px #FFFFFF solid;  padding-top: 3px;">&nbsp;&nbsp;<%=user.getUNumber()%></td>
              <td align="center" bgcolor="#EEEEEE" style="border-bottom:3px #FFFFFF solid;  padding-top: 3px;"><%=user.getUName()%></td>
              <td align="center" bgcolor="#EEEEEE" style="border-bottom:3px #FFFFFF solid;  padding-top: 3px;">&nbsp;</td>
              <td align="center" bgcolor="#EEEEEE" style="border-bottom:3px #FFFFFF solid;  padding-top: 3px;"><a href="updateAdminUserDelAction.jsp?uID=<%=user.getUId()%>&uName=<%=user.getUName()%>">删除</a></td>
            </tr>
            <%
      }
       %>
            <tr>
              <td width="137" align="center" style="font-size: 13px; color: blue; font-weight:600;"></td>
              <td colspan="3" align="right" style="font-size: 13px; color: blue; font-weight:600;">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="4" align="right"><span style="font-size: 13px; color: blue; font-weight:600;">
              
               <!--上一页，下一页开始-->
				<div
					style="width: 585px; height: 30px; padding-left: 0px; padding-top: 10px; padding-bottom: 10px;"
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
					style="width: 585px; height: 25px; font: 13px; color: #FFFFFF; border-bottom:1px #FF0000 solid; background-image: url(${ctx }/image/title.gif); font-size: 12px; color: #333333;"
					align="left">
					&nbsp;&nbsp;共&nbsp;<%=count%>&nbsp;页(每页&nbsp;15&nbsp;条用户信息)&nbsp;&nbsp;现在是第&nbsp;
					<font color="#FF0000"><%=ip%></font>&nbsp;页 &nbsp;&nbsp;有&nbsp;<%=num%>
					&nbsp;条用户信息&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
				<!--+显示页数end+-->
              
              </span></td>
            </tr>
            <tr>
              <td colspan="4" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            </tr>
            <tr>
              <td colspan="4" align="center"><table width="585" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="10" height="19" style="background-image:url(${ctx}/image/T_bottomleft.gif)">&nbsp;</td>
                    <td width="427" style="background-image:url(${ctx}/image/T_bottombg.gif)">&nbsp;</td>
                    <td width="148" style="background-image:url(${ctx}/image/T_bottomright.gif); background-repeat:no-repeat;">&nbsp;</td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
    </table></td>
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
