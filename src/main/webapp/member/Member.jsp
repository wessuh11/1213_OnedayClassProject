<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>원데이 클래스</title>
	<style>
	* {
		box-sizing: border-box;
	}
	<!--
	div#wrap {
		width: 550px;
		padding: 10px;
/*		border: 1px solid #000;*/
		margin: 10px auto;
	}
	
	table {
		width: 100%;
/*		border: 1px solid #000;*/
	}
	
	tr, td {
		padding: 5px 6px;
/*		border: 1px solid #000;*/
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
		height: 50px;
		font-size: 15px;
		padding: 4px 10px;
	}
	
	tr.slide{
		font-size: 11px;
		color: #e7223d;
	}
	
	th{
		width: 200px;
		text-align: left;
	}
	
	td.req::after {   /* 입력 필수 */
		content: " *";
		color: #f80;
		font-size: 20px;
	}
	
	button {
		height: 50px;
		font-size: 14px;
		font-weight: bold;
		padding: 4px 10px;
		cursor: pointer;
		transform: translateY(1px);
	}
	
	button#joinBtn {
		width: 500px;
		height: 50px;
		background-color: #08f;
		font-size: 20px;
		color : #fff;
		font-weight: bold;
		padding: 4px 10px;
		cursor: pointer;
		transform: translateY(1px);
	}
	
	select {
		font-size: 18px;
		transform: translateY(2px);
	}
	
	
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		$(function(){
			
			//////////////  아이디 중복 검사 시작 //////////////////////			
			function idCheck() {
				
				//// 아이디 => 영어, 숫자, 특수기호(_), 5글자 이상 20글자 이하
				let uId = $("#uId").val();
				let uIdLen  = uId.length;
				let uIdReg = /[^a-z|A-Z|0-9|_]/;
				if (uIdLen < 5) {
					alert("ID는 영어, 숫자, 특수기호(_), 5글자 이상 20글자 이하");
					$("#uId").focus();
					return;
				} else if(uIdReg.test(uId)) {
					alert("ID는 영어, 숫자, 특수기호(_), 5글자 이상 20글자 이하");
					$("#uId").focus();
					return;
				}
				
				let url = "IdCheck.jsp?uId=" + uId;
				let w = screen.width;
				let popW = 400;
				let leftP = (w-popW)/2;
				let h = screen.height;
				let popH = 300;
				let topP = (h-popH)/2;
				//alert("w : " + w + "\nh : " + h);
				
				window.open(url, "IdCheck", "width="+popW+", height="+popH+", left="+leftP+", top="+topP);
				
			}
			
			
			$("#idChkBtn").click(function(){
				idCheck();
			});
			//////////////  아이디 중복 검사 끝 //////////////////////
			

			////////////// 유효성 검사 시작 //////////////////////
			$("#joinBtn").click(function(){
							
				let uIdBtnClickChk = $("#uIdBtnClickChk").val();
				let uPw = $("#uPw").val();
				let uPw_Re = $("#uPw_Re").val();
				let uName = $("#uName").val();
				let uEmail = $("#uEmail").val();
				let uAddr1 = $("#uAddr1").val();
				let uAddr2 = $("#uAddr2").val();
				let uAddr = uAddr1 + " " + uAddr2;
				
				if(uIdBtnClickChk == 0) {    	// 아이디 검사 시작
					alert("ID중복확인 버튼을 클릭하세요.");
					$("#idChkBtn").focus();
					
					$("#idChkBtn").focus(function(){
						$(this).css({"outline": "1px solid #555"});	
					}).blur(function(){
						$(this).css({"outline": "none"});	
					});					
					// 아이디 검사 끝
				} else if (uPw == "") {     // 비밀번호 검사 시작
					alert("비밀번호를 입력하세요.");
					$("#uPw").focus();
				} else if (uPw != uPw_Re) {     // 비밀번호 동일검사 시작
					alert("비밀번호가 다릅니다. 확인 후 다시 입력하세요.");
					$("#uPw_Re").val("");
					$("#uPw").focus();
				} else if (uName == "") {     // 이름 검사 시작
					alert("이름을 입력하세요.");
					$("#uName").focus();
				} else if (uEmail == "") {     // 이메일 검사 시작
					alert("이메일을 입력하세요.");
					$("#uEmail").focus();
				} else if (uEmail.indexOf("@") < 0 || uEmail.indexOf(".") < 0) {     // 이메일 검사 시작
					alert("이메일주소를 확인하세요.");
					$("#uEmail").focus();
				} else {
					$("#uAddr").val(uAddr);
					
					$("#regFrm").submit();
				}
				
			});
			////////////// 유효성 검사 끝 //////////////////////
	
		});	
	</script>
