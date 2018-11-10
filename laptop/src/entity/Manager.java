package entity;

public class Manager {

	private int mid;
	private String username;
	private String password;
	private String fullname;
	private String email;
	private String address;
	private String phone;
	private int enable;
	private int role_id;
	private String role_name;

	public Manager() {
		super();
	}

	public Manager(int mid, String username, String password, String fullname, String email, String address,
			String phone, int enable, int role_id, String role_name) {
		super();
		this.mid = mid;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.enable = enable;
		this.role_id = role_id;
		this.role_name = role_name;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getEnable() {
		return enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
	}

	public int getRole_id() {
		return role_id;
	}

	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

}
