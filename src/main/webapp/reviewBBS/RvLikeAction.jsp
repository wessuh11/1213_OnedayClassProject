<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><jsp:useBean id="bMgr" class="pack_reviewBBS.RvBoardMgr"  scope="page" /><jsp:useBean id="LikeBean" class="pack_reviewBBS.RvLikeBean"  scope="page" /><%String uId = (String)session.getAttribute("idKey");int rNum = Integer.parseInt(request.getParameter("rNum"));LikeBean.setuId(uId);LikeBean.setrNum(rNum);int result = bMgr.UpdateLike(LikeBean);if(result == 0){%>이미 추천함<%	}else{%>추천 성공<%bMgr.InsertLikeCnt(rNum);}%>