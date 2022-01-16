<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
String uId = (String)session.getAttribute("idKey");
String uName = (String)session.getAttribute("nameKey");
String uLevel = (String)session.getAttribute("levelKey");
%>  
<html lang="ko">
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
    
<body>
        <header id="header" class="flex-container">
            <div id="headerLogo">
                <a href="/Proj_OnedayClass/Index.jsp"><img src="/Proj_OnedayClass/img/logo.png" alt="로고"></a>
            </div>
            <!-- div#headerLogo -->

            <div id="headerRight">
                <ul class="flex-container">
    <% if (uId != null) {   // 현재 로그인 상태라면  %>
                    <li><a href="/Proj_OnedayClass/sign/MyPage.jsp"><%=uName %> / 등급 : <%=uLevel %></a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/Logout.jsp">로그아웃</a></li>
	<% } else { %>
					<li><a href="/Proj_OnedayClass/sign/Login.jsp">Sign In</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/Member.jsp">Sign Up</a></li>
	<%} %>
                    <li></li>
                    <li>
                        <div id="headerCart">
                            <a href="#"><img src="/Proj_OnedayClass/img/cart.png" alt=""> <span>0</span></a>
                        </div>
                    </li>
                </ul>
            </div>
            <!-- div#headerRight -->
        </header>
        <!-- header#header -->
        
        <nav id="gnb">
            <ul class="flex-container">
                <li class="active"><a href="/Proj_OnedayClass/Index.jsp">Home</a></li>
                <li><a href="./about.html">About</a></li>
                <li><a href="#">Online</a></li>
                <li><a href="#">Offline</a></li>
                <li><a href="/Proj_OnedayClass/reviewBBS/RvList.jsp">Contact</a></li>
            </ul>
        </nav>
        <!-- nav#gnb -->
</body>
</html>