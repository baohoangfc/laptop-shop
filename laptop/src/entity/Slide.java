package entity;

public class Slide {
	
	private int id_slide;
	private String image;

	public Slide() {
		super();
	}

	public Slide(int id_slide, String image) {
		super();
		this.id_slide = id_slide;
		this.image = image;
	}

	public int getId_slide() {
		return id_slide;
	}

	public void setId_slide(int id_slide) {
		this.id_slide = id_slide;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
