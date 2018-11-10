package entity;

public class Guaranree {
	
	private int id_guaranree;
	private String date;

	public Guaranree() {
		super();
	}

	public Guaranree(int id_guaranree, String date) {
		super();
		this.id_guaranree = id_guaranree;
		this.date = date;
	}

	public int getId_guaranree() {
		return id_guaranree;
	}

	public void setId_guaranree(int id_guaranree) {
		this.id_guaranree = id_guaranree;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
