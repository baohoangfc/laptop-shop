package entity;

public class Categories {
	private int cid;
	private String cname;
	private int id_parent;
	public Categories() {
		super();
	}
	public Categories(int cid, String cname, int id_parent) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.id_parent = id_parent;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getId_parent() {
		return id_parent;
	}
	public void setId_parent(int id_parent) {
		this.id_parent = id_parent;
	}
	
	
	
}
