package member;

public class CheckoutVO {
	private int idxProduct;
	private String imgSaved;
	private String nameAuthor;
	private String priceEbook;
	private String rateDiscount;
	private String titleBook;
	private String isbn;
	private int priceCalculated;
	public int getIdxProduct() {
		return idxProduct;
	}
	public void setIdxProduct(int idxProduct) {
		this.idxProduct = idxProduct;
	}
	public String getImgSaved() {
		return imgSaved;
	}
	public void setImgSaved(String imgSaved) {
		this.imgSaved = imgSaved;
	}
	public String getNameAuthor() {
		return nameAuthor;
	}
	public void setNameAuthor(String nameAuthor) {
		this.nameAuthor = nameAuthor;
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
	public String getTitleBook() {
		return titleBook;
	}
	public void setTitleBook(String titleBook) {
		this.titleBook = titleBook;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public int getPriceCalculated() {
		return priceCalculated;
	}
	public void setPriceCalculated(int priceCalculated) {
		this.priceCalculated = priceCalculated;
	}
	@Override
	public String toString() {
		return "CheckoutVO [idxProduct=" + idxProduct + ", imgSaved=" + imgSaved + ", nameAuthor=" + nameAuthor
				+ ", priceEbook=" + priceEbook + ", rateDiscount=" + rateDiscount + ", titleBook=" + titleBook
				+ ", isbn=" + isbn + ", priceCalculated=" + priceCalculated + "]";
	}
	
	
	
	
}
