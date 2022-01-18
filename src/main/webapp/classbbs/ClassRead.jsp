<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pack_ClassBBS.ClassBean" %>
<jsp:useBean id="bMgr" class="pack_ClassBBS.ClassMgr"  scope="page" />
    
<%
request.setCharacterEncoding("UTF-8");

String uId = (String)session.getAttribute("idKey");
String uName = (String)session.getAttribute("nameKey");
String uLevel = (String)session.getAttribute("levelKey");

//로그인 등급 변수
String AdminNum = "3";
String TeaNum = "2";

int numParam = Integer.parseInt(request.getParameter("cNum")); //현재 페이지 번호
String nowPage = request.getParameter("nowPage");

ClassBean bean = bMgr.getBoard(numParam);

int cNum = bean.getcNum(); //클래스 게시판 번호 //현재 페이지 번호
String cTeacher = bean.getcTeacher(); //강사이름
String cUid = bean.getcUid(); //글 아이디
String cCategory = bean.getcCategory(); //클래스 카테고리
String cTitle = bean.getcTitle(); //클래스 제목
String cContent= bean.getcContent(); //클래스 설명
String cRegDate= bean.getcRegDate(); //클래스 작성날짜
int cLikes	= bean.getcLikes();
//카우링 스탈 밤하늘의 퍼어얼

int cPrice= bean.getcPrice(); //클래스 가격
int cDelivery= bean.getcDelivery(); //배송비

String cThumbName= bean.getcThumbName(); //썸네일 이름
int cThumbSize= bean.getcThumbSize(); //썸네일 크기저장
String cFileName= bean.getcFileName(); //파일이름 
int cFileSize= bean.getcFileSize(); //크기저장

int cMaxStu= bean.getcMaxStu(); //최대 수강인원
int cApplyStu= bean.getcApplyStu(); //수강신청 인원


//카테고리 넘버
String cCategory1 = "1";
String cCategory2 = "2";
String cCategory3 = "3";
String cCategory4 = "4";
String cCategory5 = "5";
String cCategory6 = "6";
String cCategory7 = "7";

//수강인원 꽉차면 닫아줌

session.setAttribute("bean", bean);
//불러온 모든걸 세션으로 만들어줌!!
//Ajax 사용시 
%>  
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>클래스 상세페이지</title>
	<link rel="stylesheet" href="/Proj_OnedayClass/style/classbbs/classread.css">
</head>
<body>
	<div id="wrap">
	<%@include file="../include/Header.jsp"%>
        
        <div id="main">
        	
         <div id="details" class="flex-container">       
        	<div id="thumbnail">
        	 	<table>
        	 	<tr>
        	 		<td class="thumimg">
        	 			<img src="/Proj_OnedayClass/fileupload/classfileupload/<%=cThumbName%>" alt="썸네일"
        	 			width ="490px" height = "345px">
        	 		</td>
        	 	</tr>
        	 	</table>
        	</div>
        	<!-- div#thumbnail -->
        	
        	<div id="thumbinfo">
        		<table>
        			
        			<tr>
        				<td colspan ="2" class="cCategory">[<%
        				if(cCategory1.equals(cCategory)){
        					cCategory = "핸드 메이드";
        				} else if(cCategory2.equals(cCategory)){
        					cCategory = "쿠킹";
        				} else if(cCategory3.equals(cCategory)){
        					cCategory = "드로잉";
        				} else if(cCategory4.equals(cCategory)){
        					cCategory = "음악";
        				} else if(cCategory5.equals(cCategory)){
        					cCategory = "요가·필라테스";
        				} else if(cCategory6.equals(cCategory)){
        					cCategory = "레져·스포츠";
        				} else if(cCategory7.equals(cCategory)){
        					cCategory = "반려동물";
        				} else {
        					cCategory = "자기계발";
        				}
      					 %><%= cCategory %>] <%= cTeacher %></td>
        			</tr>
        			<tr>
        				<td colspan ="2" class="cTitle"><%= cTitle	%></td>
        			</tr>
        			<tr>
        				<td colspan ="2" class="cContent"><%= cContent %></td>
        			</tr>
        			<tr>
        				<td colspan ="2" class="cPrice">수강료 : <%= cPrice %> 원</td>
        			</tr>
        			<tr>
        				<td colspan ="2" class="cDelivery">배송비 : <%= cDelivery %> 원</td>
        			</tr>
        			<tr>
        				<td colspan ="2" class="persons"> 인원수 : <%= cApplyStu %> / <%= cMaxStu %></td>
        			</tr>
        		</table>
        		
        		<% if(cApplyStu >= cMaxStu) { %>
        		<table>
        			<tr>
        			    <td>
        			    	<button type="button" class="buy">마감 되었습니다</button>
        			    </td>
        			</tr>
        		</table>
        		<% } else { %>
        		<table>
        			<tr>
        			    <td>
        			    	<button type="button" class="like" id="likeBtn" onClick="location.href='ClassLikeAction.jsp?cNum=<%= cNum %>&uId=<%=uId%>'">♥</button>
        			    </td>
        				<td>
        					<button type="button" class="buy" id="buy">클래스 신청하기</button>
        				</td>
        				<td>
        					<button type="button" class="put" id="put" onClick="location.href='장바구니?cNum=<%= cNum %>&uId=<%=uId%>'">담기</button>
        				</td>
        				<!-- 결제페이지 이동 -->
        			</tr>
        		</table>
        		<%} %>
        		
        	</div>
        </div>
        <!-- div#info -->
        
       <% if(uId != null && AdminNum.equals(uLevel)) { %>
	    <div id="teacherbtn">
		    <table>
			    <tr>
			        <td>
		        		<button type="button" class="teacherchoice" id ="AdminBtn">승인</button>
		           </td>
		          	<td>
		        		<button type="button" class="teacherchoice" id ="delBtn">삭제</button>
		        	</td>
			    </tr>
		    </table>
	    </div>
	    <!-- div#teacherbtn 선생님만 보이도록 구현-->
	    <%} %>
        
        
	    <% if(uId != null && TeaNum.equals(uLevel)) { %>
	    <div id="teacherbtn">
		    <table>
			    <tr>
			        <td>
		        		<button type="button" class="teacherchoice" id ="modBtn">클래스 수정</button>
		           </td>
		        	<td>
		        		<button type="button" class="teacherchoice" id ="delBtn">클래스 삭제</button>
		        	</td>
			    </tr>
		    </table>
	    </div>
	    <!-- div#teacherbtn 선생님만 보이도록 구현-->
	    <% }  %>
	   
	    <input type="hidden" name="nowPage" value="<%=nowPage%>" id="nowPage">
		<input type="hidden" name="cNum" value="<%=numParam%>" id="cNum">
		
	    
	    <div id="boardmenu">
	    	 <ul class="flex-container">
                    <li><a href="#">상세</a></li>
                    <li><a href="#">리뷰</a></li>
                    <li><a href="#">문의</a></li>
              </ul>
	    </div>
	    <!-- div#boardmenu -->

		<!-- div#details -->
        	<div id="info">
        		<table>
        			<tr>
        				<td>
        				<img src="/Proj_OnedayClass/fileupload/classfileupload/<%=cFileName%>" alt="상세정보"
        	 			width ="1000">
        				</td>
        			</tr>
        		</table>
        	</div>
        	<!-- div#info -->
        </div>
        <!-- div#main -->
        
			<%@include file="../include/Footer.jsp"%>
		</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/Proj_OnedayClass/script/classbbs.js"></script>
</body>
</html>