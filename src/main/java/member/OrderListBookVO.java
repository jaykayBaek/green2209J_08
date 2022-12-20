package member;

public class OrderListBookVO {
	private int idx;
	private int idxOrderList;
	private int idxProduct;
	private String title;
	private String isbn;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getIdxOrderList() {
		return idxOrderList;
	}
	public void setIdxOrderList(int idxOrderList) {
		this.idxOrderList = idxOrderList;
	}
	public int getIdxProduct() {
		return idxProduct;
	}
	public void setIdxProduct(int idxProduct) {
		this.idxProduct = idxProduct;
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
	@Override
	public String toString() {
		return "OrderListBookVO [idx=" + idx + ", idxOrderList=" + idxOrderList + ", idxProduct=" + idxProduct
				+ ", title=" + title + ", isbn=" + isbn + "]";
	}

	
	
}
