package entity;

/**
 * ���ۼ۸�
 * @author Administrator
 *
 */
public class SellPrices {
	private int sellPirceID;  //���ۼ۸���
	private String productID; //��Ʒ���
	private float sellPrice;  //��Ʒ�۸񣨲��ܵ��ڽ����۸񣬵��ڱ�����
	
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
