package member;

public class MyBookVO {
	private int idx;
	private String imgSaved;
	private String titleBook;
	private String textContent;
	private String isbnBook;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getImgSaved() {
		return imgSaved;
	}
	public void setImgSaved(String imgSaved) {
		this.imgSaved = imgSaved;
	}
	public String getTitleBook() {
		return titleBook;
	}
	public void setTitleBook(String titleBook) {
		this.titleBook = titleBook;
	}
	public String getTextContent() {
		return textContent;
	}
	public void setTextContent(String textContent) {
		this.textContent = textContent;
	}
	public String getIsbnBook() {
		return isbnBook;
	}
	public void setIsbnBook(String isbnBook) {
		this.isbnBook = isbnBook;
	}
	@Override
	public String toString() {
		return "MyBookVO [idx=" + idx + ", imgSaved=" + imgSaved + ", titleBook=" + titleBook + ", textContent="
				+ textContent + ", isbnBook=" + isbnBook + "]";
	}
	
	
	
	
}
