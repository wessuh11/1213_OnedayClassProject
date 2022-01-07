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
    <title>회원가입</title>
    <link rel="stylesheet" href="/Proj_OnedayClass/style/member.css">
</head>
<body>
    <div id="wrap">
        <!-- 헤더 시작 -->
        <header id="header" class="flex-container">
            <div id="headerLogo">
                <a href="/Proj_OnedayClass/Index.jsp"><img src="/Proj_OnedayClass/img/logo.png" alt="로고"></a>
            </div>
            <div id="headerRight">
                <ul class="flex-container">
                    <li><a href="/Proj_OnedayClass/sign/Login.jsp">Sign In</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/Member.jsp">Sign Up</a></li>
                    <li></li>
                    <li>
                        <div id="headerCart">
                            <a href="#"><img src="img/cart.png" alt=""> <span>0</span></a>
                        </div>
                    </li>
                </ul>
            </div>
        </header>
        <!-- 헤더 끝 -->
        <!-- 네비시작 -->
        <nav id="gnb">
           <ul class="flex-container">
                <li><a href="/Proj_OnedayClass/Index.jsp">Home</a></li>
                <li><a href="./about.html">About</a></li>
                <li><a href="#">Online</a></li>
                <li><a href="#">Offline</a></li>
            </ul>
        </nav>
        <!-- 네비끝 -->
        <!-- 회원가입시작 -->
		<div id="signup">
    		<form name="regFrm" id="regFrm" action="MemberProc.jsp" method="post">
        		<table>
            		<caption><hr><h3>회원가입하기</h3></caption>
            		<tbody>
                		<tr><td class="req">아이디</td></tr>
		                <tr>
		                    <td>
		                        <input type="text" id="uId" name="uId" size="27" class="umem"
		                        maxlength="20" autofocus  placeholder="아이디를 입력해주세요.">
		                <button type="button" id="idChkBtn">ID중복확인</button>
		                <input type="hidden" name="uIdBtnClickChk" id="uIdBtnClickChk" value="0">
		                    </td>
		                </tr>
		                <tr><td class="req">패스워드</td></tr>
		                <tr>
		                    <td><input type="password" class="umem" name="uPw" id="uPw" size="40"
		                        placeholder="비밀번호를 입력해주세요."></td>
		                </tr>
		                <tr>
		                    <td>
		                    <input type="password" class="umem" id="uPw_Re" size="40"
		                    placeholder="비밀번호를 한번 더 입력해주세요.">
		                    </td>
		                </tr>
		                <tr><td class="req">이름</td></tr>
		                <tr>
		                    <td>
		                        <input type="text" class="umem" name="uName" id="uName" size="40"
		                        placeholder="이름을 입력해주세요.">
		                    </td>
		                </tr>
		                <tr><td class="req">전화번호</td></tr>
						 <tr>
						     <td>
						         <input type="text" class="umem" name="uPhone" id="uPhone" size="40"
						         placeholder="전화번호를 입력해주세요.">    
						     </td>
						</tr>                        
		               	<tr><td class="req">주소</td></tr>
		               	<tr>
		                    <td>
		                        <input type="text" name="uZip" id="uZip" size="25" 
		                        class="umem" readonly placeholder="우편번호">
		                        <button type="button" id="uAddress">우편번호찾기</button>
		                    </td>
		                </tr>
		                <tr>
		                    <td>
		                        <input type="text" class="umem" id="uAddr1" name="uAddr1" size="40"
		                        readonly placeholder="주소">
		                    </td>
		                </tr>
		                <tr>
		                    <td>
		                        <input type="text" class="umem" id="uAddr2" name="uAddr2" size="40"
		                        placeholder="상세주소를 입력해주세요.">
		                    </td>
		               	</tr>
						<tr><td class="req">이메일</td></tr>
		               	<tr>
		                    <td>
		                        <input type="text" class="umem" name="uEmail" id="uEmail" size="40"
		                        placeholder="이메일 주소를 입력해주세요.">
		                    </td>
		               	</tr>
		               	<tr>
		                    <td colspan="2">
		                        <div id="chk" >
		                       		<label>
		                               	<input type="checkbox" id="allChk">
		                               		<span>전부 동의합니다.</span><br><br>
		                           	</label>
		                               <label>
		                                   <input type="checkbox" id="uChk1">
		                                       <span>만 14세 이상입니다.</span><br>
		                                 </label>
		                               <label>
		                                   <input type="checkbox" id="uChk2">
		                                       <span>이용약관에 동의합니다.</span><br>
		                               </label>
		                               <label>
		                                   <input type="checkbox" id="uChk3">
		                                       <span>개인정보수집·이용에 동의합니다.</span>
		                               </label>
		                        </div>        
		                    </td>
		               	</tr>
						<tr>
							<td colspan="2">
								<button type="button" id="joinBtn">동의하고 가입하기</button>			
							</td>
						</tr>
            		</tbody>
        		</table>              
        	</form>
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
    <!-- div#wrap -->
</body>
    <script src="/Proj_OnedayClass/script/jquery-3.6.0.min.js"></script>
	<script src="/Proj_OnedayClass/script/script.js"></script>
    <script src="/Proj_OnedayClass/script/member.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>
	