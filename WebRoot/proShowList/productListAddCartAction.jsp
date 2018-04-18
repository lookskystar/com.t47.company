<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="dao.impl.*" %>
<%@ page import="dao.*" %>
<%@ page import="entity.*" %>


<%
     //接受从productList.jsp订购中传来的productId;
	String pruductIdStr=request.getParameter("productId");
	String productName=new String(request.getParameter("productName").getBytes("ISO-8859-1"),"UTF-8");
		
	 User loginUser=null;
	 if(session.getAttribute("user")==null){
	 	   out.print("您没有登陆，不能订购！请返回");
	 }else{
    if((pruductIdStr==null||"".equals(pruductIdStr))||(productName==null||"".equals(productName))){
			out.print("输入错误！");
		}else{
			int pruductId=Integer.parseInt(pruductIdStr);
			
			//通过pruductId得到产品信息（Product）
			ProuctDao productDao=new ProductDaoImpl();
			Product product=productDao.findProduct(pruductId);
			
			//通过request得到值的方法创建HTTPSession
			HttpSession sessions=request.getSession();

			//将session中的数据转换为Map
			Map map=(Map)sessions.getAttribute("cartSession");
			
			//判断是否第一次订购
			if(map==null){//第一次
				map=new HashMap();  //创建一个新的map
				sessions.setAttribute("cartSession", map);     //放入session中
			}
			
			//判断购物车中是否存在该书籍通过key值,productId找
			CartItemProduct productCart=(CartItemProduct)map.get(pruductId);  //通过pruductId得到map中的CartItemProduct信息
			
			if(productCart==null){  //第一次购买该产品
				productCart=new CartItemProduct(product,1);
				map.put(pruductIdStr,productCart);
			}else{
				productCart.setQty(productCart.getQty()+1);
			}
			
			//重定向到购物车显示页面
			response.sendRedirect("productList.jsp?page=1&msg=0");
			
			
       		//request.setAttribute("msg","添加<"+productName+">产品到购物车成功！（点击查看）");
		    //request.getRequestDispatcher("productList.jsp?page=1").forward(request,response);
			}
	}
%>
        
			

