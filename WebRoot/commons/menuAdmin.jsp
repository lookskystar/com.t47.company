<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script> 
//function window.onunload() 
//{ 
//if(window.confirm("你讲退出管理系统！")) 
//{return true} 
//} 
</script> 



<!--后台管理树形菜单开始-->
   <table width="108" height="35" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="48" style="font-size:11px; font-weight:700;"><a onclick="javascript:window.close()">[退出]</a></td>
    <td width="60" style="font-size:11px; font-weight:700;">&nbsp;<a href="../index.jsp">[首页]</a></td>
  </tr>
</table>

	<DIV><A href="javascript: onClick=show('1') "><IMG src="${ctx }/image/z-1.jpg" border="0" align="absmiddle">系统管理</A></DIV>
	<DIV id="1" style="display:none;padding-left:15px;">
	        <IMG src="${ctx }/image/z-top.gif" align="absmiddle"><font size="2" color="#999999" ><a href="../admin/addAdmin.jsp">增加人员</a></font><BR>
            <IMG src="${ctx }/image/z-top.gif" align="absmiddle"><font size="2" color="#999999" ><a href="../admin/updateAdmin.jsp">更新人员</a></font><BR>
            <IMG src="${ctx }/image/z-top.gif" align="absmiddle"><font size="2" color="#999999" ><a href="../admin/updateAdminUser.jsp?page=1">用户信息</a></font></DIV>
         
		  <DIV><A href="javascript: onClick=show('2') "><IMG src="${ctx }/image/z-2.jpg" border="0" align="absmiddle">新闻管理</A></DIV>
          
          <DIV id="2" style="display:none;padding-left:15px;" >
		    <IMG src="${ctx }/image/z-top.gif" align="absmiddle"><font size="2" color="#999999" ><a href="../admin/addNews.jsp">增加新闻</a></font><BR>
            <IMG src="${ctx }/image/z-top.gif" align="absmiddle"><font size="2" color="#999999" ><a href="../admin/updateNews.jsp?page=1">更新新闻</a></font><BR>
</DIV>
            <!--<IMG src="${ctx }/image/z-top.gif" align="absmiddle"><font size="2" color="#999999" >动态新闻</font></DIV>-->
          <DIV><A href="javascript: onClick=show('3') "><IMG src="${ctx }/image/z-3.jpg" border="0" align="absmiddle">商品管理</A></DIV>
          <DIV id="3" style="display:none;padding-left:15px;" >
		    <IMG src="${ctx }/image/z-top.gif" align="absmiddle"><font size="2" color="#999999" ><a href="../admin/addProduct.jsp">增加商品</a></font><BR>
            <IMG src="${ctx }/image/z-top.gif" align="absmiddle"><font size="2" color="#999999" ><a href="../admin/updatePro.jsp?page=1">更新商品</a></font><BR></DIV>
		  
		  
		   <!--
		  <DIV><A href="javascript: onClick=show('4') "><IMG src="${ctx }/image/z-4.jpg" border="0" align="absmiddle">论坛管理</A></DIV>
          
          <DIV id="4" style="display:none;padding-left:15px;" >
		    <IMG src="${ctx }/image/z-top.gif" align="absmiddle"><font size="2" color="#999999" >查找信息</font><BR>
            <IMG src="${ctx }/image/z-top.gif" align="absmiddle"><font size="2" color="#999999" >更新信息</font><BR>
            <IMG src="${ctx }/image/z-top.gif" align="absmiddle"><font size="2" color="#999999" >封杀用户</font><BR> 
</DIV>   
-->     
	<!--后台管理树形菜单结束-->	
