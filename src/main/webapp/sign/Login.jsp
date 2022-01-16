<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String uId = (String)session.getAttribute("idKey");
String uName = (String)session.getAttribute("nameKey");
String uLevel = (String)session.getAttribute("levelKey");
%>        
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
    <link rel="stylesheet" href="/Proj_OnedayClass/style/sign.css">
</head>
<body>
		<jsp:include page="../Header.jsp" />
	
        <!-- 로그인시작 -->
        <div id="signin">
        <form action="LoginProc.jsp" id="loginFrm" name="loginFrm">
			<table>
				<caption><hr><h3>로그인</h3></caption>
				<tbody>
					<tr>
						<td>
							<input type="text" class="loginInput" name="uId" id="uId" autofocus size="30"
                            placeholder="아이디">
						</td>
					</tr>
					<tr>
						<td>
							<input type="password" class="loginInput" name="uPw" id="uPw" size="30"
                            placeholder="비밀번호">
						</td>
					</tr>
					<tr>
						<td colspan="2">						
							<button type="button" id="loginBtn">로그인</button>
							<button type="button" id="joinBtn">회원가입</button>
						</td>						
					</tr>
				</tbody>
			</table>
		</form>
        </div>
        <!-- 로그인끝 -->
    		<jsp:include page="../Footer.jsp" />
       
    </div>
	<!-- div#wrap -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../script/member.js"></script>
</body>
</html>