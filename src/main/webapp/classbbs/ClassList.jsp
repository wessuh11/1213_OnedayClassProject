<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="pack_ClassBbs.ClassBean, java.util.Vector" %>
<jsp:useBean id="bMgr" class="pack_ClassBbs.ClassMgr"  scope="page" />
<%
request.setCharacterEncoding("UTF-8");

int listSize = 0;   // 1페이지에서 보여주는 데이터 수
						//출력할 데이터의 개수 = 데이터 1개는 가로줄 1개
						
int nowPage = 1;          // 현재 (사용자가 보고 있는) 페이지 번호

Vector <ClassBean> vList = null;

String uId = (String)session.getAttribute("idKey");
String uName = (String)session.getAttribute("nameKey");
String uLevel = (String)session.getAttribute("levelKey");
String str1 = "3";
String str2 = "2";

%>
  
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>OneDayClass</title>
	<link rel="stylesheet" href="/Proj_OnedayClass/style/classbbs/classlist.css">
</head>
<body>
	<div id="wrap">
        <header id="header" class="flex-container">
            <div id="headerLogo">
                <a href="/Proj_OnedayClass/Index.jsp"><img src="/Proj_OnedayClass/img/logo.png" alt="로고"></a>
            </div>
            <!-- div#headerLogo -->

            <div id="headerRight">
                <ul class="flex-container">
	<%if(uId != null && str2.equals(uLevel)) { %>
	                <li><a href="/Proj_OnedayClass/sign/MyPage.jsp"><%=uName %> 선생님 환영합니다.</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/sign/Logout.jsp">로그아웃</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/classbbs/ClassPost.jsp">클래스 생성</a></li>
                    <li></li>
                    <li><a href="/Proj_OnedayClass/classbbs/ClassList.jsp">클래스 관리</a></li>

				</ul>
            </div>
            <!-- div#headerRight -->
        </header>
        <!-- header#header -->
        
        <nav id="gnb">
            <ul class="flex-container">
                <li><a href="/Proj_OnedayClass/Index.jsp">Home</a></li>
                <li><a href="./about.html">About</a></li>
                <li><a href="/Proj_OnedayClass/classbbs/ClassOnList.jsp">Online</a></li>
                <li><a href="/Proj_OnedayClass/classbbs/ClassOffList.jsp">Offline</a></li>
            </ul>
        </nav>
        <!-- nav#gnb -->
        
        
        <main id="main" class="list">
				<!-- DB 데이터 가져오기 -->
			<table id = "boardList">
				
				<%
				vList = bMgr.getBoardList();
				listSize = vList.size();			
				%> 
					
				<%
				if(vList.isEmpty()){
				%>
					<tr>
						<td colspan="5">
						<%="게시물이 없습니다." %>
						</td>
					</tr>	
				<%
				} else {
				%>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>아이디</th>
						<th>날짜</th>
					</tr>		
				<%
				for (int i=0; i<listSize; i++) {		
					
					ClassBean bean = vList.get(i);
					
					int cNum = bean.getcNum();
					String cTeacher = bean.getcTeacher();
					String cTitle = bean.getcTitle();
					String cRegDate = bean.getcRegDate();
				
				%>
				<tr class="prnTr" onclick="read('<%=cNum%>', '<%=nowPage%>')">
					<%
					%>
						<td><%=cNum %></td>
						<td><%=cTeacher %></td>
						<td><%=cTitle %></td>
						<td><%=cRegDate %></td>
					</tr>	
				<%
					}
				}
				%>
        
        
			</table>
        </main>
		<!-- Main -->	

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
            <!-- div#footerBottom -->

        </footer>
        <!-- footer#footer -->
    </div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/Proj_OnedayClass/script/classbbs.js"></script>
</body>
	<% } else { %>
	
	<script>
	
		alert("비정상적인 접속입니다.\n"
				 +"메인페이지로 이동합니다."); 
		           // 현재 메인페이지는 없기 때문에 로그인페이지로 이동
		location.href="../Index.jsp";
	
	</script>
	
<% } %>
</html>