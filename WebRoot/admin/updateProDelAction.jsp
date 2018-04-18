<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<jsp:directive.page import="entity.Product"/>
<jsp:directive.page import="dao.impl.ProductDaoImpl"/>

<%@page import="dao.ProuctDao"%>

<%@ page import="java.io.*" %>

<%
    request.setCharacterEncoding("GBK");
    
	String productIdStr=request.getParameter("productId");
	                   //解决中文乱码问题，                    传递的中文参数            传递前编码        传递后编号
	String productName=new String(request.getParameter("productName").getBytes("ISO-8859-1"),"UTF-8");
	String productImage=new String(request.getParameter("productImage").getBytes("ISO-8859-1"),"UTF-8");
	String imageName=productImage.substring(productImage.lastIndexOf("/")+1);
	
	if(productIdStr==null||"".equals(productIdStr)||(productName==null||"".equals

(productName))){
		out.print("传输错误！");
	}else{
		int productId=Integer.parseInt(productIdStr);
		
		//
		
		ProuctDao prouctDao=new ProductDaoImpl();
		int count=prouctDao.deleteProduct(productId);
		if(count>0){
			out.print("删除产品信息成功！");
			
			
			 //删除产品图片
			 String url=application.getRealPath("/"); //获得服务器上传的路径
			 String   filePath="/image/product/"+imageName;       
             java.io.File   myDelFile=new   java.io.File(url+filePath);   
               
			if(myDelFile.exists()){
			    myDelFile.delete(); 
				out.print("删除产品图片成功！");
			}else{
				out.print("删除产品图片失败！");
			}
			
			request.setAttribute("msg","删除产品 "+productName+" 信息成功！");
		    request.getRequestDispatcher("updatePro.jsp?page=1").forward(request,response);
		}else{
			out.print("删除成功！");
			request.setAttribute("msg","删除产品 "+productName+" 信息失败！");
		    request.getRequestDispatcher("updatePro.jsp?page=1").forward(request,response);
		}
	}
 %>

