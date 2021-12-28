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
				location.href="Member.jsp";				
			});
			
			
		});