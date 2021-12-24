$(function(){

    $("#mainBtn").click(function(){   // 메인으로 이동				
        location.href="/1213_OnedayClassProject/src/main/webapp/index.html";				
    });
    $("#joinBtn").click(function(){   // 회원가입으로 이동				
        location.href="/1213_OnedayClassProject/src/main/webapp/sign/Member.html";				
    });

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
		
		new daum.Postcode({
   			 oncomplete: function(data) {
       		 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("uZip").value = data.zonecode;
                document.getElementById("uAddr1").value = roadAddr;
                document.getElementById("uAddr2").focus(); // 상세주소로 포커스
            }
        }).open();
		
	}
	
	$("#zipBtn").click(function(){
		zipCheck();
	});
	//////////////  우편번호 찾기 끝 //////////////////////
	
	//////////////  체크박스 전부 동의하기 시작 /////////////
	
	$("#allChk").click(function(){
		let checked = $("#allChk").is(":checked");
		
		if(checked)
			$("input:checkbox").prop("checked", true);
		else
			$("input:checkbox").prop("checked", false);
	});
	
	//////////////  체크박스 전부 동의하기 끝 //////////////
	
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
		let chk1 = $("#chk1").is(":checked");
		let chk2 = $("#chk1").is(":checked");
		let chk3 = $("#chk1").is(":checked");
		
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
		} else if (!chk1 || !chk2 || !chk3) {
			alert("동의여부를 확인하세요.")
		} else {
			$("#uAddr").val(uAddr);
			
			$("#regFrm").submit();
		}
		
	});
	////////////// 유효성 검사 끝 //////////////////////
});