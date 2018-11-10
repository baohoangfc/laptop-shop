package entity;

public class Payment {
	private int id_payment;
	private String name_pay;

	public Payment() {
		super();
	}

	public Payment(int id_payment, String name_pay) {
		super();
		this.id_payment = id_payment;
		this.name_pay = name_pay;
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

}
