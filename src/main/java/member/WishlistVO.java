package member;

public class WishlistVO {
	private int idxBook;
	private int idxProduct;
	private String title;
	private String priceEbook;
	private String rateDiscount;
	private String isbn;
	private String nameAuthor;
	private String imgSaved;
	
	private int priceCalculated;

	public int getIdxBook() {
		return idxBook;
	}

	public void setIdxBook(int idxBook) {
		this.idxBook = idxBook;
	}

	public int getIdxProduct() {
		return idxProduct;
	}

	public void setIdxProduct(int idxProduct) {
		this.idxProduct = idxProduct;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPriceEbook() {
		return priceEbook;
	}

	public void setPriceEbook(String priceEbook) {
		this.priceEbook = priceEbook;
	}

	public String getRateDiscount() {
		return rateDiscount;
	}

	public void setRateDiscount(String rateDiscount) {
		this.rateDiscount = rateDiscount;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getNameAuthor() {
		return nameAuthor;
	}

	public void setNameAuthor(String nameAuthor) {
		this.nameAuthor = nameAuthor;
	}

	public String getImgSaved() {
		return imgSaved;
	}

	public void setImgSaved(String imgSaved) {
		this.imgSaved = imgSaved;
	}

	public int getPriceCalculated() {
		return priceCalculated;
	}

	public void setPriceCalculated(int priceCalculated) {
		this.priceCalculated = priceCalculated;
	}

	@Override
	public String toString() {
		return "WishlistVO [idxBook=" + idxBook + ", idxProduct=" + idxProduct + ", title=" + title + ", priceEbook="
				+ priceEbook + ", rateDiscount=" + rateDiscount + ", isbn=" + isbn + ", nameAuthor=" + nameAuthor
				+ ", imgSaved=" + imgSaved + ", priceCalculated=" + priceCalculated + "]";
	}

	
	
	
	
	
}
