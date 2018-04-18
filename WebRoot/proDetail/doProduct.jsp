<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="entity.*" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.*" %>

<%

String productIdStr=request.getParameter("productId");
if(productIdStr==null||"".equals(productIdStr)){
	out.print("输入错误！");
}else{
	    int productId=Integer.parseInt(productIdStr);
        ProuctDao prouctDao=new ProductDaoImpl();
        
        
         Product product=new Product();
         product=prouctDao.findProduct(productId);	
        
        if(product==null){
         	out.print("没有该产品！");
        }else{
        	   request.setAttribute("product",product);
        	   request.getRequestDispatcher("detailProduct.jsp").forward(request,response);
        	}
}

 %>
