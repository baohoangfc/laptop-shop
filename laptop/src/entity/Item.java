package entity;

public class Item {
	
	private int id_product;
	private int quantity;
	private String name_product;
	private float price;
	public Item() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Item(int id_product, int quantity, String name_product, float price) {
		super();
		this.id_product = id_product;
		this.quantity = quantity;
		this.name_product = name_product;
		this.price = price;
	}
	public int getId_product() {
		return id_product;
	}
	public void setId_product(int id_product) {
		this.id_product = id_product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getName_product() {
		return name_product;
	}
	public void setName_product(String name_product) {
		this.name_product = name_product;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	
	
	
}
