package entity;

/*
 * 商品表实体类
 */
public class Product {
	private int productId; // 商品ID
	private String serialNumber; // 商品编号
	private String names; // 商品名字
	private String brand; // 商品品牌
	private String model; // 商品型号
	private String picture; // 商品图片路径
	private String descriptions; // 商品描述
	private float price;   //价格
	// 无参数的构造函数

	public Product() {
		super();
	}

	// 带参数的构造函数
	public Product(int productID, String serialNumber, String names,
			String brand, String model, String picture, String descriptions,float price) {
		super();
		this.productId = productId;
		this.serialNumber = serialNumber;
		this.names = names;
		this.brand = brand;
		this.model = model;
		this.picture = picture;
		this.descriptions = descriptions;
		this.price=price;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public String getNames() {
		return names;
	}

	public void setNames(String names) {
		this.names = names;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

}
