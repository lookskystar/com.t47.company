package entity;

/**
 * 销售价格
 * @author Administrator
 *
 */
public class SellPrices {
	private int sellPirceID;  //销售价格编号
	private String productID; //商品编号
	private float sellPrice;  //商品价格（不能低于进货价格，低于报警）
	
	public SellPrices() {
		super();
	}

	public SellPrices(int sellPirceID, String productID, float sellPrice) {
		super();
		this.sellPirceID = sellPirceID;
		this.productID = productID;
		this.sellPrice = sellPrice;
	}

	public int getSellPirceID() {
		return sellPirceID;
	}

	public void setSellPirceID(int sellPirceID) {
		this.sellPirceID = sellPirceID;
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
	
	
	
	

}
