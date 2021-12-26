<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>감사 인사 페이지</title>
    <link rel="stylesheet" href="style/style.css">
    <style>
    
	* {
		box-sizing: border-box;
	}
	div#wrap {
		width: 480px;
		padding: 10px;
		border: 1px solid #000;
		margin: 10px auto;
	}
	
	
    button	{
    	font-size: 24px;
    }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$(function(){
			
			$("#mainBtn").click(function(){   // 메인으로 이동				
				location.href="Proj_Onedayclass/index.jsp";				
			});			
			
		});
	</script>
</head>
<body>
	<div id="wrap">
		<h1>ㅠㅠㅠㅠㅠㅠㅠ</h1>
		<p style="font-size: 20px;">
		  우리 사이트를 탈퇴하다니..<br>
		  회원님 너무하십니다..ㅠㅠ
		</p>
		
		<button type="button" id="mainBtn">메인으로</button>

	</div>
	<!-- div#wrap -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="script/script.js"></script>    
</body>
</html>