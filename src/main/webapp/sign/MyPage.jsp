<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");
String uId = (String)session.getAttribute("idKey");
String uName = (String)session.getAttribute("nameKey");
String uLevel = (String)session.getAttribute("levelKey");

String str1 = "3";
String str2 = "2";
String str3 = "1";
%>  

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/Proj_OnedayClass/style/style.css">
    <link rel="stylesheet" href="/Proj_OnedayClass/style/myPage.css">
</head>
<body>  
	<div id="wrap">
     <%@include file="../include/Header.jsp"%> 
     
        <div id="pageMenu">
            <ul id="myPageMenu" class="flex-container">
                <li class="myPageMenuLi">
                    <a href="#"><img src="/Proj_OnedayClass/img/profile.png" alt="프로필 설정"></a>
                </li>
                <li class="myPageMenuLi">
                    <Strong id="uName"><%=uName %></Strong>
                    <button type="button" id="profileModBtn">편집</button>
                </li>
                <li class="myPageMenuLi">
                    <Strong>회원등급</Strong>
                    <%if(uLevel.equals("2")) { %>
                    <span id="uGrade">강사</span>
                    <%} else {%>
                    <span id="uGrade">학생</span>
                    <%} %>
                </li>
            </ul>
        </div>
        <main id="main">
            <nav id="mainNav">
                <ul id="mainMenu" class="flex-container">
                    <li id="mainLi1" class="mainLi">
        <%if (uLevel.equals("1")) {%>
                        <a href="#">주문 내역</a>
                        <div id="subMenu1"  class="subContainer">
                            <ul class="subMenu flex-container">         
                                <li class="subMenuLi"><a href="#" id="onlineBtn">온라인</a></li>
                                <li class="subMenuLi"><a href="#" id="offlineBtn">오프라인</a></li>     
							</ul>
						</div>                      
         <% } else { %>
                        <a href="#">클래스 관리</a>
                        <div id="subMenu1"  class="subContainer">
                            <ul class="subMenu flex-container">           
                                <li class="subMenuLi"><a href="/Proj_OnedayClass/classBBS/ClassPost.jsp">클래스 등록</a></li>
                                <li class="subMenuLi"><a href="/Proj_OnedayClass/classBBS/ClassList.jsp" >클래스 관리</a></li>
							</ul>
                        </div>    
                      </li>     
                      <li id="mainLi2" class="mainLi">
                      <a href="#">수강 결제 내역</a>
                        <div id="subMenu2"  class="subContainer">
                            <ul class="subMenu flex-container">
                                <li class="subMenuLi"><a href="#" id="onlineBtn" id="onlineBtn">온라인</a></li>
                                <li class="subMenuLi"><a href="#" id="offlineBtn" id="offlineBtn">오프라인</a></li>
                            </ul>
                        </div>             
        <% } %>  
        		</li>                        
                    <li id="mainLi3" class="mainLi" >           
                        <a href="#" class=" subMenuLila">내 정보 관리</a>
                        <div id="subMenu3" class="subContainer">
                            <ul class="subMenu flex-container">
                    <%if (uLevel.equals("1")) {%>
                                <li class="subMenuLi"><a href="/Proj_OnedayClass/sign/Member_Mod.jsp" id="memModBtn">회원 정보 수정</a></li>
                                <li class="subMenuLi"><a href="/Proj_OnedayClass/levelUp/LvlUpPost.jsp" id="">등업 신청</a></li>
                                <li class="subMenuLi"><a href="#" id="memDrop">회원 탈퇴</a></li>
					<% } else { %>
					            <li class="subMenuLi"><a href="/Proj_OnedayClass/sign/Member_Mod.jsp" id="memModBtn">회원 정보 수정</a></li>                                
                                <li class="subMenuLi"><a href="#" id="memDrop">회원 탈퇴</a></li>
                    <% } %>
                            </ul>
                        </div>
                    </li>
                </ul>
            </nav>
            
				 <div id="detailedContent">	
            	<%if(uLevel.equals("2")) {%>
				<table id="bbsTbl">
					<thead>
						<tr>
							<th><span id="title1">강의 종류</span></th>
							<th><span id="title2">클래스 이름</span></th>
							<th><span id="title3">신청자</span></th>
							<th><span id="title4">이메일</span></th>
							<th><span id="title5">신청인원</span></th>
							<th><span id="title6">결제일</span></th>
						</tr>
					</thead>
					
					<%} else { %>
					
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
					<%} %>
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

       <%@include file="../include/Footer.jsp"%>
        <!-- footer#footer -->
    </div>
    <script src="/Proj_OnedayClass/script/jquery-3.6.0.min.js"></script>
    <script src="/Proj_OnedayClass/script/script.js"></script>
</body>
</html>
