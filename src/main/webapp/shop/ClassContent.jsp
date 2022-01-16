<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
String uId = (String) session.getAttribute("idKey");
String uName = (String) session.getAttribute("nameKey");
String uLevel = (String) session.getAttribute("levelKey");
%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>OneDayClass</title>
	<link rel="stylesheet" href="/Proj_OnedayClass/style/styleon.css">
    
</head>
<body>

	<div id="wrap">
			<jsp:include page="../Header.jsp" />
	

	
	        <main id="onlineclass">
            <!-- 상세 페이지 시작 -->
     	<div id="contetns" class="flex-container">

                <!--제목 썸네일 시작-->
                <div id="thumbnail">
                    <img src="/Proj_OnedayClass/img/Dacquoise.png" width="300" alt="다쿠아즈">
                </div>
                <div id="content">
                    <ul id="Ccategory" class="flex-container">
                        <li><a href="#">베이킹 </a></li>
                        <li>/</li>
                        <li>길태형</li>
                    </ul>
                    <h2>겉바속촉 다쿠아즈 만들기</h2>
                    <!--제목 썸네일 끝-->

                    <div id="price">
                        <span>25000원</span>
                    </div>
                    <!--장바구니, 클래스 신청 시작-->
                    <div id="cartPay" class="flex-container">

                        <div id="cart">
                            <a href="#"> <img src="/Proj_OnedayClass/img/heart.png" width="20" alt="장바구니"> </a>
                        </div>

                        <div id="Capply">
                            <a href="#"><span>클래스 신청하기</span></a>
                        </div>

                        <!--장바구니, 클래스 신청 끝-->
                    </div>

                </div>

            </div>

            <hr style="border: 1px solid #000;">

            <div id="abc">
                <ul class="flex-container">
                    <li><a href="#">상세페이지</a></li>
                    <li></li>
                    <li><a href="#">리뷰</a></li>
                    <li></li>
                    <li><a href="#">판매자 문의</a></li>
                </ul>
            </div>
        </main>
		
			<jsp:include page="../Footer.jsp" />
		
	</div>
	<!-- div#wrap -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="script/script.js"></script>

</body>
</html>