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
    <title>마이페이지</title>
    <link rel="stylesheet" href="/Proj_OnedayClass/style/style.css">
    <link rel="stylesheet" href="/Proj_OnedayClass/style/myPage.css">
</head>
<body>
     <% if (uId != null) {   // 현재 로그인 상태라면  %>
    <div id="wrap">
        <!-- header#header -->
        <header id="header" class="flex-container">
            <div id="headerLogo">
                <a href="#"><img src="../img/logo.png" alt="로고"></a>
            </div>

            <div id="headerRight">
                <ul class="flex-container" id="Hello">
                     <li>
                     <b><a href="/Proj_OnedayClass/myPage/myPage.jsp"><%=uId %>님 환영합니다</a></b>
                     </li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/member/Logout.jsp">로그아웃</a></li>
                    <li></li>
                    <li>
                        <div id="headerCart">
                            <a href="#"><img src="img/cart.png" alt=""> <span>0</span></a>
                        </div>
                    </li>
                </ul>
            </div>
        </header>

        <nav id="gnb">
            <ul class="flex-container">
                <li ><a href="./index.html">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="/Proj_OnedayClass/shop/on-shop.html">Online</a></li>
                <li><a href="/Proj_OnedayClass/shop/off-shop.html">Offline</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </nav>

        <div id="pageMenu">
            <ul id="myPageMenu" class="flex-container">
                <li class="myPageMenuLi">
                    <a href="#"><img src="/Proj_OnedayClass/img/myPage/blank-profile.png" alt="프로필 설정" width="150"></a>
                </li>
                <li class="myPageMenuLi">
                    <Strong id="uName">
                    <%=uId %></Strong>
                    <button type="button" id="profileModBtn">편집</button>
                </li>
                <li class="myPageMenuLi">
                    <Strong>회원등급</Strong>
                    <span id="uGrade">회원</span>
                </li>
                <li class="myPageMenuLi">
                    <Strong>적립금</Strong>
                    <span id="c_point">0 </span>원
                </li>
                <li class="myPageMenuLi">
                    <Strong>쿠폰</Strong>
                    <span id="couponSum">0 </span>장
                </li>
            </ul>
        </div>


        <main id="main">
            <nav id="mainNav">
                <ul id="mainMenu" class="flex-container">
                    <li id="mainLi1" class="mainLi">
                        <a href="#">주문 내역</a>
                        <div id="subMenu1"  class="subContainer">
                            <ul class="subMenu flex-container">
                                <li class="subMenuLi"><a href="#" id="onlineBtn">온라인</a></li>
                                <li class="subMenuLi"><a href="#" id="offlineBtn">오프라인</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="mainLi">
                        <a href="#" id="deliveryChkBtn">배송 조회</a>
                    </li>
                    <li id="mainLi2" class="mainLi">                     
                        <a href="#">내 정보 관리</a>
                        <div id="subMenu2" class="subContainer">
                            <ul class="subMenu flex-container">
                                <li class="subMenuLi"><a href="/Proj_OnedayClass/member/Member_Mod.jsp" id="memModBtn">회원 정보 수정</a></li>
                                <li class="subMenuLi"><a href="/Proj_OnedayClass/member/Member_Del.jsp" id="memDrop">회원 탈퇴</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </nav>

            <div id="detailedContent">
            	
				<table id="bbsTbl">
					<thead>
						<tr>
							<th><span id="title1">강의 종류</span></th>
							<th><span id="title2">클래스 이름</span></th>
							<th><span id="title3">비용</span></th>
							<th><span id="title4">배달비</span></th>
							<th><span id="title5">신청인원</span></th>
							<th><span id="title6">결제일</span></th>
						</tr>
					</thead>
					<tbody id="bbsContent">
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
				
            </div>
        </main>

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
	
	<script>
		alert("비정상적인 접속입니다.\n"
				 +"메인페이지로 이동합니다."); 
		           // 현재 메인페이지는 없기 때문에 로그인페이지로 이동
		location.href="/Proj_OnedayClass/index.jsp"; 
	
	</script>
	
	<% } %>
    <script src="/Proj_OnedayClass/script/jquery-3.6.0.min.js"></script>
    <script src="/Proj_OnedayClass/script/script.js"></script>
</body>
</html>