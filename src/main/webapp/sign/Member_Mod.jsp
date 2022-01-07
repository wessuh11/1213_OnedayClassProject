<%@page import="pack_Member.MemberBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean  id="mMgr"   class="pack_Member.MemberMgr"  scope="page" />
    
<%
String sessionUId = (String)session.getAttribute("idKey");
String uName = (String)session.getAttribute("nameKey");
String uLevel = (String)session.getAttribute("levelKey");
Vector<MemberBean> vList = mMgr.modifyMember(sessionUId);
%>  

<% if (sessionUId != null) {   // 현재 로그인 상태라면  %>
<!-- ////////////////  로그인 상태 시작  ////////////////// -->

	<%
	MemberBean memBean = (MemberBean)vList.get(0);
	String uId = memBean.getuId();
	String uPw = memBean.getuPw();
	String uPhone = memBean.getuPhone();
	String uEmail = memBean.getuEmail();
	String uZip = memBean.getuZip();
	String uAddr1 = memBean.getuAddr1();
	String uAddr2 = memBean.getuAddr2();
	%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원정보 수정</title>
	<link rel="stylesheet" href="/Proj_OnedayClass/style/member.css">

</head>
<body>
	<div id="wrap">
	 <% if (uId != null) {   // 현재 로그인 상태라면  %>
        <header id="header" class="flex-container">
            <div id="headerLogo">
                <a href="/Proj_OnedayClass/Index.jsp"><img src="/Proj_OnedayClass/img/logo.png" alt="로고"></a>
            </div>

            <div id="headerRight">
                <ul class="flex-container">
                    <li><a href="/Proj_OnedayClass/sign/MyPage.jsp"><%=uName %> / 등급 : <%=uLevel %></a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/Logout.jsp">로그아웃</a></li>
                    <li></li>
                    <li>
                        <div id="headerCart">
                            <a href="#"><img src="img/cart.png" alt=""> <span>0</span></a>
                        </div>
                    </li>
                </ul>
            </div>
        </header>
	<% } else { %>
        <header id="header" class="flex-container">
            <div id="headerLogo">
                <a href="/Proj_OnedayClass/index.jsp"><img src="/Proj_OnedayClass/img/logo.png" alt="로고"></a>
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
        <%} %>
        <nav id="gnb">
            <ul class="flex-container">
                <li class="active"><a href="/Proj_OnedayClass/Index.jsp">Home</a></li>
                <li><a href="./about.html">About</a></li>
                <li><a href="#">Online</a></li>
                <li><a href="#">Offline</a></li>
            </ul>
        </nav>
	<form name="modFrm" id="modFrm" action="Member_ModProc.jsp" method="get">
	
		<table>
			<caption>회원정보 수정</caption>
				<tr>
					<td class="req">아이디</td>
					<td><%=uId %></td>
					<td></td>
				</tr> 
				<tr>
					<td class="req">패스워드</td>
					<td>
						<input type="text" name="uPw" id="uPw" size="15" value="<%=uPw%>">
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
					<td><%=uName%></td>
				</tr>
				<tr>
					<td class="req">Email</td>
					<td>
						<%=uEmail%>
					</td>
					<td>이메일을 적어주세요.</td>
				</tr>
				<tr>
					<td colspan="3" style="border-bottom: 2px solid #ddd;"></td>
				</tr>			
				<tr>
					<td>
						<input type="text" name="uZip" id="uZip" size="25" 
						class="umem" readonly value="<%=uZip%>">
						<button type="button" id="uAddress">우편번호찾기</button>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" class="umem" id="uAddr1" name="uAddr1" size="40"
						readonly value="<%=uAddr1%>">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" class="umem" id="uAddr2" name="uAddr2" size="40"
						value="<%=uAddr2%>">
				</td>
				</tr>
				<tr>
					<td colspan="3">
						<button type="button" id="modBtn">정보수정</button>
						<button type="reset">다시쓰기</button>
						<button type="button" id="mainBtn">메인으로</button>		
						<button type="button" id="logoutBtn">로그아웃</button>					
					</td>
				</tr>
			</tbody>
		</table>
	
	</form>
	<!-- document.modFrm -->


	</div>
	<!-- div#wrap -->
	
	
    <script src="/Proj_OnedayClass/script/jquery-3.6.0.min.js"></script>
	<script src="/Proj_OnedayClass/script/script.js"></script>
	<script src="/Proj_OnedayClass/script/member.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
</body>
</html>   

<!-- ////////////////  로그인 상태 끝  ////////////////// -->

<% } else { %>

	<script>
		alert("비정상적인 접속입니다.\n"
				 +"메인페이지로 이동합니다."); 
		           // 현재 메인페이지는 없기 때문에 로그인페이지로 이동
		location.href="../Index.jsp";
	
	</script>

<% } %>



