package bookinfo;

public class BookInfoVO {
	private int idxProduct;
	private int idxProductSeries;
	private int idxBook;
	private String categorySub;
	private String categoryNation;
	private String categoryMain;
	private String titleBook;
	private String publisher;
	private String isbn;
	private String imgSavedBook;
	private String pricePaper;
	private String priceEbook;
	private String priceSeries;
	private String rateDiscount;
	private int canReader;
	private String textIntroduce; 
	private String titleSeries; 
	private String imgSavedSeries;
	private int priceCalculated;
	private String datePublishing;
	
	/*장바구니에 상품을 담고 있는지*/
	private String hasWishlist;

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

	public int getIdxBook() {
		return idxBook;
	}

	public void setIdxBook(int idxBook) {
		this.idxBook = idxBook;
	}

	public String getCategorySub() {
		return categorySub;
	}

	public void setCategorySub(String categorySub) {
		this.categorySub = categorySub;
	}

	public String getCategoryNation() {
		return categoryNation;
	}

	public void setCategoryNation(String categoryNation) {
		this.categoryNation = categoryNation;
	}

	public String getCategoryMain() {
		return categoryMain;
	}

	public void setCategoryMain(String categoryMain) {
		this.categoryMain = categoryMain;
	}

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

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getImgSavedBook() {
		return imgSavedBook;
	}

	public void setImgSavedBook(String imgSavedBook) {
		this.imgSavedBook = imgSavedBook;
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

	public String getPriceSeries() {
		return priceSeries;
	}

	public void setPriceSeries(String priceSeries) {
		this.priceSeries = priceSeries;
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

	public String getTextIntroduce() {
		return textIntroduce;
	}

	public void setTextIntroduce(String textIntroduce) {
		this.textIntroduce = textIntroduce;
	}

	public String getTitleSeries() {
		return titleSeries;
	}

	public void setTitleSeries(String titleSeries) {
		this.titleSeries = titleSeries;
	}

	public String getImgSavedSeries() {
		return imgSavedSeries;
	}

	public void setImgSavedSeries(String imgSavedSeries) {
		this.imgSavedSeries = imgSavedSeries;
	}

	public int getPriceCalculated() {
		return priceCalculated;
	}

	public void setPriceCalculated(int priceCalculated) {
		this.priceCalculated = priceCalculated;
	}

	public String getDatePublishing() {
		return datePublishing;
	}

	public void setDatePublishing(String datePublishing) {
		this.datePublishing = datePublishing;
	}

	public String getHasWishlist() {
		return hasWishlist;
	}

	public void setHasWishlist(String hasWishlist) {
		this.hasWishlist = hasWishlist;
	}

	@Override
	public String toString() {
		return "BookInfoVO [idxProduct=" + idxProduct + ", idxProductSeries=" + idxProductSeries + ", idxBook="
				+ idxBook + ", categorySub=" + categorySub + ", categoryNation=" + categoryNation + ", categoryMain="
				+ categoryMain + ", titleBook=" + titleBook + ", publisher=" + publisher + ", isbn=" + isbn
				+ ", imgSavedBook=" + imgSavedBook + ", pricePaper=" + pricePaper + ", priceEbook=" + priceEbook
				+ ", priceSeries=" + priceSeries + ", rateDiscount=" + rateDiscount + ", canReader=" + canReader
				+ ", textIntroduce=" + textIntroduce + ", titleSeries=" + titleSeries + ", imgSavedSeries="
				+ imgSavedSeries + ", priceCalculated=" + priceCalculated + ", datePublishing=" + datePublishing
				+ ", hasWishlist=" + hasWishlist + "]";
	}

	

}
