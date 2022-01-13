<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pack_ClassBbs.ClassBean" %>
<jsp:useBean id="bMgr" class="pack_ClassBbs.ClassMgr"  scope="page" />
    
<%
request.setCharacterEncoding("UTF-8");

String uId = (String)session.getAttribute("idKey");
String uName = (String)session.getAttribute("nameKey");
String uLevel = (String)session.getAttribute("levelKey");

//로그인 등급 변수
String AdminNum = "3";
String TeaNum = "2";

int numParam = Integer.parseInt(request.getParameter("cNum")); //현재 페이지 번호
String nowPage = request.getParameter("nowPage");

ClassBean bean = bMgr.getBoard(numParam);

int cNum = bean.getcNum(); //클래스 게시판 번호 //현재 페이지 번호
String cTeacher = bean.getcTeacher(); //강사이름
String cUid = bean.getcUid(); //글 아이디
String cCategory = bean.getcCategory(); //클래스 카테고리
String cTitle = bean.getcTitle(); //클래스 제목
String cContent= bean.getcContent(); //클래스 설명
String cRegDate= bean.getcRegDate(); //클래스 작성날짜

int cPrice= bean.getcPrice(); //클래스 가격
int cDelivery= bean.getcDelivery(); //배송비

String cThumbName= bean.getcThumbName(); //썸네일 이름
int cThumbSize= bean.getcThumbSize(); //썸네일 크기저장
String cFileName= bean.getcFileName(); //파일이름 
int cFileSize= bean.getcFileSize(); //크기저장

int cMaxStu= bean.getcMaxStu(); //최대 수강인원
int cApplyStu= bean.getcApplyStu(); //수강신청 인원


//카테고리 넘버
String cCategory1 = "1";
String cCategory2 = "2";
String cCategory3 = "3";
String cCategory4 = "4";
String cCategory5 = "5";
String cCategory6 = "6";
String cCategory7 = "7";

//수강인원 꽉차면 닫아줌

session.setAttribute("bean", bean);
//불러온 모든걸 세션으로 만들어줌!!
%>  
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>클래스 상세페이지</title>
	<link rel="stylesheet" href="/Proj_OnedayClass/style/classbbs/classread.css">
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
    <% if (uId != null && AdminNum.equals(uLevel)) {  //관리자 로그인%>
                    <li><a href="/Proj_OnedayClass/sign/MyPage.jsp"><%=uName %> 관리자님 안녕하세요.</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/Logout.jsp">로그아웃</a></li>
                    <li></li>
                    <li><a href="#">관리자 페이지</a></li>
	<% } else if(uId != null && TeaNum.equals(uLevel)) { %>
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
                <li><a href="/Proj_OnedayClass/Index.jsp">Home</a></li>
                <li><a href="./about.html">About</a></li>
                <li><a href="/Proj_OnedayClass/classbbs/ClassOnList.jsp">Online</a></li>
                <li><a href="/Proj_OnedayClass/classbbs/ClassOffList.jsp">Offline</a></li>
            </ul>
        </nav>
        <!-- nav#gnb -->
        
        <div id="main">
        	
         <div id="details" class="flex-container">       
        	<div id="thumbnail">
        	 	<table>
        	 	<tr>
        	 		<td class="thumimg">
        	 			<img src="/Proj_OnedayClass/fileupload/classfileupload/thumbnail/<%=cThumbName%>" alt="썸네일"
        	 			width ="490px" height = "345px">
        	 		</td>
        	 	</tr>
        	 	</table>
        	</div>
        	<!-- div#thumbnail -->
        	
        	<div id="thumbinfo">
        		<table>
        			
        			<tr>
        				<td colspan ="2" class="cCategory">[<%
        				if(cCategory1.equals(cCategory)){
        					cCategory = "핸드 메이드";
        				} else if(cCategory2.equals(cCategory)){
        					cCategory = "쿠킹";
        				} else if(cCategory3.equals(cCategory)){
        					cCategory = "드로잉";
        				} else if(cCategory4.equals(cCategory)){
        					cCategory = "음악";
        				} else if(cCategory5.equals(cCategory)){
        					cCategory = "요가·필라테스";
        				} else if(cCategory6.equals(cCategory)){
        					cCategory = "레져·스포츠";
        				} else if(cCategory7.equals(cCategory)){
        					cCategory = "반려동물";
        				} else {
        					cCategory = "자기계발";
        				}
      					 %><%= cCategory %>] <%= cTeacher %></td>
        			</tr>
        			<tr>
        				<td colspan ="2" class="cTitle"><%= cTitle	%></td>
        			</tr>
        			<tr>
        				<td colspan ="2" class="cContent"><%= cContent %></td>
        			</tr>
        			<tr>
        				<td colspan ="2" class="cPrice">수강료 : <%= cPrice %> 원</td>
        			</tr>
        			<tr>
        				<td colspan ="2" class="cDelivery">배송비 : <%= cDelivery %> 원</td>
        			</tr>
        			<tr>
        				<td colspan ="2" class="persons"> 인원수 : <%= cApplyStu %> / <%= cMaxStu %></td>
        			</tr>
        		</table>
        		
        		<% if(cApplyStu >= cMaxStu) { %>
        		<table>
        			<tr>
        			    <td>
        			    	<button type="button" class="buy">마감 되었습니다</button>
        			    </td>
        			</tr>
        		</table>
        		<% } else { %>
        		<table>
        			<tr>
        			    <td>
        			    	<button type="button" class="like" id="like">♥</button>
        			    </td>
        				<td>
        					<button type="button" class="buy" id="buy">클래스 신청하기</button>
        				</td>
        				<!-- 결제페이지 이동 -->
        			</tr>
        		</table>
        		<%} %>
        		
        	</div>
        </div>
        <!-- div#info -->
        
       <% if(uId != null && AdminNum.equals(uLevel)) { %>
	    <div id="teacherbtn">
		    <table>
			    <tr>
			        <td>
		        		<button type="button" class="teacherchoice" id ="modBtn">클래스 수정</button>
		           </td>
		        	<td>
		        		<button type="button" class="teacherchoice" id ="delBtn">클래스 삭제</button>
		        	</td>
			    </tr>
		    </table>
	    </div>
	    <!-- div#teacherbtn 선생님만 보이도록 구현-->
	    <%} %>
        
        
	    <% if(uId != null && TeaNum.equals(uLevel)) { %>
	    <div id="teacherbtn">
		    <table>
			    <tr>
			        <td>
		        		<button type="button" class="teacherchoice" id ="modBtn">클래스 수정</button>
		           </td>
		        	<td>
		        		<button type="button" class="teacherchoice" id ="delBtn">클래스 삭제</button>
		        	</td>
			    </tr>
		    </table>
	    </div>
	    <!-- div#teacherbtn 선생님만 보이도록 구현-->
	    <% } %>
	   
	    <input type="hidden" name="nowPage" value="<%=nowPage%>" id="nowPage">
		<input type="hidden" name="cNum" value="<%=numParam%>" id="cNum">
		
	    
	    <div id="boardmenu">
	    	 <ul class="flex-container">
                    <li><a href="#">상세</a></li>
                    <li><a href="#">리뷰</a></li>
                    <li><a href="#">문의</a></li>
              </ul>
	    </div>
	    <!-- div#boardmenu -->

		<!-- div#details -->
        	<div id="info">
        		상세정보?
        	</div>
        </div>
        <!-- div#main -->
        
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
            <!-- div#footerBottom -->

        </footer>
        <!-- footer#footer -->
    </div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/Proj_OnedayClass/script/classbbs.js"></script>
</body>
</html>