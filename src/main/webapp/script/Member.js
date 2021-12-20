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
			
			
			$("#joinBtn").click(function(){
				
								
				let uIdBtnClickChk = $("#uIdBtnClickChk").val();
				let uPw = $("#uPw").val();
				let uPw_Re = $("#uPw_Re").val();
				let uName = $("#uName").val();
				let uPhone = $("#uPhone").val();
				//let uAddress1 = $("#uAddress1").val();
				//let uAddress2 = $("#uAddress2").val();
				//let uAddress3 = $("#uAddress3").val();
				let uEmail = $("#uEmail").val();
				
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
				} else if (uPhone == "") {     // 전화번호 검사 시작
					alert("전화번호를 입력하세요.");
					$("#uPhone").focus();
				} else if (uEmail == "") {     // 이메일 검사 시작
					alert("이메일을 입력하세요.");
					$("#uEmail").focus();
				} else if (uEmail.indexOf("@") < 0 || uEmail.indexOf(".") < 0) {     // 이메일 검사 시작
					alert("이메일주소를 확인하세요.");
					$("#uEmail").focus();
				} else {
					//$("#uAddress1").val(uAddress1);
					//$("#uAddress2").val(uAddress2);
					//$("#uAddress3").val(uAddress3);
					$("#regFrm").submit();
				}
				
			});
			////////////// 유효성 검사 끝 //////////////////////
			

			///////////  로그인 페이지 이동 시작 ////////////////
			$("#loginBtn").click(function(){
				location.href = "../sign/Login.jsp";
			});

			///////////  메인 페이지 이동 시작 ////////////////
			$("#mainBtn").click(function(){
				location.href = "../index.jsp";
			});
			
			
			
			
		});	