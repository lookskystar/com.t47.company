package entity;

/**
 * ���
 * @author Administrator
 *
 */
public class Store {
	private int storeId;   //���Id
	private int productId;   //��ƷId
	private float  price;   //��Ʒ�۸�
	private int number;     //��Ʒ����
	
	public Store() {
		super();
	}

	public Store(int storeId, int productId, float price, int number) {
		super();
		this.storeId = storeId;
		this.productId = productId;
		this.price = price;
		this.number = number;
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}
	
	
	

}
