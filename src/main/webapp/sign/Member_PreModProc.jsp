<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" scope="page" />

<%
request.setCharacterEncoding("UTF-8");
String uId = request.getParameter("uId");
String uPw = request.getParameter("uPw");

boolean res = mMgr.loginMember(uId, uPw);

if (res) {
    //msg = "로그인에 성공 하였습니다.";
    response.sendRedirect("/Proj_OnedayClass/sign/Member_Mod.jsp");
} else {
%>

<script>
alert("비밀번호를 확인해주세요.");
history.back();
</script>

<% } %>