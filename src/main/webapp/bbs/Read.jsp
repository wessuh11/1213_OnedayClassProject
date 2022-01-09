<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../error/ErrorProc.jsp"%>
    
<%@ page import="pack_BBS.BoardBean" %>
<jsp:useBean id="bMgr" class="pack_BBS.BoardMgr"  scope="page" />
<%
request.setCharacterEncoding("UTF-8");

int numParam = Integer.parseInt(request.getParameter("num"));

// 검색어 수신 시작
String keyField = request.getParameter("keyField");
String keyWord = request.getParameter("keyWord");
// 검색어 수신 끝

// 현재 페이지 돌아가기 소스 시작
String nowPage = request.getParameter("nowPage");
// 현재 페이지 돌아가기 소스 끝

bMgr.upCount(numParam);    // 조회수 증가
BoardBean bean = bMgr.getBoard(numParam);   
     //  List.jsp에서 클릭한 게시글의 매개변수로 전달된 글번호의 데이터 가져오기
     
int num =  bean.getNum();
String uIdb	=	bean.getuIdb();
String Qna_title	= bean.getQna_title();
String Qna_content	= bean.getQna_content();
//content.replace("cr", "<br>");

int pos	= bean.getPos();
int ref	= bean.getRef();
int depth	= bean.getDepth();
String regDate	= bean.getRegDate();
String uPw	= bean.getuPw();
int count 	= bean.getCount();
String fileName	= bean.getFileName();
double fileSize 	= bean.getFileSize();
String fUnit = "Bytes";
if(fileSize > 1024) {
	fileSize /= 1024;	
	fUnit = "KBytes";
} 


session.setAttribute("bean", bean);
String uId = (String)session.getAttribute("idKey");
%>   	
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>글내용 보기</title>
    <link rel="stylesheet" href="/Proj_OnedayClass/style/bbs.css">
</head>
<body>
	<div id="wrap">
		  <div id="wrap">
		  <% if (uId != null) {   // 현재 로그인 상태라면  %>
        <header id="header" class="flex-container">
            <div id="headerLogo">
                <a href="/Proj_OnedayClass/index.jsp"><img src="/Proj_OnedayClass/img/logo.png" width="45%" height="45%" alt="로고"></a>
            </div>

            <div id="headerRight">
                <ul class="flex-container">
                    <li><a href="/Proj_OnedayClass/sign/myPage.jsp"><%=uId %></a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/Logout.jsp">로그아웃</a></li>
                    <li></li>
                    <li>
                        <div id="headerCart">
                            <a href="#"><img src="img/cart.png" alt=""> <span>0</span></a>
                        </div>
                    </li>
                </ul>
            </div>
        </header>
	<% } else { %>
        <header id="header" class="flex-container">
            <div id="headerLogo">
                <a href="/Proj_OnedayClass/index.jsp"><img src="/Proj_OnedayClass/img/logo.png" width="45%" height="45%" alt="로고"></a>
            </div>

            <div id="headerRight">
                <ul class="flex-container">
                    <li><a href="/Proj_OnedayClass/sign/Login.jsp">Sign In</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/Member.jsp">Sign Up</a></li>
                    <li></li>
                    <li>
                        <div id="headerCart">
                            <a href="#"><img src="img/cart.png" alt=""> <span>0</span></a>
                        </div>
                    </li>
                </ul>
            </div>
        </header>
        <%} %>

        <nav id="gnb">
            <ul class="flex-container">
                <li><a href="/Proj_OnedayClass/index.jsp">Home</a></li>
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
		<h1><%=Qna_title %> 문의 글</h1>

		<!--  HTML 템플릿(Template, Templet)  헤더 끝 -->
		
		
		<main id="main" class="read">   <!-- 본문영역 html 템플릿 시작 -->
			<!--  뷰페이지 내용 출력 시작 -->
		
			<h2><%=Qna_title %></h2>
				
			<table id="readTbl">
				<tbody id="readTblBody">
					<tr>
						<td>작성자</td>  <!-- td.req 필수입력 -->
						<td><%=uIdb %></td>
						<td>등록일</td>  <!-- td.req 필수입력 -->
						<td><%=regDate %></td>
					</tr>
					<tr>
						<td>첨부파일</td> <!-- td.req 필수입력 -->
						<td colspan="3">
							<input type="hidden" name="fileName" value="<%=fileName%>" 
										id="hiddenFname">
						<% if (fileName != null && !fileName.equals("")) { %>						
							<span id="downloadFile"><%=fileName %></span>							
							(<span><%=(int)fileSize + " " + fUnit%></span>)
						<% } else { %>
							등록된 파일이 없습니다.
						<% } %>
						</td>
					</tr>
					<tr>
						<td colspan="4" id="readContentTd"><pre><%=Qna_content %></pre></td>
					</tr>					
				</tbody>
				 
				<tfoot id="readTblFoot">	
					<tr>
						<td colspan="4" id="footTopSpace"></td>							
					</tr>			     
					<tr>
						<td colspan="4" id="articleInfoTd">
							<span><%="조회수 : " + count %></span>							
						</td>							
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
							<button type="button" id="listBtn" class="butcs"><%=listBtnLabel %></button>
							<button type="button" id="modBtn" class="butcs">수 정</button>
							<button type="button" id="replyBtn" class="butcs">답 변</button>
							<button type="button" id="delBtn" class="butcs">삭 제</button>
						</td>
					</tr>
				</tfoot>
				 
			</table>
			<input type="hidden" name="nowPage" value="<%=nowPage%>" id="nowPage">
			<input type="hidden" name="num" value="<%=num%>" id="num">
			
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
	<script src="/Proj_OnedayClass/script/bbs.js"></script>    
</body>
</html>