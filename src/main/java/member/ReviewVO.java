package member;

public class ReviewVO {
	private int idx;
	private String contentReview;
	private int starRating;
	private int idxUser;
	private String dateCreated;
	private int buyCheck;
	private int hidden;
	private int idxProduct;
	private int spoilerCheck;
	
	private String email;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getContentReview() {
		return contentReview;
	}

	public void setContentReview(String contentReview) {
		this.contentReview = contentReview;
	}

	public int getStarRating() {
		return starRating;
	}

	public void setStarRating(int starRating) {
		this.starRating = starRating;
	}

	public int getIdxUser() {
		return idxUser;
	}

	public void setIdxUser(int idxUser) {
		this.idxUser = idxUser;
	}

	public String getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}

	public int getBuyCheck() {
		return buyCheck;
	}

	public void setBuyCheck(int buyCheck) {
		this.buyCheck = buyCheck;
	}

	public int getHidden() {
		return hidden;
	}

	public void setHidden(int hidden) {
		this.hidden = hidden;
	}

	public int getIdxProduct() {
		return idxProduct;
	}

	public void setIdxProduct(int idxProduct) {
		this.idxProduct = idxProduct;
	}

	public int getSpoilerCheck() {
		return spoilerCheck;
	}

	public void setSpoilerCheck(int spoilerCheck) {
		this.spoilerCheck = spoilerCheck;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "ReviewVO [idx=" + idx + ", contentReview=" + contentReview + ", starRating=" + starRating + ", idxUser="
				+ idxUser + ", dateCreated=" + dateCreated + ", buyCheck=" + buyCheck + ", hidden=" + hidden
				+ ", idxProduct=" + idxProduct + ", spoilerCheck=" + spoilerCheck + ", email=" + email + "]";
	}
	
	
	
	
}
