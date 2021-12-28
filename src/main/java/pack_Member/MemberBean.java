package pack_Member;

public class MemberBean {

	private String uId;
	private String uPw;
	private String uName;
	private String uPhone;
	private String uAddress1;
	private String uAddress2;
	private String uAddress3;
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
	public String getuAddress1() {
		return uAddress1;
	}
	public void setuAddress1(String uAddress1) {
		this.uAddress1 = uAddress1;
		System.out.println("주소1");
	}
	public String getuAddress2() {
		return uAddress2;
	}
	public void setuAddress2(String uAddress2) {
		this.uAddress2 = uAddress2;
		System.out.println("주소2");
	}
	public String getuAddress3() {
		return uAddress3;
	}
	public void setuAddress3(String uAddress3) {
		this.uAddress3 = uAddress3;
		System.out.println("주소3");
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
		System.out.println("이메일");
	}
	
}
