package entity;

public class Product {
	private int id_product;
	private String name_product;
	private float price;
	private float price_sale;
	private String preview;
	private String details;
	private int id_status;
	private String production_code;
	private String date_create;
	private int id_categories;
	private String picture;
	private int id_guaranree;
	private String cname;
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(int id_product, String name_product, float price, float price_sale, String preview, String details,
			int id_status, String production_code, String date_create, int id_categories, String picture,
			int id_guaranree, String cname) {
		super();
		this.id_product = id_product;
		this.name_product = name_product;
		this.price = price;
		this.price_sale = price_sale;
		this.preview = preview;
		this.details = details;
		this.id_status = id_status;
		this.production_code = production_code;
		this.date_create = date_create;
		this.id_categories = id_categories;
		this.picture = picture;
		this.id_guaranree = id_guaranree;
		this.cname = cname;
	}
	public int getId_product() {
		return id_product;
	}
	public void setId_product(int id_product) {
		this.id_product = id_product;
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
	public float getPrice_sale() {
		return price_sale;
	}
	public void setPrice_sale(float price_sale) {
		this.price_sale = price_sale;
	}
	public String getPreview() {
		return preview;
	}
	public void setPreview(String preview) {
		this.preview = preview;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public int getId_status() {
		return id_status;
	}
	public void setId_status(int id_status) {
		this.id_status = id_status;
	}
	public String getProduction_code() {
		return production_code;
	}
	public void setProduction_code(String production_code) {
		this.production_code = production_code;
	}
	public String getDate_create() {
		return date_create;
	}
	public void setDate_create(String date_create) {
		this.date_create = date_create;
	}
	public int getId_categories() {
		return id_categories;
	}
	public void setId_categories(int id_categories) {
		this.id_categories = id_categories;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getId_guaranree() {
		return id_guaranree;
	}
	public void setId_guaranree(int id_guaranree) {
		this.id_guaranree = id_guaranree;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	
	

	
}
