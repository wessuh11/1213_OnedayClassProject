<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="pack_QnaBBS.*"%>
    
<%
request.setCharacterEncoding("UTF-8");

int qNum = Integer.parseInt(request.getParameter("qNum"));
String nowPage = request.getParameter("nowPage");

//검색어 수신 시작
String keyField = request.getParameter("keyField");
String keyWord = request.getParameter("keyWord");
//검색어 수신 끝

BoardBean bean = (BoardBean)session.getAttribute("bean");
String qTitle = bean.getqTitle();
String qUid = bean.getqUid();
String qContent = bean.getqContent();
int qStatus = bean.getqStatus();

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
	<title>게시글 수정페이지</title>
    <link rel="stylesheet" href="/Proj_OnedayClass/style/qnaBBS.css">
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
                <li class="active"><a href="/Proj_OnedayClass/Index.jsp">Home</a></li>
                <li><a href="./about.html">About</a></li>
                <li><a href="#">Online</a></li>
                <li><a href="#">Offline</a></li>
                <li><a href="/Proj_OnedayClass/qnaBBS/QnaList.jsp">QnA</a></li>
            </ul>
        </nav>
        <!-- nav#gnb -->

		<h1>수정페이지</h1>
		
		
		<main id="main" class="mod">   <!-- 본문영역 html 템플릿 시작 -->
			<!--  뷰페이지 내용 출력 시작 -->
			
			
			<form name="updateFrm" action="QnaUpdateProc.jsp"
					method="get" id="updateFrm">
		
				<h2><%=qTitle%></h2>
					
				<table id="modTbl">
					<tbody id="modTblBody">
						<tr>
							<td>작성자</td>
							<td>
								<%=qUid%>
								<input type="hidden" name="qUid" id="qUid" value="<%=uId%>">
							</td>
						</tr>
						<tr>
							<td class="req">공개유무</td>
							<%
								if (qStatus == 1) {
							%>
							<td>
								공개 <input type="radio" name="qStatus"
									value="2">									
								비공개 <input type="radio" name="qStatus"
									value="1" checked>											
							</td>
							<%
								} else {
							%>
							<td>
								공개 <input type="radio" name="qStatus"
									value="2" checked>									
								비공개 <input type="radio" name="qStatus"
									value="1">											
							</td>
							<%} %>						
						</tr>
						<tr>
							<td class="req">제목</td>
							<td>
								<input type="text" name="qTitle" value="<%=qTitle%>"
									size="50" id="qTitle">
							</td>
						</tr>
						<tr>
							<td style="vertical-align: top;">내용</td>
							<td>
								<textarea name="qContent" id="txtArea"  cols="89" wrap="hard"><%=qContent %></textarea>
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
								<button type="button" id="modBtn" class="butcs">수정하기</button>
								<button type="reset" class="butcs">다시쓰기</button>
								<button type="button" id="backBtn" class="butcs">뒤 로</button>							
							</td>
						</tr>
					</tfoot>
					 
				</table>
				<input type="hidden" name="nowPage" value="<%=nowPage%>" id="nowPage">
				<input type="hidden" name="qNum" value="<%=qNum%>" id="num">
				
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
	<script src="/Proj_OnedayClass/script/qnaBBS.js"></script>    
</body>
</html>