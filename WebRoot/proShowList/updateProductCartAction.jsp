<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="entity.CartItemProduct"%>


<%

        String productId = request.getParameter("productId");
		String opt = request.getParameter("opt");
		String qty = request.getParameter(productId);
		
		
		out.println("opt:" + opt);
		out.println("productId:" + productId);
		out.println("qty:" + qty);
		
		
		HttpSession sessions=request.getSession();
			Map map=(Map)sessions.getAttribute("cartSession");
			   if("delete".equals(opt)){
				   map.remove(productId);
			   }else if("update".equals(opt)){
				   CartItemProduct cartItemProduct=(CartItemProduct)map.get(productId);
				   int q=1;
				   
				   try {
					q=Integer.parseInt(qty);
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				if(q<1){
					q=1;
				}
				cartItemProduct.setQty(q);
				   
			   }
			   response.sendRedirect("productCart.jsp");
			
		
%>