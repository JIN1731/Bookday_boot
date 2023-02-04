package kh.bookday.dto;

import java.sql.Timestamp;

public class MemberDTO {

	private String id;
	private String phone;
	private String pw;
	private String name;
	private String nickname;
	private String email;
	private String postcode;
	private String address1;
	private String address2;
	private String reciver;
	private String reciver_phone;
	private Timestamp signup_date;
	private String oriprofname;
	private String sysprofname;
	private String grade;

	
	public MemberDTO() {
		super();
	}
	
	public MemberDTO(String id, String phone, String pw, String name, String nickname, String email, String postcode,
			String address1, String address2, String reciver, String reciver_phone, Timestamp signup_date, String oriprofname, String sysprofname, String grade) {
		this.id = id;
		this.phone = phone;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.postcode = postcode;
		this.address1 = address1;
		this.address2 = address2;
		this.reciver = reciver;
		this.reciver_phone = reciver_phone;
		this.signup_date = signup_date;
		this.oriprofname = oriprofname;
		this.sysprofname = sysprofname;
		this.grade = grade;
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getReciver() {
		return reciver;
	}
	public void setReciver(String reciver) {
		this.reciver = reciver;
	}
	public String getReciver_phone() {
		return reciver_phone;
	}
	public void setReciver_phone(String reciver_phone) {
		this.reciver_phone = reciver_phone;
	}
	public long getSignup_date() {
		long currentTime = System.currentTimeMillis();
		long signupTime = this.signup_date.getTime();
		
		long timeGap = (currentTime - signupTime)/1000; // 초 차이
		long dateGap = timeGap/86400+1;
		
		return dateGap;		
	}
	public void setSignup_date(Timestamp signup_date) {
		this.signup_date = signup_date;
	}
	public String getOriprofname() {
		return oriprofname;
	}
	public void setOriprofname(String oriprofname) {
		this.oriprofname = oriprofname;
	}
	public String getSysprofname() {
		return sysprofname;
	}
	public void setSysprofname(String sysprofname) {
		this.sysprofname = sysprofname;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}

	
//	public long getDateGap(Timestamp signup_date) {
//		long currentTime = System.currentTimeMillis();
//		long signupTime = this.signup_date.getTime();
//		
//		long timeGap = (currentTime - signupTime)/1000; // 초 차이
//		long dateGap = timeGap/86400;
//		
//		return dateGap;	
//	}
}
