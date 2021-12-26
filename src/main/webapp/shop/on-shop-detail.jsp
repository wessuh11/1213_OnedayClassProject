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
    <title>온라인 상세페이지</title>
    <link rel="stylesheet" href="/Proj_OnedayClass/style/on-detail.css">
</head>
<body>
<% if (uId != null) {   // 현재 로그인 상태라면  %>
    <div id="wrap">
        <header id="header" class="flex-container">
            <div id="headerLogo">
                <a href="/Proj_OnedayClass/index.jsp"><img src="/Proj_OnedayClass/img/onedaylogo.png" alt="로고"></a>
            </div>

            <div id="headerRight">
                <ul class="flex-container">
                     <li>
                     <b><a href="/Proj_OnedayClass/myPage/myPage.jsp"><%=uId %>님 환영합니다</a></b>
                     </li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/member/Logout.jsp">로그아웃</a></li>
                    <li></li>
                    <li>
                        <div id="headerCart">
                            <a href="#"><img src="/Proj_OnedayClass/img/cart.png" alt=""> <span>0</span></a>
                        </div>
                    </li>
                </ul>
            </div>
        </header>

        <nav id="gnb">
            <ul class="flex-container">
                <li><a href="/Proj_OnedayClass/index.jsp">Home</a></li>
                <li><a href="#">About</a></li>
                <li class="active"><a href="/Proj_OnedayClass/shop/on-shop.jsp">Online</a></li>
                <li><a href="/Proj_OnedayClass/shop/off-shop.jsp">Offline</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </nav>

        <div id="detail" class="flex-container">
            <div id="detail_img">
                원데이클래스 이미지
            </div>
            <!-- div#detail_img -->

            <div id="detail_name">
                원데이클래스 상세설명
            </div>
            <!-- div#detail_ex -->

        </div>
        <!-- div#detail -->
        
        <div id="detail_ex">
            <div id="detail_expage">
                <ul class="flex-container">
                    <li><a href="#">상세페이지</a></li>
                    <li>/</li>
                    <li><a href="#">리뷰</a></li>
                    <li>/</li>
                    <li><a href="#">판매자문의</a></li>
                </ul>
            </div>
            <!-- div#detail_expage -->
            <!-- 멀티탭 사용예정 -->
        </div>
        <!-- div#detail_ex -->

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
<% } else { %>
    <div id="wrap">
        <header id="header" class="flex-container">
            <div id="headerLogo">
                <a href="/Proj_OnedayClass/index.jsp"><img src="/Proj_OnedayClass/img/onedaylogo.png" alt="로고"></a>
            </div>

            <div id="headerRight">
                <ul class="flex-container">
                    <li><a href="/Proj_OnedayClass/member/Login.jsp">Sign In</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/member/Member.jsp">Sign Up</a></li>
                    <li></li>
                    <li>
                        <div id="headerCart">
                            <a href="#"><img src="/Proj_OnedayClass/img/cart.png" alt=""> <span>0</span></a>
                        </div>
                    </li>
                </ul>
            </div>
        </header>

        <nav id="gnb">
            <ul class="flex-container">
                <li><a href="/Proj_OnedayClass/index.jsp">Home</a></li>
                <li><a href="#">About</a></li>
                <li class="active"><a href="/Proj_OnedayClass/shop/on-shop.jsp">Online</a></li>
                <li><a href="/Proj_OnedayClass/shop/off-shop.jsp">Offline</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </nav>

        <div id="detail" class="flex-container">
            <div id="detail_img">
                원데이클래스 이미지
            </div>
            <!-- div#detail_img -->

            <div id="detail_name">
                원데이클래스 상세설명
            </div>
            <!-- div#detail_ex -->

        </div>
        <!-- div#detail -->
        
        <div id="detail_ex">
            <div id="detail_expage">
                <ul class="flex-container">
                    <li><a href="#">상세페이지</a></li>
                    <li>/</li>
                    <li><a href="#">리뷰</a></li>
                    <li>/</li>
                    <li><a href="#">판매자문의</a></li>
                </ul>
            </div>
            <!-- div#detail_expage -->
            <!-- 멀티탭 사용예정 -->
        </div>
        <!-- div#detail_ex -->

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
<% } %>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/Proj_Ch14_BBS/script/Script.js"></script>    
</body>
</html>