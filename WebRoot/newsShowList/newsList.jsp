<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>

<%@include file="/commons/taglibs.jsp" %>

<%
             	
             	
     
             	
             	
       	
             	//session.setAttribute("newsList",newsList);
             	
             	//分页
             	int pageCount=0;  //最大页面数
             	int p=1;    //当前页面数
             	
             	String pStr = request.getParameter("page"); //页数
                p = Integer.parseInt(pStr); //获得当前页面数
             	
             	
             	NewsDao newsDao=new NewsDaoImpl();
             
             	List newsList = newsDao.findListNews(p);	
             	
             	int num = newsDao.findCountNews(); //取得该产品条数
             	
             	int newsCount=newsList.size();  
             	//out.print("list:"+proCount);
                 
             	pageCount = newsDao.getCountRows(); //取得总页数
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
    <title>品红人生——新闻展示</title>
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
			  		location.href="newsList.jsp?page="+page;
			  		}
//-->
</script>
    
  </head>
  
  <body>
  <div style="width:1000px;" align="center">
  
  
  
   <!-- 用户信息、登录、注册 -->
      <%@ include file="/commons/top.jsp" %>
	  <div style="width:750px; height:20px; " align="left"><a href="${ctx}/index.jsp">首页</a> >> <a href="#">新闻展示</a></div>
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
					&nbsp;&nbsp;共&nbsp;<%=count%>&nbsp;页(每页&nbsp;10&nbsp;条新闻)&nbsp;&nbsp;现在是第&nbsp;
					<font color="#FF0000"><%=ip%></font>&nbsp;页 &nbsp;&nbsp;有&nbsp;<%=num%>
					&nbsp;条新闻&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF0000">提示信息：</font>
	</div>
				<!--+显示页数end+-->
	  <table width="750" border="0" cellpadding="0" cellspacing="0" style="border-bottom:2px #FFB5B5 solid; ">
  <tr>
    <td width="184" height="33" valign="top" style="padding-top:5px;"><%@ include file="../commons/left.jsp" %>	</td>
		
	<td width="10" rowspan="2" valign="top" style="border-right:2px #FFB5B5 solid;">&nbsp;</td>
	
    <td width="556" rowspan="2" align="left" valign="top">
	<div style="width:556px; height:20px; padding-top: 5px; padding-left: 10px;" align="left">
	新闻列表
</div>
	  <%
	     for(int i=0;i<newsList.size();i++){
	     	News news=(News)newsList.get(i);
	   %>
	  <table width="551" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="11" align="center" style="padding-left:20px;">&nbsp;</td>
    <td width="540" align="left">
	

	  <table width="533" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="34" bgcolor="#EEEEEE" style="border-bottom:1px #AECDF7 solid;  padding-top: 3px;">&nbsp;</td>
          <td width="287" bgcolor="#EEEEEE" style="border-bottom:1px #AECDF7 solid; padding-top: 3px;"><a href="${ctx }/newsDetail/doNews.jsp?newsId=<%=news.getNewsId() %>"><%=news.getTitle() %></a></td>
          <td width="210" bgcolor="#EEEEEE" style="border-bottom:1px #AECDF7 solid; padding-top: 3px;">【<%=news.getPublishTime() %>】</td>
          </tr>
      </table>
		</td>
  </tr>
  
</table>
<div style="width:556px; height:3px;" align="right" >
</div>
<%
}
 %>
<!--上一页，下一页开始-->
				<div
					style="width: 553px; height: 30px; padding-left: 0px; padding-top: 10px; padding-bottom: 10px;"
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
