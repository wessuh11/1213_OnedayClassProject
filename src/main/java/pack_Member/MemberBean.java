package pack_Member;

public class MemberBean {

	private String uId; //아이디
	private String uPw; //비밀번호
	private String uName; //이름
	private String uPhone; //핸펀
	private String address1; //주소1
	private String address2; //주소2
	private String address3; //주소3
	private String uEmail; //유저이메일
	private int m_Grade; //등급
	private String store_Name; //상호명
	private String m_Sns; //모바일 sns
	
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPw() {
		return uPw;
	}
	public void setuPw(String uPw) {
		this.uPw = uPw;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
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
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public int getM_Grade() {
		return m_Grade;
	}
	public void setM_Grade(int m_Grade) {
		this.m_Grade = m_Grade;
	}
	public String getStore_Name() {
		return store_Name;
	}
	public void setStore_Name(String store_Name) {
		this.store_Name = store_Name;
	}
	public String getM_Sns() {
		return m_Sns;
	}
	public void setM_Sns(String m_Sns) {
		this.m_Sns = m_Sns;
	}
}
