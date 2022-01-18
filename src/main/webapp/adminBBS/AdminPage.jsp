<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%
request.setCharacterEncoding("UTF-8");
String uId = (String)session.getAttribute("idKey");
String uName = (String)session.getAttribute("nameKey");
String uLevel = (String)session.getAttribute("levelKey");
String str1 = "3";
%>  

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" href="/Proj_OnedayClass/style/admin.css">
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
    	<% if (uId != null && str1.equals(uLevel)) {  //관리자 로그인%>
                    <li><a href="/Proj_OnedayClass/sign/MyPage.jsp"><%=uName %> 관리자님 안녕하세요.</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/Logout.jsp">로그아웃</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/adminBBS/AdminPage.jsp">관리자 페이지</a></li>   
    	<% } else { %>
					<script>
					alert("관리자가 아닙니다. 홈페이지로 이동합니다.");
					location.href="/Proj_OnedayClass/Index.jsp";
					</script>
		<% } %>
				</ul>
            </div>
            <!-- div#headerRight -->
        </header>
	        <!-- header#header -->
		<main id="main">
		 	<table>
				<caption><hr><h3>관리자 페이지</h3></caption>
				</table>
			<div id="adManu">
				<ul>
					<li><a href="/Proj_OnedayClass/levelUp/LvlUpList.jsp">등업 관리</a></li>
					<li><a href="/Proj_OnedayClass/classBBS/ClassList.jsp">클래스 관리</a></li>
					<li id="adMainLi" class="mainAdMenu" >
						<a href="#">게시판 관리</a>
					 	<div id="subAdMenu" class="subContainer">
                            <ul class="subAdMenu2 flex-container">
                                <li class="subAdMenuLi"><a href="/Proj_OnedayClass/adminBBS/AdminQnaList.jsp" id="">문의 게시판</a></li>
                                <li class="subAdMenuLi"><a href="/Proj_OnedayClass/adminBBS/AdminRvList.jsp" id="">리뷰 게시판</a></li>
                            </ul>
                        </div>
					</li>
				</ul>	
			</div>	
		</main>
		<div id="include">
		<hr>
		<%@include file="../include/Footer.jsp"%>	
		</div>
		</div>
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/Proj_OnedayClass/script/script.js"></script>
</body>
</html>