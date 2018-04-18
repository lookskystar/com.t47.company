<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>



<%@ page import="com.jspsmart.upload.*"%>  <!-- 导入上传包 -->
<jsp:directive.page import="entity.*"/>    <!-- 上传时所使用的实体类，此处为User类 -->
<jsp:directive.page import="dao.impl.*"/>
<%@page import="dao.UserDao"%>
<%@page import="java.io.File"%>  
<!-- userDao接口的实现类userDaoImpl -->



<%
     request.setCharacterEncoding("UTF-8");   //转换为UTF-8字符
    
     SmartUpload smartUpload = new SmartUpload();   //创建一个上传对象
     
     smartUpload.initialize(pageContext);        //上传对象为本页作用域中的元素
     
     smartUpload.upload();
     Request req=smartUpload.getRequest();         //接收传来的上传的文件   
     String userIdStr=req.getParameter("userId");    //接收传来的Id
     if((req==null||"".equals(req))||(userIdStr==null||"".equals(userIdStr))){
        out.print("输入错误！");
     }else{
         	 int userId=Integer.parseInt(userIdStr);
          
         	 Files files=smartUpload.getFiles();
     
     
          	 UserDao userDao=new UserDaoImpl();
         	 User user=new User();
           	 user=userDao.findUser(userId);
	   		 //如果添加用户成功，则建立这个用户的一个上传头像目录
	   		 String path=application.getRealPath("/");    //获得服务器上传的路径
	   		 
	    	 java.io.File fileDom=new File(path+"/image/loadHead/"+user.getUId()+"/");
	    	 
	    	 //判断要创建的文件夹是否存在
	   		 if(fileDom.exists()){//检查目录是否存在
	   		 }else{
	   		 	fileDom.mkdir();
	   		 }
	   		 
	        // if(fileDom.mkdir()){
	           // out.print("文件夹创建成功！");
	            
	            //得到上传的文件
    			 com.jspsmart.upload.File file=smartUpload.getFiles().getFile(0);
   
     			if(!file.isMissing()){
     			//取得上传的文件名
     			String fileName=file.getFileName();
   				// out.print("name:"+fileName);
    			//取得文件的后缀名
   	 			String ext= smartUpload.getFiles().getFile(0).getFileExt(); 
    			//out.print(ext);
    			//上传文件的路径
       		    String headFilePath="/image/loadHead/"+userId+"/"+"loadHead"+"."+ext;
     			//out.print(headFile);
     			//保存上传文件
        		file.saveAs(headFilePath);
     			//可以利用重定向来中发送页面时候来传递参数
     			//out.print(headFilePath);
     			response.sendRedirect("updateUserReg.jsp?headFilePath="+headFilePath+"");
     			//response.sendRedirect("/com.t47.company/login/login.jsp?msg=0");       //转发请求到登入页面
    			 }else{
     				out.print("上传失败！");
    		 	}
	         //}else{
	    	   // out.print("文件夹创建失败！");
	         //}

   }
%>

