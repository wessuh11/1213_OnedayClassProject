<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="pack_LevelUpBBS.*"%>
    
<%
request.setCharacterEncoding("UTF-8");

int lvlNum = Integer.parseInt(request.getParameter("lvlNum"));
String nowPage = request.getParameter("nowPage");

//검색어 수신 시작
String keyField = request.getParameter("keyField");
String keyWord = request.getParameter("keyWord");
//검색어 수신 끝

BoardBean bean = (BoardBean)session.getAttribute("bean");
String lvlTitle = bean.getLvlTitle();
String lvlUid = bean.getLvlUid();
String lvlContent = bean.getLvlContent();
String lvlName = bean.getLvlName();
String lvlSns = bean.getLvlSns();

String uId = (String)session.getAttribute("idKey");
String str1 = "3";
String str2 = "2";
%>    
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>게시글 수정페이지</title>
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
		<h1>수정페이지</h1>
		<!--  HTML 템플릿(Template, Templet)  헤더 끝 -->
		
		
		<main id="main" class="mod">   <!-- 본문영역 html 템플릿 시작 -->
			<!--  뷰페이지 내용 출력 시작 -->
			
			
			<form name="updateFrm" action="LvlUpdateProc.jsp"
					method="get" id="updateFrm">
		
				<h2><%=lvlTitle%></h2>
					
				<table id="modTbl">
					<tbody id="modTblBody">
						<tr>
							<td class="req">작성자</td>
							<td>
								<%=lvlUid%>
								<input type="hidden" name="lvlUid" id="lvlUid" value="<%=lvlUid%>">
							</td>
						</tr>
						<tr>
							<td class="req">제목</td>
							<td>
								<input type="text" name="lvlTitle" value="<%=lvlTitle%>"
									size="50" id="lvlTitle">
							</td>
						</tr>
						<tr>
							<td class="req">상호명</td>
							<td>
								<input type="text" name="lvlName" value="<%=lvlName%>"
									size="50" id="lvlName">
							</td>
						</tr>
						<tr>
							<td class="req">SNS</td>
							<td>
								<input type="text" name="lvlSns" value="<%=lvlSns%>"
									size="50" id="lvlSns">
							</td>
						</tr>
						<tr>
							<td style="vertical-align: top;">내용</td>
							<td>
								<textarea name="lvlContent" id="txtArea"  cols="89" wrap="hard"><%=lvlContent %></textarea>
							</td>
						</tr>
					</tbody>
					 
					<tfoot>	
						<tr>
							<td colspan="2" id="footTopSpace"></td>							
						</tr>	
						<tr>
							<td colspan="2" id="hrTd"><hr></td>							
						</tr>
						<tr>
							<td colspan="2" id="btnAreaTd" class="update">
								<button type="button" id="lvlModBtn" class="butcs">수정하기</button>
								<button type="reset" class="butcs">다시쓰기</button>
								<button type="button" id="backBtn" class="butcs">뒤 로</button>							
							</td>
						</tr>
					</tfoot>
					 
				</table>
				<input type="hidden" name="nowPage" value="<%=nowPage%>" id="nowPage">
				<input type="hidden" name="lvlNum" value="<%=lvlNum%>" id="lvlNum">
				
				<!-- 검색어전송 시작 -->
				<input type="hidden" name="keyField" id="keyField" value="<%=keyField%>">
				<input type="hidden" name="keyWord" id="keyWord" value="<%=keyWord%>">
				<!-- 검색어전송 끝 -->
		
			</form>
			<!--  뷰페이지 내용 출력 끝 -->
			
			
		</main>  <!-- 본문영역 html 템플릿 끝 -->


	</div>
	<!-- div#wrap -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/Proj_OnedayClass/script/script.js"></script>
	<script src="/Proj_OnedayClass/script/lvlUpBBS.js"></script>    
</body>
</html>