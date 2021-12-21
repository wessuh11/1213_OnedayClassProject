<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입</title>
	<style>
	* {
		box-sizing: border-box;
	}
	div#wrap {
		width: 660px;
		padding: 10px;
		border: 1px solid #000;
		margin: 10px auto;
	}
	
	table {
		width: 100%;
		/*border: 1px solid #000;*/
	}
	th, td {
		padding: 10px 6px;
/*		border: 1px solid #000;  */
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
		font-size: 15px;
		padding: 4px 10px;
	}
	input.uAddr {
		border: none;
		border-bottom: 1px solid #ddd;
		outline: none;
	}
	td#hobbyArea span:hover {
		color: #555;
		cursor: pointer;
	}
	
	td.req::after {   /* 입력 필수 */
		content: " *";
		color: #f80;
		font-size: 20px;
	}
	
	button {
		font-size: 14px;
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
			
			
			//////////////  우편번호 찾기 시작 //////////////////////
			function zipCheck() {
				let url = "ZipCheck.jsp?zipChk=y";

				let w = screen.width;
				let popW = 540;
				let leftP = (w-popW)/2;
				let h = screen.height;
				let popH = 400;
				let topP = (h-popH)/2;
				//alert("w : " + w + "\nh : " + h);
				
				window.open(url, "zipCodeSearch", "width="+popW+", height="+popH+", left="+leftP+", top="+topP);
				
				
			}
			
			$("#zipBtn").click(function(){
				zipCheck();
			});
			//////////////  우편번호 찾기 끝 //////////////////////
			
			
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
			

			///////////  로그인 페이지 이동 시작 ////////////////
			$("#loginBtn").click(function(){
				location.href = "Login.jsp";
			});

			///////////  메인 페이지 이동 시작 ////////////////
			$("#mainBtn").click(function(){
				location.href = "../Index.jsp";
			});
			
			
			
			
		});	
	</script>
</head>
<body>
	<div id="wrap">
	
	<form name="regFrm" id="regFrm" action="MemberProc.jsp" method="get">
	
		<table>
			<caption>회원가입</caption>
			<tbody>
				<tr>
					<td class="req">아이디</td>
					<td>
						<input type="text" id="uId" name="uId" size="15" 
								maxlength="20" autofocus>
						<button type="button" id="idChkBtn">ID중복확인</button>
						<input type="hidden" name="uIdBtnClickChk" id="uIdBtnClickChk" value="0">
					</td>
					<td>5~20글자, 영어/숫자/_</td>
				</tr> 
				<tr>
					<td class="req">패스워드</td>
					<td>
						<input type="password" name="uPw" id="uPw" size="15">
					</td>
					<td>패스워드를 적어주세요</td>
				</tr>
				<tr>
					<td>패스워드 확인</td>
					<td>
						<input type="password" id="uPw_Re" size="15">
					</td>
					<td>패스워드를 확인합니다.</td>
				</tr>
				<tr>
					<td class="req">이름</td>
					<td>
						<input type="text" name="uName" id="uName" size="15">
					</td>
					<td>이름을 적어주세요.</td>
				</tr>
				<tr>
					<td class="req">Email</td>
					<td>
						<input type="text" name="uEmail" id="uEmail" size="26">
					</td>
					<td>이메일을 적어주세요.</td>
				</tr>
				<tr>
					<td colspan="3" style="border-bottom: 2px solid #ddd;"></td>
				</tr>				
				<tr>
					<td>성별</td>
					<td>
					 	<label>남 <input type="radio" name="uGender" value="1" checked></label>
					 	<label>여 <input type="radio" name="uGender" value="0"></label>
					</td>
					<td>성별을 선택하세요.</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						<input type="text" name="uBirthday" id="uBirthday" size="6">
						ex) 830815
					</td>
					<td>생년월일을 적어주세요.</td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td>
						<input type="text" name="uZip" id="uZip" size="7" 
						class="uAddr" readonly>
						<button type="button" id="zipBtn">우편번호찾기</button>
					</td>
					<td>우편번호를 검색하세요.</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" class="uAddr" id="uAddr1" name="uAddr1" size="26">
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input type="text" id="uAddr2" name="uAddr2" size="26">
						<input type="hidden" id="uAddr" name="uAddr">
					</td>
					<td>나머지 주소 기재</td>
				</tr>
				<tr>
					<td>취미</td>
					<td id="hobbyArea">
						<label><span>인터넷</span><input type="checkbox" name="uHobby" value="인터넷"></label>
						<label><span>여행</span><input type="checkbox" name="uHobby" value="여행"></label>
						<label><span>게임</span><input type="checkbox" name="uHobby" value="게임"></label>
						<label><span>영화</span><input type="checkbox" name="uHobby" value="영화"></label>
						<label><span>운동</span><input type="checkbox" name="uHobby" value="운동"></label>
					</td>
					<td>취미를 선택하세요.</td>
				</tr>
				<tr>
					<td>직업</td>
					<td>
						<select name="uJob" id="uJob">
							<option value="0" selected>-선택하세요-</option>
							<option value="회사원">회사원</option>
							<option value="연구전문직">연구전문직</option>
							<option value="교수학생">교수학생</option>
							<option value="일반자영업">일반자영업</option>
							<option value="공무원">공무원</option>
							<option value="의료인">의료인</option>
							<option value="법조인">법조인</option>
							<option value="주부">주부</option>
							<option value="기타">기타</option>
						</select>
					</td>
					<td>직업을 선택하세요.</td>
				</tr>
				<tr>
					<td colspan="3">
						<button type="button" id="joinBtn">회원가입</button>
						<button type="reset">다시쓰기</button>
						<button type="button" id="mainBtn">메인으로</button>		
						<button type="button" id="loginBtn">로그인</button>					
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