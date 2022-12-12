package book;

public class AuthorProfileVO {
	private int idx;
	private String nameAuthor;
	private String role;
	private String nationality;
	private String birthday;
	private String awards;
	private String education;
	private String introduceText;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getNameAuthor() {
		return nameAuthor;
	}
	public void setNameAuthor(String nameAuthor) {
		this.nameAuthor = nameAuthor;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getAwards() {
		return awards;
	}
	public void setAwards(String awards) {
		this.awards = awards;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getIntroduceText() {
		return introduceText;
	}
	public void setIntroduceText(String introduceText) {
		this.introduceText = introduceText;
	}
	@Override
	public String toString() {
		return "AuthorProfileVO [idx=" + idx + ", nameAuthor=" + nameAuthor + ", role=" + role + ", nationality="
				+ nationality + ", birthday=" + birthday + ", awards=" + awards + ", education=" + education
				+ ", introduceText=" + introduceText + "]";
	}
	
	
}
