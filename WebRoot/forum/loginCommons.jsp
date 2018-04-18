<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<%@include file="/commons/taglibs.jsp" %>
<%
String msgStr="请输入用户名和密码！";
 %>
<LINK href="style.css" type="text/css" rel="stylesheet">
<!-- 用户信息、登录、注册 -->
                            <%
                                 User loginUser=null;
	                             if(session.getAttribute("user")==null){
                             %>
							<div>	
							  <table width="750" border="0" cellpadding="0" cellspacing="0">
							  <tr>
							  <td colspan="3"><img src="image/welcome.jpg"></td>
							  </tr>
							  </table>
							  <table width="750" border="0" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td width="140" height="21" background="image/T_left.gif" style="width: 140px; height: 20px;  font-size: 12px; color: #CC0000; ">&nbsp;</td>
                                                                                                                                                                            <!-- 此处msg为1，是为了login.jsp接受一个值，无意义 -->            
                                    <td width="556" height="21" align="right" background="image/Tt_bg.gif"; style="color:#FFFFFF; font-size:12px;">您尚未: <a href="login.jsp?msg=0" id="alogin">登录</a> | <a href="${ctx }/userReg/userReg.jsp?msg=0" id="alogin">注册</a> | </td>
                                    <td width="54" background="image/T_right.gif">&nbsp;</td>
                                  </tr>
                                </table>
							</div>
							<%
								}else{
										loginUser=(User)session.getAttribute("user");
							 %>
							   <table width="750" border="0" cellpadding="0" cellspacing="0">
							  <tr>
							  <td colspan="3"><img src="image/welcome.jpg"></td>
							  </tr>
							  </table>
							 <table width="750" border="0" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td width="140" height="21" background="image/T_left.gif" style="width: 140px; height: 20px;  font-size: 12px; color: #CC0000; ">&nbsp;</td>
                                    <td width="556" height="21" align="right" background="image/Tt_bg.gif"; style="color:#FFFFFF; font-size:12px;">您好：<%=loginUser.getUName() %>&nbsp; | &nbsp; <a href="doLogout.jsp">退出</a> | </td>
                                    <td width="54" background="image/T_right.gif">&nbsp;</td>
                                  </tr>
                                </table>
							 
							 
							 <%
							 	}
							  %>