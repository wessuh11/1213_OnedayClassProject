<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<jsp:useBean id="bMgr" class="pack_reviewBBS.RvBoardMgr"  scope="page" />
<jsp:useBean id="LikeBean" class="pack_reviewBBS.RvLikeBean"  scope="page" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<body>
<%

String uId = (String)session.getAttribute("idKey");
int rNum = Integer.parseInt(request.getParameter("rNum"));
//String uId = request.getParameter("uId");

%>
<h2><%=rNum %><%=uId %></h2>

<%
LikeBean.setuId(uId);
LikeBean.setrNum(rNum);
int result = bMgr.UpdateLike(LikeBean);
if(result == 0){
%>
		<script>
			alert("이미 추천함");
			history.back();
		</script>
<%	
}
else{
	
	%>
	<script>
			alert("추천성공"); 
			//location.href = history.back(-1);
			<%
			
			bMgr.InsertLikeCnt(rNum);
			
			%>
			
			//location.href="RvList.jsp";
			history.back();
		</script>
	<%
}

%>
</body>
</html>