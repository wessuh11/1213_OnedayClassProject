<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="bean" class="pack_QnaBBS.BoardBean" scope="session" />    
    
<%
request.setCharacterEncoding("UTF-8");
int qNum = Integer.parseInt(request.getParameter("qNum"));
//검색어 수신 시작
String keyField = request.getParameter("keyField");
String keyWord = request.getParameter("keyWord");
//검색어 수신 끝

String nowPage = request.getParameter("nowPage");
String qUid = bean.getqUid();
String qTitle = bean.getqTitle();
String qContent = bean.getqContent();
String qRef = String.valueOf(bean.getqRef());
String qDepth = String.valueOf(bean.getqDepth());
String qPos = String.valueOf(bean.getqPos());
String uId = (String)session.getAttribute("idKey");
String uName = (String)session.getAttribute("nameKey");
String uLevel = (String)session.getAttribute("levelKey");
%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
    <link rel="stylesheet" href="/Proj_OnedayClass/style/bbs.css">
</head>
<body>
	<header id="header" class="flex-container">
            <div id="headerLogo">
                <a href="/Proj_OnedayClass/Index.jsp"><img src="/Proj_OnedayClass/img/logo.png" alt="로고"></a>
            </div>
            <!-- div#headerLogo -->

            <div id="headerRight">
                <ul class="flex-container">
    <% if (uId != null) {   // 현재 로그인 상태라면  %>
                    <li><a href="/Proj_OnedayClass/sign/MyPage.jsp"><%=uName %> / 등급 : <%=uLevel %></a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/Logout.jsp">로그아웃</a></li>
	<% } else { %>
					<li><a href="/Proj_OnedayClass/sign/Login.jsp">Sign In</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/Member.jsp">Sign Up</a></li>
	<%} %>
                    <li></li>
                    <li>
                        <div id="headerCart">
                            <a href="#"><img src="/Proj_OnedayClass/img/cart.png" alt=""> <span>0</span></a>
                        </div>
                    </li>
                </ul>
            </div>
            <!-- div#headerRight -->
		</header>
        <!-- header#header -->

        <nav id="gnb">
            <ul class="flex-container">
                <li><a href="/Proj_OnedayClass/index.jsp">Home</a></li>
                <li><a href="./about.html">About</a></li>
                <li><a href="#">Online</a></li>
                <li><a href="#">Offline</a></li>
				<li class="active"><a href="/Proj_OnedayClass/qnaBBS/QnaList.jsp">QnA</a></li>
            </ul>
        </nav>
		<!--  HTML 템플릿(Template, Templet)  헤더 시작 -->
		<h1>답변 작성 페이지</h1>
		<!--  HTML 템플릿(Template, Templet)  헤더 끝 -->
		
		
		
		<main id="main" class="reply">   <!-- 본문영역 html 템플릿 시작 -->
			<!--  답변페이지 내용 출력 시작 -->
			
			
			<form name="replyFrm" action="ReplyProc.jsp"
					method="get" id="replyFrm">
		
				<h2>답변글 작성</h2>
					
				<table id="replyTbl">
					<tbody id="replyTblBody">
						<tr>
							<td class="req">작성자</td>
							<td><span class="ori_Txt"><b><%=qUid %></b> 님의 글</span></td>
						</tr>
						<tr>
							<td class="req">제목</td>
							<td>
								<input type="text" name="qTitle" value=""
									size="50" id="Qna_title">								
								<span class="ori_Txt">원본 글제목 : <b><%=Qna_title %></b></span>
							</td>
						</tr>
						<tr>
							<td style="vertical-align: top;">내용</td>
							<td>
								<textarea name="qna_content" id="Qna_content"  
								cols="89" wrap="hard"></textarea>
								
								<span id="ori_SpanTxtArea" class="ori_Txt">원본 글내용</span>
								<textarea id="ori_TxtArea"  
								cols="89"><%=Qna_content %></textarea>
								
							</td>
						</tr>	
						<tr>
							<td class="req">비밀번호</td>
							<td>
								<input type="password" name="uPw" id="uPw">								
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
							<td colspan="2" id="btnAreaTd" class="reply">
								<button type="button" id="replyBtn" class="butcs">답변등록</button>
								<button type="reset" class="butcs">다시쓰기</button>
								<button type="button" id="backBtn" class="butcs">뒤 로</button>							
							</td>
						</tr>
					</tfoot>
					 
				</table>
				<input type="hidden" name="num" value="<%=num%>" id="num">				
				
				<input type="hidden" name="ref" value="<%=ref%>">				
				<input type="hidden" name="depth" value="<%=depth%>">				
				<input type="hidden" name="pos" value="<%=pos%>">
				
				<input type="hidden" name="nowPage" value="<%=nowPage%>" id="nowPage">
				<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
				
				<!-- 검색어전송 시작 -->
				<input type="hidden" name="keyField" id="keyField" value="<%=keyField%>">
				<input type="hidden" name="keyWord" id="keyWord" value="<%=keyWord%>">
				<!-- 검색어전송 끝 -->
		
			</form>
			<!--  답변페이지 내용 출력 끝 -->
			
			
		</main>  <!-- 본문영역 html 템플릿 끝 -->


	</div>
	<!-- div#wrap -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/Proj_OnedayClass/script/bbs.js"></script>    
</body>
</html>