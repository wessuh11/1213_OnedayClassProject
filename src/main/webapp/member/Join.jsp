<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입</title>
	<link rel="stylesheet" href="/Proj_OnedayClass/style/Join.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("zipCode").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
                oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address1").value = data.zonecode;//우편번호
                document.getElementById("address2").value = data.address; // 주소 넣기
                document.getElementById("address3").focus(); //상세입력 포커싱
                }
               }).open();
        });
    }
</script>
</head>
<body>
    
    <div id="wrap">
        <header id="header" class="flex-container">
            <div id="headerLogo">
                <a href="/Proj_OnedayClass/index.jsp">
                <img src="/Proj_OnedayClass/img/onedaylogo.png" alt="로고"></a>
            </div>

            <div id="headerRight">
                <ul class="flex-container">
                    <li><a href="/Proj_OnedayClass/sign/Login.jsp">Sign In</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/member/Join.jsp">Sign Up</a></li>
                    <li></li>
                    <li>
                        <div id="headerCart">
                            <a href="#">
                            <img src="/Proj_OnedayClass/img/cart.png" alt=""> <span>0</span></a>
                        </div>
                    </li>
                </ul>
            </div>
        </header>


        <nav id="gnb">
            <ul class="flex-container">
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="./on-shop.html">Online</a></li>
                <li><a href="./off-shop.html">Offline</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
        </nav>
        
     <!--     회원가입 시작     --> 
      <div id="Join">
            <form name="regFrm" id="regFrm" action="MemberProc.jsp" method="get">
             <table>
			<caption>회원가입</caption>
			<tbody>
				<tr>
					<td class="req">아이디</td>
					<td>
						<input type="text" id="uId" name="uId" size="26" 
								maxlength="20" autofocus>
						<button type="button" id="idChkBtn">ID중복확인</button>
						<input type="hidden" name="uIdBtnClickChk" id="uIdBtnClickChk" value="0">
					</td>
					
				</tr> 
				<tr>
					<td class="req">패스워드</td>
					<td>
						<input type="password" name="uPw" id="uPw" size="26">
					</td>
					
				</tr>
				<tr>
					<td >패스워드 확인</td>
					<td>
						<input type="password" id="uPw_Re" size="26">
					</td>
				
				</tr>
				<tr>
					<td class="req">이름</td>
					<td>
						<input type="text" name="uName" id="uName" size="26">
					</td>
					
				</tr>
				<tr>
				  <td class="req">전화번호</td>
                  <td>
                        <input type="text" class="umem" name="uPhone" id="uPhone" size="26"
                                   >    
                   </td>
                </tr>
				<tr>
					<td>우편번호</td>
					<td>
						<input type="text" name="address1" id="address1" size="7" 
						class="uAddr" readonly>
						<button type="button" id="zipCode" >우편번호찾기</button>
					</td>
				
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" class="uAddr" id="address2" name="address2" size="26">
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input type="text" id="address3" name="address3" size="26" placeholder="상세주소를 입력해주세요.">
						<input type="hidden" id="uAddr" name="uAddr">
					</td>
					
				</tr>				
				<tr>
					<td class="req">Email</td>
					<td>
						<input type="text" name="uEmail" id="uEmail" size="26">
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
     <!--     회원가입 끝     -->    

	</div>
 

        <footer id="footer">

            <div id="footerTop" class="flex-container">
                <nav id="footerLnbArea">
                    <ul id="footermainMenu" class="flex-container">
                        <li class="footerMainLi"><a href="#">서비스이용약관</a></li>
                        <li class="footerMainLi"></li>
                        <li class="footerMainLi"><a href="#">개인정보처리방침</a></li>
                        <li class="footerMainLi"></li>
                        <li class="footerMainLi"><a href="#">이메일무단수집거부</a></li>
                        <li class="footerMainLi"></li>
                        <li class="footerMainLi"><a href="#">인터넷증명발급</a></li>
                    </ul>
                </nav>
                <!-- nav#footerLnbArea -->
            </div>
            <!-- div#footerTop 회사 관련 정보 영역 -->

            <div id="footerBottom" class="flex-container">
                <nav id="footerArea">
                    <ul id="footerBtm" class="flex-container">
                        <li class="footerBtmLi"><a href="#">주소</a></li>
                        <li class="footerBtmLi"><a href="#">대표</a></li>
                        <li class="footerBtmLi"><a href="#">사업자번호</a></li>
                        <li class="footerBtmLi"><a href="#">전화번호</a></li>
                    </ul>
                </nav>
                <!-- nav#footerArea -->
            </div>

        </footer>
        <!-- footer#footer -->
    </div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/Proj_OnedayClass/script/Join.js"></script>  


</body>
</html>