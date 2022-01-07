package pack_BBS;

public class BoardBean {
	
	private int num;	
	private String uIdb;
	private String qna_title;
	private String qna_content;
	private int pos;
	private int ref;
	private int depth;
	private String regDate;
	private String uPw;
	private int count;
	private String fileName;
	private int fileSize;
	
	

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getuIdb() {
		return uIdb;
	}
	public void setuIdb(String uIdb) {
		this.uIdb = uIdb;
	}
	public String getQna_title() {
		return qna_title;
	
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
		System.out.println("title");
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
		System.out.println("content");
	}
	public int getPos() {
		return pos;
	}
	public void setPos(int pos) {
		this.pos = pos;
		System.out.println("pos");
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
		System.out.println("ref");
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
		System.out.println("depth");
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
		System.out.println("regDate");
	}
	public String getuPw() {
		return uPw;
	}
	public void setuPw(String uPw) {
		this.uPw = uPw;
		System.out.println("uPw");
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
		System.out.println("count");
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
		System.out.println("filename");
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
		System.out.println("filesize");
	}

}