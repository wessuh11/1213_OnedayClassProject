<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="pack_ClassBbs.*"%>
    
<%
request.setCharacterEncoding("UTF-8");

int numParam = Integer.parseInt(request.getParameter("cNum")); //현재 페이지 번호
String nowPage = request.getParameter("nowPage");

ClassBean bean = (ClassBean)session.getAttribute("bean");
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

String Area = bean.getcArea(); //지역
String cOnoff = bean.getcOnoff(); //onoff 여부

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
	<title>클래스 수정페이지</title>
    <link rel="stylesheet" href="/Proj_OnedayClass/style/classbbs/classupdate.css">
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
                            <a href="#"><img src="img/cart.png" alt=""> <span>0</span></a>
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

        <!-- ClassUpdate 시작 -->
        <div id="classbbs">
            <form name="updateFrm" id="updateFrm" action="ClassUpdateProc.jsp" 
            method="post" >
                <table>
                    <tr>
                    	<th colspan="2" style="background-color: #fbceb1;"><h1>★ 클래스 수정 ★</h1></th>
                    </tr>
                    <tbody>
                        <tr>
                       		<!-- cTeacher -->
                        	<td class="req">강사이름</td>
                         <td>
                               <input type="hidden" id="cCode" name="cCode" size="27" class="umem">
                       		   <input type="hidden" name="cUid" id="cUid" value="<%=uId%>">
                               <input type="text" id="cTeacher" name="cTeacher" size="27" 
                                class="umem" maxlength="20" autofocus  placeholder="선생님 이름을 입력하세요." value="<%=cTeacher%>">
                         </td>
                        </tr>
                        <tr>
                        	<!-- cCategory -->
                        	<td class="req">클래스 종류</td>
                      		<td>
							<select name="cCategory" id="cCategory">
								<option value="0" selected>-----Class-----</option>
								<option value="1">핸드메이드</option>
								<option value="2">쿠킹</option>
								<option value="3">드로잉</option>
								<option value="4">음악</option>
								<option value="5">요가·필라테스</option>
								<option value="6">레져·스포츠</option>
								<option value="7">반려동물</option>
								<option value="8">자기계발</option>
							</select>
						</td>
                        </tr>
                        <tr>
                        	<!-- cTitle -->
	                        <td class="req">클래스 제목</td>
	                        <td>
	                                <input type="text" class="umem" name="cTitle" id="cTitle" size="40"
	                                placeholder="제목을 입력하세요." value="<%=cTitle%>">
	                        </td>
                        </tr>
                        <tr>
                        	<!-- cContent -->
	                        <td class="req">클래스 설명</td>
	                        <td>
	                        	<textarea name="cContent" id="cContent" cols="80" rows="10"></textarea>
	                        	<input type="hidden" name="contentType" value="<%=cContent%>">
	                        </td>
                        </tr>
                        <tr>
                            <!-- cPrice -->
	                        <td class="req">수강료</td>
	                        <td>
	                                <input type="text" class="umem" name="cPrice" id="cPrice" size="40"
	                                placeholder="가격은 얼마인가요?" value="<%=cPrice%>">
	                        </td>
                        </tr>
                        <tr>
                            <!-- cDelivery -->
	                        <td class="reqNull">배송비</td>
	                        <td>
	                                <input type="text" class="umem" name="cDelivery" id="cDelivery" size="40"
	                                placeholder="배송비는 얼마인가요?" value="<%=cDelivery%>">
	                        </td>
                        </tr>
						<tr>
						    <!-- cMaxStu -->
	                        <td class="req">수강인원</td>
	                        <td>
	                                <input type="text" class="umem" name="cMaxStu" id="cMaxStu" size="10"
	                                placeholder="인원 수">
	                        </td>
                        </tr>
                        <tr>
                            <!-- cOnoff -->
                        	<td class="req">수업유형</td>
                        	<td>
	                        	<label>
	                        		오프라인 클래스
	                        	 <input type="radio" name="cOnoff" id="cOnoff" value="Y">
	                        	 	온라인 클래스
	                        	 <input type="radio" name="cOnoff" id="cOnoff" value="N">
	                        	 </label>
                        	</td>
                        </tr>
						<tr>
						    <!-- cArea -->
	                        <td class="req">지역</td>
	                        <td>
	                                <input type="text" class="umem" name="cArea" id="cArea" size="10"
	                                placeholder="ex)경기">
	                        </td>
                        </tr>
                        <tr>
                            <td class="button" id="btnAreaTd"  colspan = "2">
                                <button type="button" id="updateBtn" class="classbutton">클래스 수정하기</button>
                                <button type="button" id="backBtn" class="classbutton">돌아가기</button>
                            </td>
                        </tr>
                    </tbody>
                </table>              
                </form>
         		<input type="hidden" name="nowPage" value="<%=nowPage%>" id="nowPage">
				<input type="hidden" name="cNum" value="<%=numParam%>" id="cNum">
		
            </div>
            <!-- ClassUpdate 종료 -->
	

	</div>
	<!-- div#wrap -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/Proj_OnedayClass/script/script.js"></script>
	<script src="/Proj_OnedayClass/script/classbbs.js"></script>    
</body>
</html>