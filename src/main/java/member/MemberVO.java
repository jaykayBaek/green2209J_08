package member;

public class MemberVO {
	private int idx;
	private String email;
	private String password;
	private String dateCreated;
	private String dateVisited;
	private String lastUpdatedIp;
	private String nameUser;
	private String address;
	private String birthYear;
	private String phoneNo;
	private String gender;
	private String job;
	
	private String grade;
	private String point;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
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
	public String getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
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
	public String getNameUser() {
		return nameUser;
	}
	public void setNameUser(String nameUser) {
		this.nameUser = nameUser;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", email=" + email + ", password=" + password + ", dateCreated=" + dateCreated
				+ ", dateVisited=" + dateVisited + ", lastUpdatedIp=" + lastUpdatedIp + ", nameUser=" + nameUser
				+ ", address=" + address + ", birthYear=" + birthYear + ", phoneNo=" + phoneNo + ", gender=" + gender
				+ ", job=" + job + ", grade=" + grade + ", point=" + point + "]";
	}
	
	 
	
	
}