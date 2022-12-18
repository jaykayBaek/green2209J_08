package member;

public class MyPaymentVO {
	private int idx;
	private int idxUser;
	private String orderNo;
	private int priceOrder;
	private int priceSales;
	private int pricePointUsed;
	private int pricePayment;
	private String optionChoosed;
	private int pointEarned;
	private String datePurchased;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getIdxUser() {
		return idxUser;
	}
	public void setIdxUser(int idxUser) {
		this.idxUser = idxUser;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public int getPriceOrder() {
		return priceOrder;
	}
	public void setPriceOrder(int priceOrder) {
		this.priceOrder = priceOrder;
	}
	public int getPriceSales() {
		return priceSales;
	}
	public void setPriceSales(int priceSales) {
		this.priceSales = priceSales;
	}
	public int getPricePointUsed() {
		return pricePointUsed;
	}
	public void setPricePointUsed(int pricePointUsed) {
		this.pricePointUsed = pricePointUsed;
	}
	public int getPricePayment() {
		return pricePayment;
	}
	public void setPricePayment(int pricePayment) {
		this.pricePayment = pricePayment;
	}
	public String getOptionChoosed() {
		return optionChoosed;
	}
	public void setOptionChoosed(String optionChoosed) {
		this.optionChoosed = optionChoosed;
	}
	public int getPointEarned() {
		return pointEarned;
	}
	public void setPointEarned(int pointEarned) {
		this.pointEarned = pointEarned;
	}
	public String getDatePurchased() {
		return datePurchased;
	}
	public void setDatePurchased(String datePurchased) {
		this.datePurchased = datePurchased;
	}
	@Override
	public String toString() {
		return "MyPaymentVO [idx=" + idx + ", idxUser=" + idxUser + ", orderNo=" + orderNo + ", priceOrder="
				+ priceOrder + ", priceSales=" + priceSales + ", pricePointUsed=" + pricePointUsed + ", pricePayment="
				+ pricePayment + ", optionChoosed=" + optionChoosed + ", pointEarned=" + pointEarned
				+ ", datePurchased=" + datePurchased + "]";
	}
	
	
	
}
