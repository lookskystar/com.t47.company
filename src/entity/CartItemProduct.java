package entity;

import java.io.Serializable;
import entity.*;

//��Ʒ���ﳵ��һ��������һ����Ʒ��Ϣ�͹��������࣬���������Ʒ��Ϣ��
public class CartItemProduct implements Serializable {
   private Product product;  //��ǰ��Ʒ
   private int qty;     //���ﳵ�е�����

   
   //��ʼ��product
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
