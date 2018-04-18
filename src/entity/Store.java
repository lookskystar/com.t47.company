package entity;

/**
 * 库存
 * @author Administrator
 *
 */
public class Store {
	private int storeId;   //库存Id
	private int productId;   //商品Id
	private float  price;   //商品价格
	private int number;     //商品数量
	
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
