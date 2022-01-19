package pack_Payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import pack_DBCP.DBConnectionMgr;

public class PaymentMgr {

	private DBConnectionMgr pool;
	
	public PaymentMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("DB 접속이슈1 : " + e.getMessage());
		}
	}
	
	//////////////////// 장바구니 갯수 확인 시작 ////////////////////////////
	
	public int cntCart(String uId) {

		Connection objConn = null;
		PreparedStatement objPstmt = null;
		ResultSet objRs = null;
		String sql = null;
		int totalCnt = 0;

		try {
		objConn = pool.getConnection(); // DB연동

		sql = "select count(*) from cartList where uId=?";
		objPstmt = objConn.prepareStatement(sql);
		objPstmt.setString(1, uId);
		
		objRs = objPstmt.executeQuery();

		if (objRs.next()) {
		totalCnt = objRs.getInt(1);
		}

		} catch (Exception e) {
		System.out.println("SQL이슈1 : " + e.getMessage());
		} finally {
		pool.freeConnection(objConn, objPstmt, objRs);
		}
		System.out.println(totalCnt);
		
		return totalCnt;
	}
	
	//////////////////// 장바구니 갯수 확인 끝 ////////////////////////////

	
	
	//////////////////// 장바구니 체크 시작 ////////////////////////////
	
	public boolean checkCart(CartBean bean) {

		Connection objConn = null;
		PreparedStatement objPstmt = null;
		ResultSet objRs = null;

		String sql = null;
		boolean flag = false;

		try {
			objConn = pool.getConnection();
			sql = "select cNum from cartList where uId=? AND cNum=?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, bean.getuId());
			objPstmt.setInt(2, bean.getcNum());			

			flag = objPstmt.executeQuery().next();

		} catch (Exception e) {

			System.out.println("SQL 이슈2 : " + e.getMessage());

		} finally {
			pool.freeConnection(objConn, objPstmt, objRs);
		}

		return flag;
	}
	
	//////////////////// 장바구니 체크 끝 ////////////////////////////
	
	//////////////////// 장바구니 입력 시작 ////////////////////////////
	
	public boolean insertCart(CartBean bean) {
		
		Connection objConn = null;
		PreparedStatement objPstmt = null;
		
		String sql = null;
		boolean flag = false;
		
		try {
			objConn = pool.getConnection();
			sql = "insert into cartList values (?, ?)";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, bean.getuId());
			objPstmt.setInt(2, bean.getcNum());
			
			int cnt = objPstmt.executeUpdate();
			
			if (cnt > 0)
				flag = true;

		} catch (Exception e) {

			System.out.println("SQL 이슈3 : " + e.getMessage());

		} finally {
			pool.freeConnection(objConn, objPstmt);
		}
		
		return flag;
	}
	
	////////////////////장바구니 입력 끝 ////////////////////////////
	
	//////////////////// 장바구니 입력 시작 ////////////////////////////
	
	public boolean deleteCart(CartBean bean) {
		
		Connection objConn = null;
		PreparedStatement objPstmt = null;
		
		String sql = null;
		boolean flag = false;
		
		try {
			objConn = pool.getConnection();
			sql = "delete from cartList where uId = ? AND cNum = ?";
			objPstmt = objConn.prepareStatement(sql);
			objPstmt.setString(1, bean.getuId());
			objPstmt.setInt(2, bean.getcNum());
			
			int cnt = objPstmt.executeUpdate();
			
			if (cnt > 0)
				flag = true;

		} catch (Exception e) {

			System.out.println("SQL 이슈4 : " + e.getMessage());

		} finally {
			pool.freeConnection(objConn, objPstmt);
		}
		
		return flag;
	}
	
	////////////////////장바구니 입력 끝 ////////////////////////////
}
