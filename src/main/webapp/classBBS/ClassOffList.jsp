<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pack_ClassBBS.ClassBean, java.util.Vector" %>
<jsp:useBean id="bMgr" class="pack_ClassBBS.ClassMgr"  scope="page" />    

<%
request.setCharacterEncoding("UTF-8");

int totalRecord = 0;        // 전체 데이터 수(DB에 저장된 row 개수)
int numPerPage = 10;    // 페이지당 출력하는 데이터 수(=게시글 숫자)
int pagePerBlock = 5;   // 블럭당 표시되는 페이지 수의 개수
int totalPage = 0;           // 전체 페이지 수
int totalBlock = 0;           // 전체 블록수

 /*
totalRecord=> 200     전체레코드
numPerPage => 10
pagePerBlock => 5
totalPage => 20
totalBlock => 4  (20/5 => 4)
*/

int nowPage = 1;          // 현재 (사용자가 보고 있는) 페이지 번호
int nowBlock = 1;         // 현재 (사용자가 보고 있는) 블럭

int start = 0;     // DB에서 데이터를 불러올 때 시작하는 인덱스 번호
int end = 10;     // 시작하는 인덱스 번호부터 반환하는(=출력하는) 데이터 개수 
                          // select * from T/N where... order by ... limit start, end;

int listSize = 0;    // 1페이지에서 보여주는 데이터 수
						//출력할 데이터의 개수 = 데이터 1개는 가로줄 1개
						
String uId = (String)session.getAttribute("idKey");
String uName = (String)session.getAttribute("nameKey");
String uLevel = (String)session.getAttribute("levelKey");
String str1 = "3";
String str2 = "2";

String cCategorySel = ""; // DB의 카테고리
						
if (request.getParameter("cCategory") != null) {
	cCategorySel = request.getParameter("cCategory");
	//카테고리 선택값이 없다면 전체 페이지 출력?
}

if (request.getParameter("nowPage") != null) {
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
	start = (nowPage * numPerPage) - numPerPage;
	end = numPerPage;            
	//카테고리 선택값이 있다면 해당 카테고리에 대한 게시물만 출력
}

Vector<ClassBean> vList = null;

%>  
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>오프라인 클래스</title>
    <link rel="stylesheet" href="/Proj_OnedayClass/style/classbbs/offshop.css">
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
                    <li><a href="/Proj_OnedayClass/classbbs/ClassList.jsp">게시판 관리</a></li>
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
                <li ><a href="/Proj_OnedayClass/classbbs/ClassOnList.jsp">Online</a></li>
                <li class="active"><a href="/Proj_OnedayClass/classbbs/ClassOffList.jsp">Offline</a></li>
            </ul>
        </nav>

        <!-- 카테고리 시작-->
            <div id="category">
				<ul id = "tagList" class="devUITagList">
						<li class="devTagList" value="1" <%if (cCategorySel.equals("1")) out.print("selected");%>>핸드 메이드</li>
						<!-- 1번 카테고리 전체출력.. -->
						<li class="devTagList" value="2" <%if (cCategorySel.equals("2")) out.print("selected");%>>쿠킹</li>
						<!-- 2번 카테고리 전체출력.. -->
						<li class="devTagList" value="3" <%if (cCategorySel.equals("3")) out.print("selected");%>>드로잉</li>
						<!-- 3번 카테고리 전체출력.. -->
						<li class="devTagList" value="4" <%if (cCategorySel.equals("4")) out.print("selected");%>>음악</li>
						<li class="devTagList" value="5" <%if (cCategorySel.equals("5")) out.print("selected");%>>요가·필라테스</li>
						<li class="devTagList" value="6" <%if (cCategorySel.equals("6")) out.print("selected");%>>레져·스포츠</li>
						<li class="devTagList" value="7" <%if (cCategorySel.equals("7")) out.print("selected");%>>반려동물</li>
						<li class="devTagList" value="8" <%if (cCategorySel.equals("8")) out.print("selected");%>>자기계발</li>
				</ul>
             </div>
             <!-- div#category -->
        <!-- 카테고리 종료-->
        
        <!-- 온라인 게시판 시작 -->
        <div id="Gallerybbs">

<!-- 추천리스트 갤러리 시작 -->
            <div id="goodsPart" class= "flex-container">
                    <h2>★ 오프라인 추천 클래스 ★</h2>
                    <span>HOME | Offline</span>
            </div>
            <!-- div#goodsPart 끝 -->

        <!-- main#galleryListArea 시작 -->
            <main id="galleryListArea3" class="flex-container">
                <table class='goodsTbl3'>
                    <tbody>
                        <tr>
                            <td>
                                <a href="#">
                                    <img alt='' width='310'>
                                </a>
                            </td>
                            <!-- 상품이미지 -->
                        </tr>
                        <tr>
                            <td class='goodsName3'>
                            </td>
                            <!-- 상품명 -->
                        </tr>
                        <tr>
                            <td class='goodsDesc3'></td>
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
                <h2>★ 오프라인 클래스 ★</h2>
                    <select>
                        <option>최신순</option>
                        <option>리뷰순</option>
                    </select>
            </div>
            <!-- div#allclass 최신순, 리뷰순 끝-->

            <div id="BasicList">
                <!-- main#galleryListArea 시작 -->
                <main id="galleryListArea4" class="flex-container">
                    <table class='goodsTbl4'>
                        <tbody>
                            <tr>
                                <td>
                                    <a href="#">
                                        <img alt='' width='310'>
                                    </a>
                                </td>
                                <!-- 상품이미지 -->
                            </tr>
                            <tr>
                                <td class='goodsName4'></td>
                                <!-- 상품명 -->
                            </tr>
                            <tr>
                                <td class='goodsDesc4'></td>
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
    <script src="/Proj_OnedayClass/script/onoffshop.js"></script>
</body>
</html>