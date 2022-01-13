<%@page import="pack_LevelUpBBS.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %> 
<% request.setCharacterEncoding("UTF-8"); %>

<%
//검색어 수신 시작
String nowPage = request.getParameter("nowPage");
String keyField = request.getParameter("keyField");
String keyWord = request.getParameter("keyWord");
//검색어 수신 끝

String lvlUid = request.getParameter("lvlUid");
%>

<jsp:useBean id="bMgr" class="pack_LevelUpBBS.BoardMgr" scope="page" />

<%	
boolean res = bMgr.AcBoard(lvlUid);
%>
	
<script>
	alert("승인 완료");
	location.href = "/Proj_OnedayClass/levelUp/LvlUpList.jsp";
</script>