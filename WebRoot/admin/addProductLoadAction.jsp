<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="com.jspsmart.upload.*"%>  <!-- 导入上传包 -->
<jsp:directive.page import="entity.*"/>    <!-- 上传时所使用的实体类，此处为User类 -->
<jsp:directive.page import="dao.impl.*"/>
<%@page import="dao.ProuctDao"%>
<%@page import="java.io.File"%> 


<%
     request.setCharacterEncoding("UTF-8");   //转换为UTF-8字符
    
     SmartUpload smartUpload = new SmartUpload();   //创建一个上传对象
     
     smartUpload.initialize(pageContext);        //上传对象为本页作用域中的元素
     
     smartUpload.upload();
     Request req=smartUpload.getRequest();         //接收传来的上传的文件  
     
     if(req==null||"".equals(req)){
     	out.print("输入错误！");
     } else{
     	        Files files=smartUpload.getFiles();
     	 
     	         //得到上传的文件
    			 com.jspsmart.upload.File file=smartUpload.getFiles().getFile(0);
   
     			if(!file.isMissing()){
     			//取得上传的文件名
     			String fileName=file.getFileName();
   				 out.print(fileName+":");
    			//取得文件的后缀名
   	 			String ext= smartUpload.getFiles().getFile(0).getFileExt(); 
   	 			//out.print("ext:"+ext);
   	 			if(ext.equals("jpg")||ext.equals("bmp")||ext.equals("gif")){
   	 				 //上传文件的路径
       		         String filePath="/image/product/"+fileName;
       		         //out.print(filePath);
       		         //判断此上传文件存不存在
       		         String url=application.getRealPath("/"); //获得服务器上传的路径
       		         File  myFilePath=new   File(url+filePath);
       		         if(!myFilePath.exists()){
       		           
       		              //out.print("  myFilePath.exists():"+myFilePath.exists());
       		         	    //保存上传文件
        		     		file.saveAs(filePath);
        		     		//out.print("fileName:"+fileName);
   	 						//response.sendRedirect("addProduct.jsp?fileName="+fileName+"");
   	 						out.print("上传产品图片");
   	 						request.setAttribute("msgImg","上传图片 "+fileName+" 成功！");
		    	            request.getRequestDispatcher("addProduct.jsp?fileName="+fileName+"").forward(request,response);
   	 						 
   	 						 //out.print("name:ok");
       		         }else{            
     		                out.print("该图片名存在，请重新改名上传");
     		                request.setAttribute("msgImg","图片名  "+fileName+"  存在，请改名上传！");
		    	            request.getRequestDispatcher("addProduct.jsp?fileName="+fileName+"").forward(request,response);
     			     		
   	 				 }
   	 			}else{
   	 				        out.print("图片只能为jpg、bmp、gift三种格式");
   	 				        request.setAttribute("msgImg","图片只能为jpg、bmp、gift三种格式！");
		    	            request.getRequestDispatcher("addProduct.jsp?fileName="+fileName+"").forward(request,response);
   	 			}
   	 			}
     }
     
 %>