<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
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
    <title>온라인 클래스</title>
    <link rel="stylesheet" href="/Proj_OnedayClass/style/classbbs/on-shop.css">
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
                    <li><a href="#">관리자 페이지</a></li>
	<% } else if(uId != null && str2.equals(uLevel)) { %>
	                <li><a href="/Proj_OnedayClass/sign/MyPage.jsp"><%=uName %> 선생님 환영합니다.</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/Logout.jsp">로그아웃</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/classbbs/ClassPost.jsp">클래스 생성</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/classbbs/ClassList.jsp">클래스 관리</a></li>
    <% } else if(uId != null) { %>
    	            <li><a href="/Proj_OnedayClass/sign/MyPage.jsp"><%=uName %> <%=uLevel %>님 환영합니다.</a></li>
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
                            <a href="#"><img src="/Proj_OnedayClass/img/cart.png" alt=""> <span>0</span></a>
                        </div>
                    </li>
	<%} %>
				</ul>
            </div>
            <!-- div#headerRight -->
        </header>
        <!-- header#header -->

        <nav id="gnb">
            <ul class="flex-container">
                <li ><a href="/Proj_OnedayClass/Index.jsp">Home</a></li>
                <li ><a href="#">About</a></li>
                <li class="active"><a href="/Proj_OnedayClass/classbbs/ClassOnList.jsp">Online</a></li>
                <li ><a href="/Proj_OnedayClass/classbbs/ClassOffList.jsp">Offline</a></li>
            </ul>
        </nav>

        <!-- 카테고리 시작-->
            <div id="category">
                 <ul class="">
                     <li><a href="#">핸드메이드</a></li>
                     <li><a href="#">쿠킹</a></li>
                     <li><a href="#">드로잉</a></li>
                     <li><a href="#">음악</a></li>
                     <li><a href="#">요가·필라테스</a></li>
                     <li><a href="#">레져·스포츠</a></li>
                     <li><a href="#">반려동물</a></li>
                     <li><a href="#">자기계발</a></li>
                 </ul>
             </div>
             <!-- div#category -->
        <!-- 카테고리 종료-->
        
        <!-- 온라인 게시판 시작 -->
        <div id="Gallerybbs">

<!-- 추천리스트 갤러리 시작 -->
            <div id="goodsPart" class= "flex-container">
                    <h2>★ 온라인 추천 클래스 ★</h2>
                    <span>HOME | Online</span>
            </div>
            <!-- div#goodsPart 끝 -->

        <!-- main#galleryListArea 시작 -->
            <main id="galleryListArea" class="flex-container">
                <table class='goodsTbl'>
                    <tbody>
                        <tr>
                        	<td>
	                            <a href="#">
	                                <img alt='' width='310'>
	                            </a>
                            <!-- 상품이미지 -->
                            </td>
                        </tr>
                        <tr>
                            <td class='goodsName'></td>
                            <!-- 상품명 -->
                        </tr>
                        <tr>
                            <td class='goodsDesc'></td>
                            <!-- 상품설명 goods Describe -->
                        </tr>
                    </tbody>
                </table>
                <!-- table.goodsTbl 상품출력용 테이블 -->
            </main>
            <!-- main#galleryListArea 끝-->
<!-- 추천리스트 갤러리 끝 -->

<!-- 일반리스트 갤러리 시작 -->
            <!-- 최신순, 리뷰순 -->
            <div id="allclass" class= "flex-container">
                <h2>★ 온라인 클래스 ★</h2>
                    <select>
                        <option>최신순</option>
                        <option>리뷰순</option>
                    </select>
            </div>
            <!-- div#allclass 최신순, 리뷰순 끝-->

            <div id="BasicList">
                <!-- main#galleryListArea 시작 -->
                <main id="galleryListArea2" class="flex-container">
                    <table class='goodsTbl2'>
                        <tbody>
                            <tr>
                            	<td>
                                <a href="#">
                                    <img alt='' width='310'>
                                </a>
                                <!-- 상품이미지 -->
                            	</td>
                            </tr>
                            <tr>
                                <td class='goodsName2'></td>
                                <!-- 상품명 -->
                            </tr>
                            <tr>
                                <td class='goodsDesc2'></td>
                                <!-- 상품설명 goods Describe -->
                            </tr>
                        </tbody>
                    </table>
                    <!-- table.goodsTbl 상품출력용 테이블 -->
                </main>
                <!-- main#galleryListArea 끝-->
            </div>
            <!-- main#galleryListArea 종료 -->
            </div>
            <!-- div#BasicList -->
<!-- 일반리스트 갤러리 종료 -->




<!-- 푸터영역 -->
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

    <script src="/Proj_OnedayClass/script/jquery-3.6.0.min.js"></script>
    <script src="/Proj_OnedayClass/script/on-shop.js"></script>
</body>
</html>