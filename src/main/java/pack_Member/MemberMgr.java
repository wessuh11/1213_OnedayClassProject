package pack_Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class MemberMgr {

	private DBConnectionMgr pool;

	public MemberMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

///////////////////////////////////////////////////////////////////	
/////////////   Member.jsp ID  중복확인 시작 /////////////////////
///////////////////////////////////////////////////////////////////

	public boolean checkId(String uId) {

		Connection objConn = null;
		PreparedStatement objPstmt = null;
		ResultSet objRs = null;

		String sql = null;
		boolean flag = false;

		try {
			objConn = pool.getConnection();
			sql = "select uId from memberlist where uId=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uId);

			flag = objPstmt.executeQuery().next();

		} catch (Exception e) {

			System.out.println("SQL 이슈 : " + e.getMessage());

		} finally {
			pool.freeConnection(objConn, objPstmt, objRs);
		}

		return flag;
	}
///////////////////////////////////////////////////////////////////	
/////////////   Member.jsp ID  중복확인 끝 /////////////////////
///////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////	
///////////// ZipCheck.jsp 우편번호 검색 시작 ////////////////////
///////////////////////////////////////////////////////////////////
	/*
	public Vector<ZipCodeBean> zipCodeRead(String area3) {

		Vector<ZipCodeBean> vList = new Vector<>();

		Connection objConn = null;
		PreparedStatement objPstmt = null;
		ResultSet objRs = null;

		String sql = null;

		try {
			objConn = pool.getConnection();
			sql = "select * from tblZipCode where area3 like ?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, "%" + area3 + "%");

			objRs = objPstmt.executeQuery();

			if (objRs != null) {
				while (objRs.next()) {

					ZipCodeBean zipBean = new ZipCodeBean();

					zipBean.setZipCode(objRs.getString("zipCode"));
					zipBean.setArea1(objRs.getString("area1"));
					zipBean.setArea2(objRs.getString("area2"));
					zipBean.setArea3(objRs.getString("area3"));
					zipBean.setArea4(objRs.getString("area4"));

					vList.add(zipBean);

				}
			}

		} catch (Exception e) {

			System.out.println("SQL 이슈 : " + e.getMessage());

		} finally {
			pool.freeConnection(objConn, objPstmt, objRs);
		}

		return vList;
	}
	*/
///////////////////////////////////////////////////////////////////	
///////////// ZipCheck.jsp 우편번호 검색 끝 //////////////////////
///////////////////////////////////////////////////////////////////	

///////////////////////////////////////////////////////////////////	
///////////// MemberProc.jsp 회원가입 시작 //////////////////////
///////////////////////////////////////////////////////////////////
	public boolean insertMember(MemberBean bean) {

		Connection objConn = null;
		PreparedStatement objPstmt = null;
		String sql = null;
		boolean flag = false;

		try {
			objConn = pool.getConnection();
			sql = "insert into memberlist ";
			sql += "(uId, uPw, uName, uPhone, ";
			sql += "address1, address2, address3, ";
			sql += "uEmail, m_Grade, store_Name, m_Sns) ";
			sql += "values ";
			sql += "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, bean.getuId());
			objPstmt.setString(2, bean.getuPw());
			objPstmt.setString(3, bean.getuName());
			objPstmt.setString(4, bean.getuPhone());

			objPstmt.setString(5, bean.getAddress1());
			objPstmt.setString(6, bean.getAddress2());
			objPstmt.setString(7, bean.getAddress3());
			objPstmt.setString(8, bean.getuEmail());
			objPstmt.setInt(9, bean.getM_Grade());
			objPstmt.setString(10, bean.getStore_Name());
			objPstmt.setString(11, bean.getM_Sns());
			
			int cnt = objPstmt.executeUpdate();
			if (cnt > 0)
				flag = true; // insert가 정상실행되었음을 의미

		} catch (Exception e) {

			System.out.println("SQL 이슈 : " + e.getMessage());

		} finally {
			pool.freeConnection(objConn, objPstmt);
		}

		return flag;
	}

///////////////////////////////////////////////////////////////////	
///////////// MemberProc.jsp 회원가입 끝 //////////////////////
///////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////	
///////////// LoginProc.jsp 로그인 시작 //////////////////////
///////////////////////////////////////////////////////////////////

	public boolean loginMember(String uId, String uPw) {

		Connection objConn = null;
		PreparedStatement objPstmt = null;
		ResultSet objRs = null;

		String sql = null;
		boolean flag = false;

		try {
			objConn = pool.getConnection();
			sql = "select uId from memberlist where uId=? and uPw=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uId);
			objPstmt.setString(2, uPw);

			flag = objPstmt.executeQuery().next();

		} catch (Exception e) {

			System.out.println("SQL 이슈 : " + e.getMessage());

		} finally {
			pool.freeConnection(objConn, objPstmt, objRs);
		}

		return flag;
	}
///////////////////////////////////////////////////////////////////	
///////////// LoginProc.jsp 로그인 끝 //////////////////////
///////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////	
/////// Member_Mod.jsp 회원정보 수정 입력폼 시작 /////////////
///////////////////////////////////////////////////////////////////

	public Vector modifyMember(String uId) {

		Vector<MemberBean> vList = new Vector<>();

		Connection objConn = null;
		PreparedStatement objPstmt = null;
		ResultSet objRs = null;

		String sql = null;

		try {
			objConn = pool.getConnection();
			sql = "select * from memberlist where uId=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uId);

			objRs = objPstmt.executeQuery();

			if (objRs != null) {
				while (objRs.next()) {

					MemberBean memBean = new MemberBean();

					memBean.setuId(objRs.getString("uId"));
					memBean.setuPw(objRs.getString("uPw"));
					memBean.setuName(objRs.getString("uName"));
					memBean.setuPhone(objRs.getString("uPhone"));
					memBean.setAddress1(objRs.getString("address1"));
					memBean.setAddress2(objRs.getString("address2"));
					memBean.setAddress3(objRs.getString("address3"));
					memBean.setuEmail(objRs.getString("uEmail"));
					memBean.setM_Grade(objRs.getInt("m_Grade"));
					memBean.setStore_Name(objRs.getString("store_Name"));
					memBean.setM_Sns(objRs.getString("m_Sns"));
					
					vList.add(memBean);

				}
			}

		} catch (Exception e) {

			System.out.println("SQL 이슈 : " + e.getMessage());

		} finally {
			pool.freeConnection(objConn, objPstmt, objRs);
		}

		return vList;
	}

///////////////////////////////////////////////////////////////////	
/////// Member_Mod.jsp 회원정보 수정 입력폼 끝 /////////////
///////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////	
/////// Member_ModProc.jsp 회원정보 수정 시작 /////////////
///////////////////////////////////////////////////////////////////
	/*
	public boolean modifyMember(String uPw, String uName, String uJob, String uId) {

		Connection objConn = null;
		PreparedStatement objPstmt = null;
		String sql = null;
		boolean flag = false;

		try {
			objConn = pool.getConnection();

			sql = "update memberlist set ";
			sql += "uPw=?, uName=?, uJob=? ";
			sql += "where uId = ?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uPw);
			objPstmt.setString(2, uName);
			objPstmt.setString(3, uJob);
			objPstmt.setString(4, uId);

			int cnt = objPstmt.executeUpdate();
			if (cnt > 0)
				flag = true; // update가 정상실행되었음을 의미

		} catch (Exception e) {

			System.out.println("SQL 이슈 : " + e.getMessage());

		} finally {
			pool.freeConnection(objConn, objPstmt);
		}

		return flag;
	}
	*/
///////////////////////////////////////////////////////////////////	
/////// Member_ModProc.jsp 회원정보 수정 끝 /////////////
///////////////////////////////////////////////////////////////////

	
	
///////////////////////////////////////////////////////////////////	
////////////// Member_Del.jsp 회원탈퇴 시작 ////////////////////
///////////////////////////////////////////////////////////////////	
	public boolean deleteMember(String uId) {

		Connection objConn = null;
		PreparedStatement objPstmt = null;
		String sql = null;
		boolean flag = false;

		try {
			objConn = pool.getConnection();

			sql = "delete from memberlist where uId = ?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, uId);

			int cnt = objPstmt.executeUpdate();
			if (cnt > 0)
				flag = true; // update가 정상실행되었음을 의미

		} catch (Exception e) {

			System.out.println("SQL 이슈 : " + e.getMessage());

		} finally {
			pool.freeConnection(objConn, objPstmt);
		}

		return flag;
	}

///////////////////////////////////////////////////////////////////	
//////////////Member_Del.jsp 회원탈퇴 끝 ////////////////////
///////////////////////////////////////////////////////////////////

} // End of Class
