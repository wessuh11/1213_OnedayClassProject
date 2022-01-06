package pack_Member;

public class MemberBean {

	private String uId;
	private String uPw;
	private String uName;
	private String uPhone;
	private String uZip;
	private String uAddr1;
	private String uAddr2;
	private String uEmail;
		
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
		System.out.println("id");
	}
	public String getuPw() {
		return uPw;
	}
	public void setuPw(String uPw) {
		this.uPw = uPw;
		System.out.println("pw");
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
		System.out.println("번호");
	}
	
	public String getuZip() {
		return uZip;
	}
	public void setuZip(String uZip) {
		this.uZip = uZip;
	}
	public String getuAddr1() {
		return uAddr1;
	}
	public void setuAddr1(String uAddr1) {
		this.uAddr1 = uAddr1;
	}
	public String getuAddr2() {
		return uAddr2;
	}
	public void setuAddr2(String uAddr2) {
		this.uAddr2 = uAddr2;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
		System.out.println("이메일");
	}
	
}
