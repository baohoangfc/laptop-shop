package entity;

public class OrderDetail {
	
	private int id;
	private int id_order;
	private int id_product;
	private double price;
	private int quantity;
	public OrderDetail() {
		super();
	}
	public OrderDetail(int id, int id_order, int id_product, double price, int quantity) {
		super();
		this.id = id;
		this.id_order = id_order;
		this.id_product = id_product;
		this.price = price;
		this.quantity = quantity;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_order() {
		return id_order;
	}
	public void setId_order(int id_order) {
		this.id_order = id_order;
	}
	public int getId_product() {
		return id_product;
	}
	public void setId_product(int id_product) {
		this.id_product = id_product;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
	

	
}
