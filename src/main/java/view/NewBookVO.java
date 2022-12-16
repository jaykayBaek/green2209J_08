package view;

public class NewBookVO {
	private int bookIdx;
	private int productIdx;
	private String title;
	private String publisher;
	private String isbn;
	private String imgSaved;
	
	//평점테이블만들면 평점도
	public int getBookIdx() {
		return bookIdx;
	}
	public void setBookIdx(int bookIdx) {
		this.bookIdx = bookIdx;
	}
	public int getProductIdx() {
		return productIdx;
	}
	public void setProductIdx(int productIdx) {
		this.productIdx = productIdx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getImgSaved() {
		return imgSaved;
	}
	public void setImgSaved(String imgSaved) {
		this.imgSaved = imgSaved;
	}
	@Override
	public String toString() {
		return "NewBookVO [bookIdx=" + bookIdx + ", productIdx=" + productIdx + ", title=" + title + ", publisher="
				+ publisher + ", isbn=" + isbn + ", imgSaved=" + imgSaved + "]";
	}
	
	
	
}
