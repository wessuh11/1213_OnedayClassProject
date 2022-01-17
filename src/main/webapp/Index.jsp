<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
		<%@include file="../include/Header.jsp"%>
		
		<nav id="gnb">
			<ul class="flex-container">
				<li class="active"><a href="/Proj_OnedayClass/Index.jsp">Home</a></li>
				<li><a href="#">About</a></li>
				<li><a href="/Proj_OnedayClass/classbbs/ClassOnList.jsp">Online</a></li>
				<li><a href="/Proj_OnedayClass/classbbs/ClassOffList.jsp">Offline</a></li>
			</ul>
		</nav>
		
        <div id="slide">
            <div id="shuttleFrame" class="flex-container">
                <!-- 가로형에서는 이미지전체개수의 폭-->
                <!-- 셔틀프레임이 좌우로 이동하면서 슬라이드쇼가 구현된다 -->

                <a href="#">   <!-- pos: r -->
                    <img src="img/slide/slide1.jpg" alt="슬라이드 이미지1">
                    <span>떠나요! 남도맛축제!</span>  <!-- pos: a + C -->
                </a>

                <a href="#">
                    <img src="img/slide/slide2.jpg" alt="슬라이드 이미지2">
                    <span>메타세콰이어길을 걸어요!</span>
                </a>

                <a href="#">
                    <img src="img/slide/slide3.jpg" alt="슬라이드 이미지3">
                    <span>테마기행과 함께 즐겨요!</span>
                </a>

            </div> <!-- div#shuttleFrame, 빨강색 테두리선 -->
				<div id="arrowLeft" class="arrowMark">&lt;</div>
            	<div id="arrowRight" class="arrowMark">&gt;</div>
            <!-- 슬라이드쇼 방향키 끝 -->
			
        	</div>
            <!-- 슬라이드쇼 방향키 시작 -->
            
			<%@include file="../include/Footer.jsp"%>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/Proj_OnedayClass/script/script.js"></script>
</body>
</html>