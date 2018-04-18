<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="entity.Product"/>
<jsp:directive.page import="dao.impl.ProductDaoImpl"/>
<%@page import="dao.ProuctDao"%>
<%
	request.setCharacterEncoding("UTF-8");

	String proName= request.getParameter("proName");
	String proBrand=request.getParameter("proBrand");
	String proModel=request.getParameter("proModel");
	String proImage=request.getParameter("proImage");
	String proPriceStr=request.getParameter("proPrice");
	String proDescriptions=request.getParameter("proDescriptions");

    if((proName==null||"".equals(proName))
    ||(proBrand==null||"".equals(proBrand))
    ||(proModel==null||"".equals(proModel))
    ||(proImage==null||"".equals(proImage))
    ||(proPriceStr==null||"".equals(proPriceStr))
    ||(proDescriptions==null||"".equals(proDescriptions))){
    	out.print("输入错误！");
    }else{
            float proPrice=Float.parseFloat(proPriceStr);
            String pathProImage="/image/product/"+proImage;
            
            //产生随机uNumber
			String   str1=String.valueOf(Math.random()*1000).substring(4, 7);   
			String   str2=String.valueOf(Math.random()*1000).substring(8, 12);
			String   str3=String.valueOf(Math.random()*1000).substring(4, 7);
			String uNumber=str1+str2+str3;
            
            Product product=new Product();
            product.setSerialNumber(uNumber);
            product.setNames(proName);
            product.setBrand(proBrand);
            product.setModel(proModel);
            product.setPicture(pathProImage);
            product.setPrice(proPrice);
            product.setDescriptions(proDescriptions);
            
			ProuctDao prouctDao=new ProductDaoImpl();
			int count=prouctDao.addProduct(product);
			if(count>0){
				out.print("添加成功！");
		    	response.sendRedirect("addProduct.jsp?page=1&msg=0");
			}else{
				out.print("添加失败！");
		    	response.sendRedirect("addProduct.jsp?page=1&msg=1");
			}
			
			


	}
	%>