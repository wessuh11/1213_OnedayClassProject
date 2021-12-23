<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
String uPw = request.getParameter("uPw");
String uName = request.getParameter("uName");
String uPhone = request.getParameter("uPhone");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String address3 = request.getParameter("address3");
String uEmail = request.getParameter("uEmail");
String store_Name = request.getParameter("store_Name");
String m_Sns = request.getParameter("m_Sns");
%>   

<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" scope="page" />
<%
String sessionUId = (String)session.getAttribute("idKey");
boolean res = mMgr.modifyMember(uPw, uName, uPhone, address1, address2,address3, uEmail, store_Name, m_Sns, sessionUId);
%>

<script>
<% if (res) { %>
	alert("회원정보 수정완료!");
	location.href = "Member_Mod.jsp";
<% } else { %>
    let msg = "회원정보 수정중에 오류가 발생하였습니다. 다시 시도해주십시오.\n";
         msg += "만일 오류가 계속된다면 관리자에게 연락부탁드립니다.";
	alert(msg);
	history.back();	
<% } %> 
</script>