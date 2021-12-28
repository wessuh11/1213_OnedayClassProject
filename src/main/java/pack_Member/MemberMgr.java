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
	public Vector<MemberBean> zipCodeRead(String address3) {

		Vector<MemberBean> vList = new Vector<>();

		Connection objConn = null;
		PreparedStatement objPstmt = null;
		ResultSet objRs = null;

		String sql = null;

		try {
			objConn = pool.getConnection();
			sql = "select * from memberlist where address3 like ?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, "%" + address3 + "%");

			objRs = objPstmt.executeQuery();

			if (objRs != null) {
				while (objRs.next()) {

					MemberBean zipBean = new MemberBean();

					zipBean.setAddress1(objRs.getString("address1"));
					zipBean.setAddress2(objRs.getString("address2"));
					zipBean.setAddress3(objRs.getString("address3"));
			

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
			sql += "uEmail, m_grade, store_Name, m_sns ) ";
			sql += "values ";
			sql += "(?, ?, ?, ?, ?, ?, ?, ?, 0, null, null)";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, bean.getuId());
			objPstmt.setString(2, bean.getuPw());
			objPstmt.setString(3, bean.getuName());
			objPstmt.setString(4, bean.getuPhone());
			objPstmt.setString(5, bean.getAddress1());
			objPstmt.setString(6, bean.getAddress2());
			objPstmt.setString(7, bean.getAddress3());
			objPstmt.setString(8, bean.getuEmail());
		//	objPstmt.setInt(9, bean.getM_grade());
		//	objPstmt.setString(10, bean.getStore_Name());
		//	objPstmt.setString(11, bean.getM_sns());
			
		
		
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
}
///////////////////////////////////////////////////////////////////	
///////////// LoginProc.jsp 로그인 끝 //////////////////////
///////////////////////////////////////////////////////////////////

