package pack_Member;

public class MemberBean {
	
	private String uId;
	private String uPw;
	private String uName;
	private String uPhone;
	private String address1;
	private String address2;
	private String address3;
	private String uEmail;

	
	
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
		System.out.println("아이디");
	}
	public String getuPw() {
		return uPw;
	}
	public void setuPw(String uPw) {
		this.uPw = uPw;
		System.out.println("비번");
	}
	public String getuName() {
		return uName;
	
	}
	public void setuName(String uName) {
		this.uName = uName;
		System.out.println("이름");
	}
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
		System.out.println("휴대폰");
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
		System.out.println("우편번호");
	}
	public String getAddress2() {
		return address2;
	
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
		System.out.println("주소");
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
		System.out.println("상세주소");
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
		System.out.println("이메일");
	}
	

}
