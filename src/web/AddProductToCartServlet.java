package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.*;
import dao.impl.*;
import dao.*;

//购物车二，创建接收JSP传来的参数的servlet类
public class AddProductToCartServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
            
		  //接受从productList.jsp订购中传来的productId;
		String pruductIdStr=request.getParameter("productId");
		if(pruductIdStr==null||"".equals(pruductIdStr)){
			System.out.println("输入错误！");
		}else{
			int pruductId=Integer.parseInt(pruductIdStr);
			
			//通过pruductId得到产品信息（Product）
			ProuctDao productDao=new ProductDaoImpl();
			Product product=productDao.findProduct(pruductId);
			
			//通过request得到值的方法创建HTTPSession
			HttpSession sessions=request.getSession();

			//将session中的数据转换为Map
			Map map=(Map)sessions.getAttribute("carts");
			
			//判断是否第一次订购
			if(map==null){//第一次
				map=new HashMap();  //创建一个新的map
				sessions.setAttribute("carts", map);     //放入session中
			}
			
			//判断购物车中是否存在该书籍通过key值,productId找
			CartItemProduct productCart=(CartItemProduct)map.get(pruductId);  //通过pruductId得到map中的CartItemProduct信息
			
			if(productCart==null){  //第一次购买该产品
				productCart=new CartItemProduct(product,1);
				map.put(pruductId,productCart);
			}else{
				productCart.setQty(productCart.getQty()+1);
			}
			
			//重定向到购物车显示页面
			//response.sendRedirect("proShowList/productCart.jsp"); 
			}
	}


	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

}
