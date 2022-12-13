package book;

public class BookVO {
	private int idx;
	private String title;
	private String publisher;
	private String datePublishing;
	private String isbn;
	private String textContent;
	private String categorySub;
	private String categoryMain;
	private String categoryNation;
	private String imgSaved;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
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
	public String getTextContent() {
		return textContent;
	}
	public void setTextContent(String textContent) {
		this.textContent = textContent;
	}
	public String getCategorySub() {
		return categorySub;
	}
	public void setCategorySub(String categorySub) {
		this.categorySub = categorySub;
	}
	public String getCategoryMain() {
		return categoryMain;
	}
	public void setCategoryMain(String categoryMain) {
		this.categoryMain = categoryMain;
	}
	public String getCategoryNation() {
		return categoryNation;
	}
	public void setCategoryNation(String categoryNation) {
		this.categoryNation = categoryNation;
	}
	public String getImgSaved() {
		return imgSaved;
	}
	public void setImgSaved(String imgSaved) {
		this.imgSaved = imgSaved;
	}
	@Override
	public String toString() {
		return "BookVO [idx=" + idx + ", title=" + title + ", publisher=" + publisher + ", datePublishing="
				+ datePublishing + ", isbn=" + isbn + ", textContent=" + textContent + ", categorySub=" + categorySub
				+ ", categoryMain=" + categoryMain + ", categoryNation=" + categoryNation + ", imgSaved=" + imgSaved
				+ "]";
	}
	
	
}
