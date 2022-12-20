package member;

public class ReviewCmtVO {
	private int idxCmt;
	private int idxReview;
	private int idxUser;
	private String contentReply;
	private String dateCreated;
	private int hidden;
	private String email;
	
	
	public int getIdxCmt() {
		return idxCmt;
	}
	public void setIdxCmt(int idxCmt) {
		this.idxCmt = idxCmt;
	}
	public int getIdxReview() {
		return idxReview;
	}
	public void setIdxReview(int idxReview) {
		this.idxReview = idxReview;
	}
	public int getIdxUser() {
		return idxUser;
	}
	public void setIdxUser(int idxUser) {
		this.idxUser = idxUser;
	}
	public String getContentReply() {
		return contentReply;
	}
	public void setContentReply(String contentReply) {
		this.contentReply = contentReply;
	}
	public String getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}
	public int getHidden() {
		return hidden;
	}
	public void setHidden(int hidden) {
		this.hidden = hidden;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "ReviewCmtVO [idxCmt=" + idxCmt + ", idxReview=" + idxReview + ", idxUser=" + idxUser + ", contentReply="
				+ contentReply + ", dateCreated=" + dateCreated + ", hidden=" + hidden + ", email=" + email + "]";
	}
	
	
}