</head>
<body>
	<div id="wrap">
	
	<form name="regFrm" id="regFrm" action="MemberProc.jsp" method="get">
	
		<table>
			<caption>
			<img src="../img/member/logo.png" alt="" width ="250">
			</caption>
			
			<tbody>
			
				<tr>
					<td class="req">아이디</td>
					<td>
						<input type="text" id="uId" name="uId" size="24" 
								maxlength="20" autofocus>
						<button type="button" id="idChkBtn">체크</button>
						<input type="hidden" name="uIdBtnClickChk" id="uIdBtnClickChk" value="0">
					</td>
				</tr>
				
				<tr class="slide">
					<td></td>
					<th>ID는 영어, 숫자, 특수기호(_), 5글자 이상 20글자 이하</th>
				</tr>
				
				<tr>
					<td class="req">패스워드</td>
					<td>
						<input type="password" name="uPw" id="uPw" size="32">
					</td>
				</tr>
				
				<tr class="slide">
					<td></td>
					<th>비밀번호를 입력하세요.</th>
					<td></td>
				</tr>
				
				<tr>
					<td>패스워드 확인</td>
					<td>
						<input type="password" id="uPw_Re" size="32">
					</td>
				</tr>
				
				<tr class="slide">
					<td></td>
					<th>비밀번호를 다시입력해주세요.</th>
					<td></td>
				</tr>
				
				<tr>
					<td class="req">이름</td>
					<td>
						<input type="text" name="uName" id="uName" size="32">
					</td>
				</tr>
				
				<tr class="slide">
					<td></td>
					<th>이름을 입력하세요</th>
				</tr>
				
				<tr>
					<td class="req">휴대폰</td>
					<td>
						<input type="text" name="uPhone" id="uPhone" size="32">
					</td>
				</tr>
				
				<tr class="slide">
					<td></td>
					<th>휴대폰번호(-제외)</th>
				</tr>
				
				<tr>
					<td class="req">Email</td>
					<td>
						<input type="text" name="uEmail" id="uEmail" size="32">
					</td>
				</tr>
				
				<tr class="slide">
					<td></td>
					<th>이메일을 입력해주세요.</th>
				</tr>
				
				<tr>
					<td colspan="3" style="border-bottom: 2px solid #ddd;"></td>
				</tr>
				<!--
				<tr>
					<td>우편번호</td>
					<td>
						<input type="text" name="getAddress1" id="getAddress1" size="7" 
						class="uAddr">
						<button type="button" id="zipBtn">우편번호찾기</button>
					</td>
					<td>우편번호를 검색하세요.</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" class="getAddress2" id="getAddress2" name="getAddress2" size="26">
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input type="text" id="getAddress3" name="getAddress3" size="26">
						<input type="hidden" id="uAddr" name="uAddr">
					</td>
					<td>나머지 주소 기재</td>
				</tr>
				
				<tr>
					<td colspan="3" style="border-bottom: 2px solid #ddd;"></td>
				</tr>
				-->			
				<tr>
					<td colspan="3">
						<button type="button" id="joinBtn">동의하고 가입하기</button>			
					</td>
				</tr>
				
			</tbody>
		</table>
	</form>
	<!-- document.regFrm -->

	</div>
	<!-- div#wrap -->
	
	
	<script src="script/script.js"></script>    
</body>
</html>