package entity;

import java.util.Date;

/**
 * 会员销售
 * @author Administrator
 *
 */
public class AssociateSell {
	private int associateSellID;   //销售ID
	private String productID;   //商品Id
	private float sellPrice;  //商品销售价
	private Date  publishTime; //销售日期
	private int uId;   //会员Id
	private int adminId;  //销售人
	private String remark;  //备注
	
	public AssociateSell() {
		super();
	}

	public AssociateSell(int associateSellID, String productID,
			float sellPrice, Date publishTime, int id, int adminId,
			String remark) {
		super();
		this.associateSellID = associateSellID;
		this.productID = productID;
		this.sellPrice = sellPrice;
		this.publishTime = publishTime;
		uId = id;
		this.adminId = adminId;
		this.remark = remark;
	}

	public int getAssociateSellID() {
		return associateSellID;
	}

	public void setAssociateSellID(int associateSellID) {
		this.associateSellID = associateSellID;
	}

	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
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

	public int getUId() {
		return uId;
	}

	public void setUId(int id) {
		uId = id;
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
