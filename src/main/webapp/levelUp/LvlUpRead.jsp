<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../error/ErrorProc.jsp"%>
    
<%@ page import="pack_LevelUpBBS.BoardBean" %>
<jsp:useBean id="bMgr" class="pack_LevelUpBBS.BoardMgr"  scope="page" />
<%
request.setCharacterEncoding("UTF-8");

int lvlNumParam = Integer.parseInt(request.getParameter("lvlNum"));

// 검색어 수신 시작
String keyField = request.getParameter("keyField");
String keyWord = request.getParameter("keyWord");
// 검색어 수신 끝

// 현재 페이지 돌아가기 소스 시작s
String nowPage = request.getParameter("nowPage");
// 현재 페이지 돌아가기 소스 끝

BoardBean bean = bMgr.getBoard(lvlNumParam);   
     //  List.jsp에서 클릭한 게시글의 매개변수로 전달된 글번호의 데이터 가져오기
     
int lvlNum =  bean.getLvlNum();
String lvlUid	=	bean.getLvlUid();
String lvlTitle	= bean.getLvlTitle();
String lvlContent = bean.getLvlContent();
String lvlName = bean.getLvlName();
String lvlSns = bean.getLvlSns();
//content.replace("cr", "<br>");

String lvlRegDate	= bean.getLvlRegDate();
int lvlPos	= bean.getLvlPos();
int lvlRef	= bean.getLvlRef();
int lvlDepth	= bean.getLvlDepth();
String lvlFileName	= bean.getLvlFileName();
double lvlFileSize 	= bean.getLvlFileSize();
String fUnit = "Bytes";
if(lvlFileSize > 1024) {
	lvlFileSize /= 1024;	
	fUnit = "KBytes";
} 

session.setAttribute("bean", bean);
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
	<title>글내용 보기</title>
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
		<h1><%=lvlUid %> 등업 문의</h1>

		<!--  HTML 템플릿(Template, Templet)  헤더 끝 -->
		
		
		<main id="main" class="read">   <!-- 본문영역 html 템플릿 시작 -->
			<!--  뷰페이지 내용 출력 시작 -->
		
			<h2><%=lvlTitle %></h2>
				
			<table id="readTbl">
				<tbody id="readTblBody">
					<tr>
						<td>작성자</td>  <!-- td.req 필수입력 -->
						<td><%=lvlUid %></td>
						<td>등록일</td>  <!-- td.req 필수입력 -->
						<td><%=lvlRegDate %></td>
					</tr>
					<tr>
						<td>상호명</td>  <!-- td.req 필수입력 -->
						<td><%=lvlName %></td>
						<td>SNS</td>  <!-- td.req 필수입력 -->
						<td><%=lvlSns %></td>
					</tr>
					<tr>
						<td>첨부파일</td> <!-- td.req 필수입력 -->
						<td colspan="3">
							<input type="hidden" name="lvlFileName" value="<%=lvlFileName%>" 
										id="hiddenFname">
						<% if (lvlFileName != null && !lvlFileName.equals("")) { %>						
							<span id="downloadFile"><%=lvlFileName %></span>							
							(<span><%=(int)lvlFileSize + " " + fUnit%></span>)
						<% } else { %>
							등록된 파일이 없습니다.
						<% } %>
						</td>
					</tr>
					<tr>
						<td colspan="4" id="readContentTd"><pre><%=lvlContent %></pre></td>
					</tr>					
				</tbody>
				 
				<tfoot id="readTblFoot">	
					<tr>
						<td colspan="4" id="footTopSpace"></td>							
					</tr>			     
					<tr>
						<td colspan="4" id="hrTd"><hr></td>							
					</tr>
					<tr>
						<%
						String listBtnLabel = "";
						if(keyWord.equals("null") || keyWord.equals("")) {
							listBtnLabel = "리스트";
						} else {
							listBtnLabel = "검색목록";
						}
						%>
							<td colspan="4" id="btnAreaTd" class="read">
							<button type="button" id="lvlListBtn" class="butcs"><%=listBtnLabel %></button>
							<%if (str1.equals(uLevel)){%>
							<button type="button" id="replyBtn" class="butcs">답 변</button>
							<%} else {%>
							<button type="button" id="lvlModBtn" class="butcs">수 정</button>
							<%} %>
							<button type="button" id="delBtn" class="butcs">삭 제</button>
						</td>
					</tr>
				</tfoot>
				 
			</table>
			<input type="hidden" name="nowPage" value="<%=nowPage%>" id="nowPage">
			<input type="hidden" name="lvlNum" value="<%=lvlNum%>" id="lvlNum">
			
			<!-- 검색어전송 시작 -->
			<input type="hidden" id="pKeyField" value="<%=keyField%>">
			<input type="hidden" id="pKeyWord" value="<%=keyWord%>">
			<!-- 검색어전송 끝 -->
		  
			
		
			<!--  뷰페이지 내용 출력 끝 -->
		</main>  <!-- 본문영역 html 템플릿 끝 -->


	</div>
	<!-- div#wrap -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/Proj_OnedayClass/script/script.js"></script>    
	<script src="/Proj_OnedayClass/script/lvlUpBBS.js"></script>    
</body>
</html>