package entity;

import java.util.Date;

/**
 * 零售销售
 * @author Administrator
 *
 */
public class Sell {
	private int sellId;   //销售Id
	private int productId;   //商品Id
	private float sellPrice;  //商品销售价格
	private Date publishTime; //销售时间
	private int adminId;   //销售人（管理人）
	private String remark;  //备注
	
	public Sell() {
		super();
	}

	public Sell(int sellId, int productId, float sellPrice, Date publishTime,
			int adminId, String remark) {
		super();
		this.sellId = sellId;
		this.productId = productId;
		this.sellPrice = sellPrice;
		this.publishTime = publishTime;
		this.adminId = adminId;
		this.remark = remark;
	}

	public int getSellId() {
		return sellId;
	}

	public void setSellId(int sellId) {
		this.sellId = sellId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public float getSellPrice() {
		return sellPrice;
	}

	public void setSellPrice(float sellPrice) {
		this.sellPrice = sellPrice;
	}

	public Date getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
	

}
