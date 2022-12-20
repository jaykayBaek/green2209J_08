package member;

public class MyLibVO {
	private int idxMylib;
	private int idxSeries;
	private int bookCntInSeries;
	private String imgSavedSeires;
	private String titleSeries;
	private String isbnSeries;
	public int getIdxMylib() {
		return idxMylib;
	}
	public void setIdxMylib(int idxMylib) {
		this.idxMylib = idxMylib;
	}
	public int getIdxSeries() {
		return idxSeries;
	}
	public void setIdxSeries(int idxSeries) {
		this.idxSeries = idxSeries;
	}
	public int getBookCntInSeries() {
		return bookCntInSeries;
	}
	public void setBookCntInSeries(int bookCntInSeries) {
		this.bookCntInSeries = bookCntInSeries;
	}
	public String getImgSavedSeires() {
		return imgSavedSeires;
	}
	public void setImgSavedSeires(String imgSavedSeires) {
		this.imgSavedSeires = imgSavedSeires;
	}
	public String getTitleSeries() {
		return titleSeries;
	}
	public void setTitleSeries(String titleSeries) {
		this.titleSeries = titleSeries;
	}
	public String getIsbnSeries() {
		return isbnSeries;
	}
	public void setIsbnSeries(String isbnSeries) {
		this.isbnSeries = isbnSeries;
	}
	@Override
	public String toString() {
		return "MyLibVO [idxMylib=" + idxMylib + ", idxSeries=" + idxSeries + ", bookCntInSeries=" + bookCntInSeries
				+ ", imgSavedSeires=" + imgSavedSeires + ", titleSeries=" + titleSeries + ", isbnSeries=" + isbnSeries
				+ "]";
	}

	
	
	
}
