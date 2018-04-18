package entity;

import java.util.Date;

/**
 * 进货
 * @author Administrator
 *
 */
public class InStore {
	private int inStoreID;  //进货Id
	private int productID;   //商品Id
	private float price;     //进货价格
	private Date publishTime;   //进货时间
	private int adminId;   //进货人
	private int factoryID;   //进货厂家Id；
	private String remark;   //备注
	
	public InStore() {
		super();
	}

	public InStore(int inStoreID, int productID, float price, Date publishTime,
			int adminId, int factoryID, String remark) {
		super();
		this.inStoreID = inStoreID;
		this.productID = productID;
		this.price = price;
		this.publishTime = publishTime;
		this.adminId = adminId;
		this.factoryID = factoryID;
		this.remark = remark;
	}

	public int getInStoreID() {
		return inStoreID;
	}

	public void setInStoreID(int inStoreID) {
		this.inStoreID = inStoreID;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
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

	public int getFactoryID() {
		return factoryID;
	}

	public void setFactoryID(int factoryID) {
		this.factoryID = factoryID;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
