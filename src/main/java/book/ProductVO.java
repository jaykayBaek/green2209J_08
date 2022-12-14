package book;

public class ProductVO {
	private int idx;
	private int idxBook;
	private String pricePaper;
	private String priceEbook;
	private String rateDiscount;
	private int canReader;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getIdxBook() {
		return idxBook;
	}
	public void setIdxBook(int idxBook) {
		this.idxBook = idxBook;
	}
	public String getPricePaper() {
		return pricePaper;
	}
	public void setPricePaper(String pricePaper) {
		this.pricePaper = pricePaper;
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
	public int getCanReader() {
		return canReader;
	}
	public void setCanReader(int canReader) {
		this.canReader = canReader;
	}
	@Override
	public String toString() {
		return "ProductVO [idx=" + idx + ", idxBook=" + idxBook + ", pricePaper=" + pricePaper + ", priceEbook="
				+ priceEbook + ", rateDiscount=" + rateDiscount + ", canReader=" + canReader + "]";
	}
	
}
