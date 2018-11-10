package entity;

public class Order {

	private int id_order;
	private int role_id;
	private double total;
	private String address;
	private String date;
	private String email;
	private String phone;
	private int id_payment;
	private String name_pay;
	private int id_product;

	public Order() {
		super();
	}

	public Order(int id_order, int role_id, double total, String address, String date, String email, String phone,
			int id_payment, String name_pay, int id_product) {
		super();
		this.id_order = id_order;
		this.role_id = role_id;
		this.total = total;
		this.address = address;
		this.date = date;
		this.email = email;
		this.phone = phone;
		this.id_payment = id_payment;
		this.name_pay = name_pay;
		this.id_product = id_product;
	}

	public int getId_order() {
		return id_order;
	}

	public void setId_order(int id_order) {
		this.id_order = id_order;
	}

	public int getRole_id() {
		return role_id;
	}

	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getId_payment() {
		return id_payment;
	}

	public void setId_payment(int id_payment) {
		this.id_payment = id_payment;
	}

	public String getName_pay() {
		return name_pay;
	}

	public void setName_pay(String name_pay) {
		this.name_pay = name_pay;
	}

	public int getId_product() {
		return id_product;
	}

	public void setId_product(int id_product) {
		this.id_product = id_product;
	}

}
