<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<%@ page import="dao.impl.*" %>
<%@ page import="dao.*" %>
<%@ page import="entity.*" %>


<%
    
    
            //通过request得到值的方法创建HTTPSession
			HttpSession sessions=request.getSession();
		    //将session中的数据转换为Map
			Map map=(Map)sessions.getAttribute("cartSession");
			//清除map中的所有产品信息
			if(map!=null){
			map.clear();
			//重定向到购物车显示页面
				response.sendRedirect("productCart.jsp");
			}else{
				response.sendRedirect("productCart.jsp");
			}
			
%>

