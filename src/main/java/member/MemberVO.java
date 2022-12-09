package member;

public class MemberVO {
	private String idxUser;
	private String email;
	private String password;
	private int authority;
	private String dateCreated;
	private String dateDeleted;
	private String dateVisited;
	private String lastUpdatedIp;
	private int enabled;
	
	private String nameUser;
	private String birthYear;
	private String phoneNo;
	private String gender;
	private String job;
	private String address;
	
	private int dateDeletedDiff;

	public String getIdxUser() {
		return idxUser;
	}

	public void setIdxUser(String idxUser) {
		this.idxUser = idxUser;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}

	public String getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getDateDeleted() {
		return dateDeleted;
	}

	public void setDateDeleted(String dateDeleted) {
		this.dateDeleted = dateDeleted;
	}

	public String getDateVisited() {
		return dateVisited;
	}

	public void setDateVisited(String dateVisited) {
		this.dateVisited = dateVisited;
	}

	public String getLastUpdatedIp() {
		return lastUpdatedIp;
	}

	public void setLastUpdatedIp(String lastUpdatedIp) {
		this.lastUpdatedIp = lastUpdatedIp;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getNameUser() {
		return nameUser;
	}

	public void setNameUser(String nameUser) {
		this.nameUser = nameUser;
	}

	public String getBirthYear() {
		return birthYear;
	}

	public void setBirthYear(String birthYear) {
		this.birthYear = birthYear;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getDateDeletedDiff() {
		return dateDeletedDiff;
	}

	public void setDateDeletedDiff(int dateDeletedDiff) {
		this.dateDeletedDiff = dateDeletedDiff;
	}

	@Override
	public String toString() {
		return "MemberVO [idxUser=" + idxUser + ", email=" + email + ", password=" + password + ", authority="
				+ authority + ", dateCreated=" + dateCreated + ", dateDeleted=" + dateDeleted + ", dateVisited="
				+ dateVisited + ", lastUpdatedIp=" + lastUpdatedIp + ", enabled=" + enabled + ", nameUser=" + nameUser
				+ ", birthYear=" + birthYear + ", phoneNo=" + phoneNo + ", gender=" + gender + ", job=" + job
				+ ", address=" + address + ", dateDeletedDiff=" + dateDeletedDiff + "]";
	}

	
	
	
}
