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

//���ﳵ������������JSP�����Ĳ�����servlet��
public class AddProductToCartServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
            
		  //���ܴ�productList.jsp�����д�����productId;
		String pruductIdStr=request.getParameter("productId");
		if(pruductIdStr==null||"".equals(pruductIdStr)){
			System.out.println("�������");
		}else{
			int pruductId=Integer.parseInt(pruductIdStr);
			
			//ͨ��pruductId�õ���Ʒ��Ϣ��Product��
			ProuctDao productDao=new ProductDaoImpl();
			Product product=productDao.findProduct(pruductId);
			
			//ͨ��request�õ�ֵ�ķ�������HTTPSession
			HttpSession sessions=request.getSession();

			//��session�е�����ת��ΪMap
			Map map=(Map)sessions.getAttribute("carts");
			
			//�ж��Ƿ��һ�ζ���
			if(map==null){//��һ��
				map=new HashMap();  //����һ���µ�map
				sessions.setAttribute("carts", map);     //����session��
			}
			
			//�жϹ��ﳵ���Ƿ���ڸ��鼮ͨ��keyֵ,productId��
			CartItemProduct productCart=(CartItemProduct)map.get(pruductId);  //ͨ��pruductId�õ�map�е�CartItemProduct��Ϣ
			
			if(productCart==null){  //��һ�ι���ò�Ʒ
				productCart=new CartItemProduct(product,1);
				map.put(pruductId,productCart);
			}else{
				productCart.setQty(productCart.getQty()+1);
			}
			
			//�ض��򵽹��ﳵ��ʾҳ��
			//response.sendRedirect("proShowList/productCart.jsp"); 
			}
	}


	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

}
