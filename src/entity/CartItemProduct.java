package entity;

import java.io.Serializable;
import entity.*;

//产品购物车第一步；创建一个产品信息和购买数量类，里面包含产品信息类
public class CartItemProduct implements Serializable {
   private Product product;  //当前产品
   private int qty;     //购物车中的数量

   
   //初始化product
   public CartItemProduct() {
		super();
	}


   public CartItemProduct(Product product, int qty) {
	super();
	this.product = product;
	this.qty = qty;
}


public Product getProduct() {
	return product;
}


public void setProduct(Product product) {
	this.product = product;
}


public int getQty() {
	return qty;
}


public void setQty(int qty) {
	this.qty = qty;
}
   
}
