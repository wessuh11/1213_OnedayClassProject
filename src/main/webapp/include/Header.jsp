<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");
String iuId = (String)session.getAttribute("idKey");
String iuName = (String)session.getAttribute("nameKey");
String iuLevel = (String)session.getAttribute("levelKey");
String istr1 = "3";
String istr2 = "2";
%>    
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" href="/Proj_OnedayClass/style/style.css">
</head>
<body>
	<div id="wrap">
		<header id="header" class="flex-container">
            <div id="headerLogo">
                <a href="/Proj_OnedayClass/Index.jsp"><img src="/Proj_OnedayClass/img/logo.png" width="75%" alt="로고"></a>
            </div>
            <!-- div#headerLogo -->
            <div id="headerRight">
                <ul class="flex-container">
    	<% if (iuId != null && istr1.equals(iuLevel)) {  //관리자 로그인%>
                    <li><a href="/Proj_OnedayClass/adminBBS/AdminPage.jsp"><%=iuName %> 관리자님 안녕하세요.</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/Logout.jsp">로그아웃</a></li>
                    <li></li>
<!--                     <li><a href="/Proj_OnedayClass/adminBBS/AdminPage.jsp">관리자 페이지</a></li> -->
		<% } else if(iuId != null && istr2.equals(iuLevel)) { %>
	                <li><a href="/Proj_OnedayClass/sign/MyPage.jsp"><%=iuName %> 선생님 환영합니다.</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/Logout.jsp">로그아웃</a></li>
                <!--     <li></li>
                    <li><a href="/Proj_OnedayClass/classbbs/ClassPost.jsp">클래스 생성</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/ClassList.jsp">클래스 관리</a></li> -->
   		<% } else if(iuId != null) { %>
    	            <li><a href="/Proj_OnedayClass/sign/MyPage.jsp"><%=iuName %> 님 환영합니다.</a></li>
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
                <li><a href="/Proj_OnedayClass/Index.jsp" >Home</a></li>
                <li><a href="/Proj_OnedayClass/adminBBS/AdminQnaList.jsp">About</a></li>
                <li><a href="/Proj_OnedayClass/classBBS/ClassOnList.jsp">Online</a></li>
                <li><a href="/Proj_OnedayClass/classBBS/ClassOffList.jsp">Offline</a></li>
            </ul>
        </nav>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>