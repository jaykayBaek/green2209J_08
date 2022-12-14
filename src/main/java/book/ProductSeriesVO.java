package book;

public class ProductSeriesVO {
	private int idx;
	private String titleSeries;
	private String priceSeries;
	private String rateDiscount;
	private String isbnSeries;
	private String imgSaved;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitleSeries() {
		return titleSeries;
	}
	public void setTitleSeries(String titleSeries) {
		this.titleSeries = titleSeries;
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
	public String getIsbnSeries() {
		return isbnSeries;
	}
	public void setIsbnSeries(String isbnSeries) {
		this.isbnSeries = isbnSeries;
	}
	public String getImgSaved() {
		return imgSaved;
	}
	public void setImgSaved(String imgSaved) {
		this.imgSaved = imgSaved;
	}
	@Override
	public String toString() {
		return "ProductSeriesVO [idx=" + idx + ", titleSeries=" + titleSeries + ", priceSeries=" + priceSeries
				+ ", rateDiscount=" + rateDiscount + ", isbnSeries=" + isbnSeries + ", imgSaved=" + imgSaved + "]";
	}

	
}
