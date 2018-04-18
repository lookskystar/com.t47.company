<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<jsp:directive.page import="entity.Product"/>
<jsp:directive.page import="dao.impl.ProductDaoImpl"/>
<%@page import="dao.ProuctDao"%>

<%
	request.setCharacterEncoding("UTF-8");
	String productIdStr=request.getParameter("productId");
	String seriaNumber=request.getParameter("seriaNumber");
	String proName= request.getParameter("proName");
	String proBrand=request.getParameter("proBrand");
	String proModel=request.getParameter("proModel");
	String proImage=request.getParameter("proImage");
	String proPriceStr=request.getParameter("proPrice");
	String proDescriptions=request.getParameter("proDescriptions");

    if((seriaNumber==null||"".equals(seriaNumber))
    ||(proName==null||"".equals(proName))
    ||(proBrand==null||"".equals(proBrand))
    ||(proModel==null||"".equals(proModel))
    ||(proImage==null||"".equals(proImage))
    ||(proPriceStr==null||"".equals(proPriceStr))
    ||(proDescriptions==null||"".equals(proDescriptions))){
    	out.print("传输错误！");
    }else{
            int productId=Integer.parseInt(productIdStr);
            float proPrice=Float.parseFloat(proPriceStr);
            String pathProImage="/image/product/"+proImage;
            
            
            Product product=new Product();
            product.setProductId(productId);
            product.setSerialNumber(seriaNumber);
            product.setNames(proName);
            product.setBrand(proBrand);
            product.setModel(proModel);
            product.setPicture(pathProImage);
            product.setPrice(proPrice);
            product.setDescriptions(proDescriptions);
            
			ProuctDao prouctDao=new ProductDaoImpl();
			int count=prouctDao.updateProduct(product);
			if(count>0){
				out.print("修改成功！");
				request.setAttribute("msg","修改产品 "+proName+" 成功！");
		    	request.getRequestDispatcher("updatePro.jsp?page=1").forward(request,response);
			}else{
				out.print("修改成功！");
			request.setAttribute("msg","修改产品 "+proName+" 失败！");
		    request.getRequestDispatcher("updatePro.jsp?page=1").forward(request,response);
			}
			
			


	}
	%>