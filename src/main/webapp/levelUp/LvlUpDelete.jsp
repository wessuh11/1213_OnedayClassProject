<%@page import="pack_BBS.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bMgr" class="pack_LevelUpBBS.BoardMgr" scope="page" />
<%
String nowPage = request.getParameter("nowPage");
String s = request.getParameter("lvlNum");
int numParam = Integer.parseInt(s);

//검색어 수신 시작
String keyField = request.getParameter("keyField");
String keyWord = request.getParameter("keyWord");
//검색어 수신 끝


String uId = (String)session.getAttribute("idKey");
String uName = (String)session.getAttribute("nameKey");
String uLevel = (String)session.getAttribute("levelKey");
String str1 = "3";
String str2 = "2";



/* if (request.getParameter("uPwParam") != null) {
	String uPwParam = request.getParameter("uPwParam");
	// 사용자가 현재 페이지에서 입력한 확인용 비번
	BoardBean bean = (BoardBean)session.getAttribute("bean");
	String uPw = bean.getuPw();    // DB 에 저장되어 있는 실제 비번
 	
	if (uPwParam.equals(uPw)) {  */  // 중첩 IF 시작
		int exeCnt = bMgr.deleteBoard(numParam);
	
		String url = "LvlUpList.jsp?nowPage="+nowPage;
				 url += "&keyField="+keyField;
				 url += "&keyWord="+keyWord;
%>	
		<script>
			alert("삭제되었습니다!");
			location.href = "<%=url%>";
		</script>
<%	
		//String url = "List.jsp";

%>		


 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>게시글 삭제</title>
    <link rel="stylesheet" href="/Proj_OnedayClass/style/lvlUpBBS.css">
</head>
<body>
	<div id="wrap">
		  <header id="header" class="flex-container">
            <div id="headerLogo">
                <a href="/Proj_OnedayClass/Index.jsp"><img src="/Proj_OnedayClass/img/logo.png" alt="로고"></a>
            </div>
            <!-- div#headerLogo -->
            <div id="headerRight">
                <ul class="flex-container">
    	<% if (uId != null && str1.equals(uLevel)) {  //관리자 로그인%>
                    <li><a href="/Proj_OnedayClass/sign/MyPage.jsp"><%=uName %> 관리자님 안녕하세요.</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/Logout.jsp">로그아웃</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/adminBBS/AdminPage.jsp">관리자 페이지</a></li>
		<% } else if(uId != null && str2.equals(uLevel)) { %>
	                <li><a href="/Proj_OnedayClass/sign/MyPage.jsp"><%=uName %> 선생님 환영합니다.</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/Logout.jsp">로그아웃</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/classbbs/ClassPost.jsp">클래스 생성</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/ClassList.jsp">클래스 관리</a></li>
   		<% } else if(uId != null) { %>
    	            <li><a href="/Proj_OnedayClass/sign/MyPage.jsp"><%=uName %> 님 환영합니다.</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/Logout.jsp">로그아웃</a></li>
                    <li></li>
                    <li>
                        <div id="headerCart">
                            <a href="#"><img src="img/cart.png" alt=""> <span>0</span></a>
                        </div>
                    </li>
    	<% } else { %>
					<li><a href="/Proj_OnedayClass/sign/Login.jsp">Sign In</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/Member.jsp">Sign Up</a></li>
                    <li></li>
                    <li>
                        <div id="headerCart">
                            <a href="#"><img src="img/cart.png" alt=""> <span>0</span></a>
                        </div>
                    </li>
		<%} %>
				</ul>
            </div>
            <!-- div#headerRight -->
        </header>
        <nav id="gnb">
            <ul class="flex-container">
                <li><a href="/Proj_OnedayClass/Index.jsp">Home</a></li>
                <li><a href="./about.html">About</a></li>
                <li><a href="#">Online</a></li>
                <li><a href="#">Offline</a></li>
                  <li class="active">
                <% if (uId == null) { %> 
					<a href="/Proj_OnedayClass/sign/Login.jsp" onclick="alert('로그인이 필요합니다.');">QnA</a>
				<%  } else { %> 
					<a href="/Proj_OnedayClass/bbs/List.jsp">QnA</a>
				<% } %>
                </li>
            </ul>
        </nav>
		<!--  HTML 템플릿(Template, Templet)  헤더 시작 -->
		<h1>문의글 삭제</h1>

		<!--  HTML 템플릿(Template, Templet)  헤더 끝 -->
		
		
		<main id="main" class="delete">   <!-- 본문영역 html 템플릿 시작 -->
				
			<h2>문의글 삭제페이지(비밀번호 입력)</h2>
				
			<form name="delFrm" id="delFrm">	
				<table id="delTbl">
					<tbody>
						<tr>
							<td>
								 <b>비밀번호 : </b><input type="password" name="uPwParam" id="uPw"
								   maxlength="20">
							</td>
						</tr>					
					</tbody>
					 
					<tfoot id="readTblFoot">
						<tr>
							<td id="hrTd"><hr></td>							
						</tr>
						<tr>
							<td id="btnAreaTd">
								<button type="button" id="delSbmBtn" class="butcs">삭제하기</button>
								<button type="reset" class="butcs">다시쓰기</button>
								<button type="button" id="backBtn" class="butcs">돌아가기</button>								
							</td>
						</tr>
					</tfoot>
					 
				</table>
				
				<input type="hidden" name="num" value="<%=numParam%>">
				<input type="hidden" name="nowPage" value="<%=nowPage%>">
				
				
				<!-- 검색어전송 시작 -->
				<input type="hidden" name="keyField" id="keyField" value="<%=keyField%>">
				<input type="hidden" name="keyWord" id="keyWord" value="<%=keyWord%>">
				<!-- 검색어전송 끝 -->
				
		  	</form>
			
		
		
		
		
		</main>  <!-- 본문영역 html 템플릿 끝 -->


	</div>
	<!-- div#wrap -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/Proj_OnedayClass/script/script.js"></script>
	<script src="/Proj_OnedayClass/script/lvlUpBBS.js"></script>      
</body>
</html>
 