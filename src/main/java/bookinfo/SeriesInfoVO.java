package bookinfo;

public class SeriesInfoVO {
	private String titleBook;
	private String publisher;
	private String datePublishing;
	private String isbn;
	private String titleSeries;
	private String imgSavedBook;
	private String imgSavedProductSeries;
	
	private int idxBook;
	private int idxProduct;
	private int idxProductSeries;
	
	
	public String getTitleBook() {
		return titleBook;
	}
	public void setTitleBook(String titleBook) {
		this.titleBook = titleBook;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getDatePublishing() {
		return datePublishing;
	}
	public void setDatePublishing(String datePublishing) {
		this.datePublishing = datePublishing;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getTitleSeries() {
		return titleSeries;
	}
	public void setTitleSeries(String titleSeries) {
		this.titleSeries = titleSeries;
	}
	public String getImgSavedBook() {
		return imgSavedBook;
	}
	public void setImgSavedBook(String imgSavedBook) {
		this.imgSavedBook = imgSavedBook;
	}
	public String getImgSavedProductSeries() {
		return imgSavedProductSeries;
	}
	public void setImgSavedProductSeries(String imgSavedProductSeries) {
		this.imgSavedProductSeries = imgSavedProductSeries;
	}
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
	public int getIdxProductSeries() {
		return idxProductSeries;
	}
	public void setIdxProductSeries(int idxProductSeries) {
		this.idxProductSeries = idxProductSeries;
	}
	@Override
	public String toString() {
		return "SeriesInfoVO [titleBook=" + titleBook + ", publisher=" + publisher + ", datePublishing="
				+ datePublishing + ", isbn=" + isbn + ", titleSeries=" + titleSeries + ", imgSavedBook=" + imgSavedBook
				+ ", imgSavedProductSeries=" + imgSavedProductSeries + ", idxBook=" + idxBook + ", idxProduct="
				+ idxProduct + ", idxProductSeries=" + idxProductSeries + "]";
	}

	
	
	
}
