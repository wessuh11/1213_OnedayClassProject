<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String uId = (String)session.getAttribute("idKey");
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>로그인 페이지</title>
	
	<style>
	* {
		box-sizing: border-box;
	}
	div#wrap {
		width: 460px;
		padding: 10px;
		/*border: 1px solid #000;*/
		margin: 10px auto;
	}
	
	table {
		width: 100%;
		/*border: 1px solid #000;*/
	}
	th, td {
		padding: 10px 6px;
		/*border: 1px solid #000;*/
	}
	td.loginBtn{
		border-bottom: 2px solid #ddd;
	}
	table>caption {
		font-size: 24px;
		font-weight: bold;
		padding: 20px;
		border-bottom: 2px solid #ddd;
	}
	
	tr:last-child td {
		text-align: center;
	}
	td:first-child {
		width: 120px;
		text-align: right;
	}
	input {
		width: 300px;
		height: 50px;
		font-size: 15px;
		padding: 4px 10px;
	}
	
	button {
		width: 450px;
		height: 50px;
		color : #fff;
		font-size: 20px;
		font-weight: bold;
		padding: 4px 10px;
		cursor: pointer;
		transform: translateY(1px);
		background-color: #08f;
	}
	
	</style>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$(function(){
			
			function fnLogin() {
				
				let uId = $("#uId").val().trim();
				let uPw = $("#uPw").val().trim();
				
				if (uId == "") {     // 비밀번호 검사 시작
					alert("아이디를 입력하세요.");
					$("#uId").focus();
				} else if (uPw == "") {     // 비밀번호 검사 시작
					alert("비밀번호를 입력하세요.");
					$("#uPw").focus();
				} else {					
					$("#loginFrm").submit();
				}
				
			}
			
			$("#loginBtn").click(function(){				
				fnLogin();
			});
			
			// 엔터 이벤트 적용 시작
			$("input.loginInput").keyup(function(event){
				let code = event.keyCode;
				if(code == 13) fnLogin();
			});
			// 엔터 이벤트 적용 끝
			
			$("#joinBtn").click(function(){   // 회원가입으로 이동				
				location.href="/Proj_OnedayClass/member/Member.jsp";				
			});
			
			
		});
	</script>
	
</head>
<body>
	<div id="wrap">
	
	<% if (uId != null) {   // 현재 로그인 상태라면  %>
		<meta http-equiv="refresh" content="1;url=/Proj_OnedayClass/index.jsp">
		 
		 <!--
		 <a href="../Index.jsp">메인으로</a>
		 <a href="Member_Del.jsp">회원탈퇴</a>		
		-->
		
	<% } else { %>
	
		<form action="LoginProc.jsp" id="loginFrm" name="loginFrm">
			<table>
				<caption>
					<img src="../img/member/logo.png" alt="" width ="250">
				</caption>
				<tbody>
					<tr>					
						<td colspan="3">						
								
						</td>				
					</tr>
					<tr>
						<td>아이디</td>
						<td>
							<input type="text" class="loginInput" name="uId" id="uId">
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
							<input type="password" class="loginInput" name="uPw" id="uPw">
						</td>
					</tr>
					<tr>					
						<td colspan="3">						
								
						</td>				
					</tr>
					<tr>					
						<td colspan="3" class="loginBtn">						
								<button type="button" id="loginBtn">로그인</button>
						</td>				
					</tr>			
					<tr>
						<td colspan="3">	
							<button type="button" id="joinBtn">회원가입</button>
						</td>
					</tr>	
				</tbody>
			</table>
		
		</form>


    <% } %>
	</div>
	<!-- div#wrap -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="script/script.js"></script>    
</body>
</html>