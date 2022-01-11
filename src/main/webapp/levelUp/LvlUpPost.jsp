<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" scope="page" />

<%
String uId = (String)session.getAttribute("idKey");
String uName = (String)session.getAttribute("nameKey");
String uLevel = (String)session.getAttribute("levelKey");
String str1 = "3";
String str2 = "2";
%>  

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>등업 페이지</title>
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
		<h1>등업 페이지</h1>
		
		<!--  HTML 템플릿(Template, Templet)  헤더 끝 -->
		
		
		<main id="main" class="post">   <!-- 본문영역 html 템플릿 시작 -->
		
			<h2>등업 작성</h2>
			
			<form name="postFrm" action="LvlUpPostProc.jsp"
			enctype="multipart/form-data" method="post" id="postFrm">
				<table>
					<tbody>
						<tr>
							<td class="req">아이디</td>  <!-- td.req 필수입력 -->
							<td>
								<%=uId%>
								<input type="hidden" name="lvlUid" id="lvlUid" value="<%=uId%>">
							</td>
						</tr>
						<tr>
							<td class="req">제목</td> <!-- td.req 필수입력 -->
							<td>
								<input type="text" name="lvlTitle"
								maxlength="50" id="lvlTitle">
							</td>
						</tr>
						<tr>
							<td class="contentTD">등업 내용</td>
							<td>
								<textarea name="lvlContent" id="lvlContent" cols="60" wrap="hard"></textarea>
							</td>
						</tr>
						<tr>
							<td class="req">상호명</td> <!-- td.req 필수입력 -->
							<td>
								<input type="text" name="lvlName"
								maxlength="50" id="lvlName">
							</td>
						</tr>
						<tr>
							<td class="req">SNS</td> <!-- td.req 필수입력 -->
							<td>
								<input type="text" name="lvlSns"
								maxlength="50" id="lvlSns">
							</td>
						</tr>
						<tr>
							<td>등업관련 파일첨부</td>
							<td>
								<span class="spanFile">
									<input type="file" name="lvlFileName"
									 id="lvlFileName">
								</span>	
							</td>
						</tr>
						<tr>
									<input type="hidden" name="contentType"
										value="HTML">									
									<input type="hidden" name="contentType"
										value="TEXT" checked>						
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2"><hr></td>							
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" id="lvlRegBtn" class="butcs">등록</button>
								<button type="reset" class="butcs">다시쓰기</button>
								<button type="button" id="lvlListBtn" class="butcs">리스트</button>
							</td>
						</tr>
					</tfoot>
				</table>
			</form>

		</main>  <!-- 본문영역 html 템플릿 끝 -->
			<footer id="footer">

            <div id="footerTop" class="flex-container">
                <nav id="footerLnbArea">
                    <ul id="footermainMenu" class="flex-container">
                        <li class="footerMainLi"><a href="#">서비스이용약관</a></li>
                        <li class="footerMainLi"></li>
                        <li class="footerMainLi"><a href="#">개인정보처리방침</a></li>
                        <li class="footerMainLi"></li>
                        <li class="footerMainLi"><a href="#">이메일무단수집거부</a></li>
                        <li class="footerMainLi"></li>
                        <li class="footerMainLi"><a href="#">인터넷증명발급</a></li>
                    </ul>
                </nav>
                <!-- nav#footerLnbArea -->
            </div>
            <!-- div#footerTop 회사 관련 정보 영역 -->

            <div id="footerBottom" class="flex-container">
                <nav id="footerArea">
                    <ul id="footerBtm" class="flex-container">
                        <li class="footerBtmLi"><a href="#">주소</a></li>
                        <li class="footerBtmLi"><a href="#">대표</a></li>
                        <li class="footerBtmLi"><a href="#">사업자번호</a></li>
                        <li class="footerBtmLi"><a href="#">전화번호</a></li>
                    </ul>
                </nav>
                <!-- nav#footerArea -->
            </div>

        </footer>

	</div>
	<!-- div#wrap -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/Proj_OnedayClass/script/script.js"></script>
	<script src="/Proj_OnedayClass/script/lvlUpBBS.js"></script>        
</body>
</html>