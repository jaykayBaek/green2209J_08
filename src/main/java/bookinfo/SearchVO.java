package bookinfo;

public class SearchVO {
	private String imgSavedBook;
	private String title;
	private String isbn;
	private String nameAuthor;
	private String textIntroduce;
	private double starRating;
	private int reviewCnt;
	private int idxProduct;
	private int idxBook;
	private int idxAuthor;
	private int priceEbook;
	
	public String getImgSavedBook() {
		return imgSavedBook;
	}
	public void setImgSavedBook(String imgSavedBook) {
		this.imgSavedBook = imgSavedBook;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getTextIntroduce() {
		return textIntroduce;
	}
	public void setTextIntroduce(String textIntroduce) {
		this.textIntroduce = textIntroduce;
	}
	public double getStarRating() {
		return starRating;
	}
	public void setStarRating(double starRating) {
		this.starRating = starRating;
	}
	public int getReviewCnt() {
		return reviewCnt;
	}
	public void setReviewCnt(int reviewCnt) {
		this.reviewCnt = reviewCnt;
	}
	public int getIdxProduct() {
		return idxProduct;
	}
	public void setIdxProduct(int idxProduct) {
		this.idxProduct = idxProduct;
	}
	public int getIdxBook() {
		return idxBook;
	}
	public void setIdxBook(int idxBook) {
		this.idxBook = idxBook;
	}
	public int getIdxAuthor() {
		return idxAuthor;
	}
	public void setIdxAuthor(int idxAuthor) {
		this.idxAuthor = idxAuthor;
	}
	public int getPriceEbook() {
		return priceEbook;
	}
	public void setPriceEbook(int priceEbook) {
		this.priceEbook = priceEbook;
	}
	@Override
	public String toString() {
		return "SearchVO [imgSavedBook=" + imgSavedBook + ", title=" + title + ", isbn=" + isbn + ", nameAuthor="
				+ nameAuthor + ", textIntroduce=" + textIntroduce + ", starRating=" + starRating + ", reviewCnt="
				+ reviewCnt + ", idxProduct=" + idxProduct + ", idxBook=" + idxBook + ", idxAuthor=" + idxAuthor
				+ ", priceEbook=" + priceEbook + "]";
	}
	
	
	
	
}
