<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");
String uId = (String)session.getAttribute("idKey");
%>  

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="/Proj_OnedayClass/style/sign.css">
</head>
<body>
<<<<<<< HEAD
    <div id="wrap">
    
        <header id="header" class="flex-container">
            <div id="headerLogo">
                <a href="/Proj_OnedayClass/Index.jsp"><img src="/Proj_OnedayClass/img/logo.png" alt="로고"></a>
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
        <!-- 네비시작 -->
        <nav id="gnb">
            <ul class="flex-container">
                <li><a href="/Proj_OnedayClass/Index.jsp">Home</a></li>
                <li><a href="./about.html">About</a></li>
                <li><a href="#">Online</a></li>
                <li><a href="#">Offline</a></li>
            </ul>
        </nav>
        <!-- 네비끝 -->
        <!-- 로그인시작 -->
       
        <div id="signin">
        <form action="LoginProc.jsp" id="loginFrm" name="loginFrm">
			<table>
				<caption><hr><h3>로그인</h3></caption>
				<tbody>
					<tr>
						<td>
							<input type="text" class="loginInput" name="uId" id="uId" autofocus size="30"
                            placeholder="아이디">
						</td>
					</tr>
					<tr>
						<td>
							<input type="password" class="loginInput" name="uPw" id="uPw" size="30"
                            placeholder="비밀번호">
						</td>
					</tr>
					<tr>
						<td colspan="2">						
							<button type="button" id="loginBtn">로그인</button>
							<button type="button" id="signUpBtn">회원가입</button>
						</td>						
					</tr>
				</tbody>
			</table>
		</form>
        </div>
        <!-- 로그인끝 -->
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
        <!-- footer#footer -->
    </div>
=======
 	<% if (uId != null) {      %>
	 <script>
       	alert("이미 로그인 상태입니다."); 
		location.href="/Proj_OnedayClass/Index.jsp"; 	
	</script>
	  <% } else { // 현재 로그인 상태라면 %> 
    <div id="wrap">
    <%@include file="../include/Header.jsp"%>
        <!-- 로그인시작 -->
        <div id="signin">
        <form action="LoginProc.jsp" id="loginFrm" name="loginFrm">
			<table>
				<caption><hr><h3>로그인</h3></caption>
				<tbody>
					<tr>
						<td>
							<input type="text" class="loginInput" name="uId" id="uId" autofocus size="30"
                            placeholder="아이디">
						</td>
					</tr>
					<tr>
						<td>
							<input type="password" class="loginInput" name="uPw" id="uPw" size="30"
                            placeholder="비밀번호">
						</td>
					</tr>
					<tr>
						<td colspan="2">						
							<button type="button" id="loginBtn">로그인</button>
							<button type="button" id="signUpBtn">회원가입</button>
						</td>						
					</tr>
				</tbody>
			</table>
		</form>
        </div>
        <!-- 로그인끝 -->
    	<%@include file="../include/Footer.jsp"%>
        <!-- footer#footer -->
    </div>
    <%} %>	
>>>>>>> refs/heads/onedayclass_Mo
</body>
    <script src="../script/jquery-3.6.0.min.js"></script>
	<script src="/Proj_OnedayClass/script/script.js"></script>
	<script src="/Proj_OnedayClass/script/member.js"></script>
</html>