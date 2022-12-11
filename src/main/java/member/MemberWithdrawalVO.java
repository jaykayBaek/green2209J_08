package member;

public class MemberWithdrawalVO {
	private int idx;
	private int reasonWithdrawal;
	private String emailUser;
	private String dateDeleted;
	private String dateDeletedDiff;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getReasonWithdrawal() {
		return reasonWithdrawal;
	}
	public void setReasonWithdrawal(int reasonWithdrawal) {
		this.reasonWithdrawal = reasonWithdrawal;
	}
	public String getEmailUser() {
		return emailUser;
	}
	public void setEmailUser(String emailUser) {
		this.emailUser = emailUser;
	}
	public String getDateDeleted() {
		return dateDeleted;
	}
	public void setDateDeleted(String dateDeleted) {
		this.dateDeleted = dateDeleted;
	}
	public String getDateDeletedDiff() {
		return dateDeletedDiff;
	}
	public void setDateDeletedDiff(String dateDeletedDiff) {
		this.dateDeletedDiff = dateDeletedDiff;
	}
	@Override
	public String toString() {
		return "MemberWithdrawalVO [idx=" + idx + ", reasonWithdrawal=" + reasonWithdrawal + ", emailUser=" + emailUser
				+ ", dateDeleted=" + dateDeleted + ", dateDeletedDiff=" + dateDeletedDiff + "]";
	}

	
	
	
}
