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
    <title>클래스 생성페이지</title>
    <link rel="stylesheet" href="/Proj_OnedayClass/style/classbbs/classpost.css">
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
	<%if(uId != null && str2.equals(uLevel)) { %>
	                <li><a href="/Proj_OnedayClass/sign/MyPage.jsp"><%=uName %> 선생님 환영합니다.</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/Logout.jsp">로그아웃</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/classbbs/ClassPost.jsp">클래스 생성</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/classbbs/ClassList.jsp">클래스 관리</a></li>

				</ul>
            </div>
            <!-- div#headerRight -->
        </header>
        <!-- header#header -->
        
        <nav id="gnb">
            <ul class="flex-container">
                <li><a href="/Proj_OnedayClass/Index.jsp">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="/Proj_OnedayClass/classbbs/ClassOnList.jsp">Online</a></li>
                <li><a href="/Proj_OnedayClass/classbbs/ClassOffList.jsp">Offline</a></li>
            </ul>
        </nav>
        
        <!-- ClassBbs 시작 -->
        <div id="classbbs">
            <form name="regFrm" id="regFrm" action="ClassPostProc.jsp" 
            method="post" enctype="multipart/form-data">
                <table>
                    <tr>
                    	<th colspan="2" style="background-color: #fbceb1;"><h1>★ 클래스 생성 ★</h1></th>
                    </tr>
                    <tbody>
                        <tr>
                       		<!-- cTeacher -->
                        	<td class="req">강사이름</td>
                         <td>
                               <input type="hidden" id="cCode" name="cCode" size="27" class="umem">
                       		   <input type="hidden" name="cUid" id="cUid" value="<%=uId%>">
                               <input type="text" id="cTeacher" name="cTeacher" size="27" 
                                class="umem" maxlength="20" autofocus  placeholder="선생님 이름을 입력하세요.">
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
	                                placeholder="제목을 입력하세요.">
	                        </td>
                        </tr>
                        <tr>
                        	<!-- cContent -->
	                        <td class="req">클래스 설명</td>
	                        <td>
	                        	<textarea name="cContent" id="cContent" cols="80" rows="10"></textarea>
	                        	<input type="hidden" name="contentType"value="TEXT">
	                        </td>
                        </tr>
                        <tr>
                            <!-- cPrice -->
	                        <td class="req">수강료</td>
	                        <td>
	                                <input type="text" class="umem" name="cPrice" id="cPrice" size="40"
	                                placeholder="가격은 얼마인가요?">
	                        </td>
                        </tr>
                        <tr>
                            <!-- cDelivery -->
	                        <td class="reqNull">배송비</td>
	                        <td>
	                                <input type="text" class="umem" name="cDelivery" id="cDelivery" size="40"
	                                placeholder="배송비는 얼마인가요?">
	                        </td>
                        </tr>
                        <tr>
                            <!-- cThumbName, cThumbSize -->
	                        <td class="reqNull">썸네일사진</td>
	                        <td>
	                        	<span>
	                                <input type="file" name="cThumbName" id="cThumbName">
	                            </span>
	                        </td>
                        </tr>
                       <tr>
                            <!-- cFileName, cFileSize -->
	                        <td class="reqNull">상세정보사진</td>
	                        <td>
	                        	<span>
	                                <input type="file" name="cFileName" id="cFileName">
	                            </span>
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
                            <td class="button" colspan = "2">
                                <button type="button" id="regBtn" class="classbutton">클래스 생성하기</button>
                                <!-- <button type="button" id="regBtn" class="classbutton">돌아가기</button> -->
                            </td>
                        </tr>
                    </tbody>
                </table>              
                </form>
                
            </div>
            <!-- ClassBbs 종료 -->

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
	<script src="/Proj_OnedayClass/script/classbbs.js"></script>
</body>
	<% } else { %>
	
	<script>
	/*
		alert("비정상적인 접속입니다.\n"
				 +"메인페이지로 이동합니다."); 
		           // 현재 메인페이지는 없기 때문에 로그인페이지로 이동
		location.href="../Index.jsp";
	*/
	</script>
	
<% } %>
</html>

	