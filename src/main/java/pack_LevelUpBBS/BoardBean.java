package pack_LevelUpBBS;

public class BoardBean {
	
	private int lvlNum;	
	private String lvlUid;
	private String lvlTitle;
	private String lvlContent;
	private String lvlName;
	private String lvlSns;
	private String lvlRegDate;
	private int lvlPos;
	private int lvlRef;
	private int lvlDepth;
	private String lvlFileName;
	private int lvlFileSize;
	
	public int getLvlNum() {
		return lvlNum;
	}
	public void setLvlNum(int lvlNum) {
		this.lvlNum = lvlNum;
		System.out.println("num");
	}
	
	public String getLvlUid() {
		return lvlUid;
	}
	public void setLvlUid(String lvlUid) {
		this.lvlUid = lvlUid;
		System.out.println("uid");
	}
	public String getLvlTitle() {
		return lvlTitle;
	}
	public void setLvlTitle(String lvlTitle) {
		this.lvlTitle = lvlTitle;
		System.out.println("title");
	}
	public String getLvlContent() {
		return lvlContent;
	}
	public void setLvlContent(String lvlContent) {
		this.lvlContent = lvlContent;
		System.out.println("con");
	}
	public String getLvlName() {
		return lvlName;
	}
	public void setLvlName(String lvlName) {
		this.lvlName = lvlName;
		System.out.println("상호명");
	}
	public String getLvlSns() {
		return lvlSns;
	}
	public void setLvlSns(String lvlSns) {
		this.lvlSns = lvlSns;
		System.out.println("sns");
	}
	public String getLvlRegDate() {
		return lvlRegDate;
	}
	public void setLvlRegDate(String lvlRegDate) {
		this.lvlRegDate = lvlRegDate;
		System.out.println("레그");
	}
	public int getLvlPos() {
		return lvlPos;
	}
	public void setLvlPos(int lvlPos) {
		this.lvlPos = lvlPos;
		System.out.println("pos");
	}
	public int getLvlRef() {
		return lvlRef;
	}
	public void setLvlRef(int lvlRef) {
		this.lvlRef = lvlRef;
		System.out.println("ref");
	}
	public int getLvlDepth() {
		return lvlDepth;
	}
	public void setLvlDepth(int lvlDepth) {
		this.lvlDepth = lvlDepth;
		System.out.println("depth");
	}
	public String getLvlFileName() {
		return lvlFileName;
	}
	public void setLvlFileName(String lvlFileName) {
		this.lvlFileName = lvlFileName;
		System.out.println("파일넘버");
	}
	public int getLvlFileSize() {
		return lvlFileSize;
	}
	public void setLvlFileSize(int lvlFileSize) {
		this.lvlFileSize = lvlFileSize;
		System.out.println("파일사이즈");
	}
	public int getLvlStatus() {
		return lvlStatus;
	}
	public void setLvlStatus(int lvlStatus) {
		this.lvlStatus = lvlStatus;
		System.out.println("공개여부");
		
	}
	private int lvlStatus;
	
	

}