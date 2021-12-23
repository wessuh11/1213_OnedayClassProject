<%@page import="pack_Member.MemberBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean  id="mMgr"   class="pack_Member.MemberMgr"  scope="page" />
    
<%
String sessionUId = (String)session.getAttribute("idKey");
Vector<MemberBean> vList = mMgr.modifyMember(sessionUId);
%>  

<% if (sessionUId != null) {   // 현재 로그인 상태라면  %>
<!-- ////////////////  로그인 상태 시작  ////////////////// -->

	<%
	MemberBean memBean = (MemberBean)vList.get(0);
	String uId = memBean.getuId();
	String uPw = memBean.getuPw();
	String uName = memBean.getuName();
	String uPhone = memBean.getuPhone();
	String address1 = memBean.getAddress1();
	String address2 = memBean.getAddress2();
	String address3 = memBean.getAddress3();
	String uEmail = memBean.getuEmail();
	String store_Name = memBean.getStore_Name();
	String m_Sns = memBean.getM_Sns();
	%>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원정보 수정</title>
	<style>
	* {
		box-sizing: border-box;
	}
	div#wrap {
		width: 680px;
		padding: 10px;
/*		border: 1px solid #000;  */
		margin: 10px auto;
	}
	
	table {
		width: 100%;
/*		border: 1px solid #000;  */
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		$(function(){
			
			
			////////////// 유효성 검사 시작 //////////////////////
			
			$("#modBtn").click(function(){
				
				let uPw = $("#uPw").val();
				let uPw_Re = $("#uPw_Re").val();
				let uName = $("#uName").val();
				
				if (uPw == "") {     // 비밀번호 검사 시작
					alert("비밀번호를 입력하세요.");
					$("#uPw").focus();
				} else if (uPw != uPw_Re) {     // 비밀번호 동일검사 시작
					alert("비밀번호가 다릅니다. 확인 후 다시 입력하세요.");
					$("#uPw_Re").val("");
					$("#uPw").focus();
				} else if (uName == "") {     // 이름 검사 시작
					alert("이름을 입력하세요.");
					$("#uName").focus();
				} else {
					$("#modFrm").submit();
				}
				
			});
			////////////// 유효성 검사 끝 //////////////////////
			

			///////////  로그인 페이지 이동 시작 ////////////////
			$("#logoutBtn").click(function(){
				location.href = "Logout.jsp";
			});

			///////////  메인 페이지 이동 시작 ////////////////
			$("#mainBtn").click(function(){
				location.href = "../index.jsp";
			});
			
		});	
	</script>
</head>
<body>
	<div id="wrap">
	
	<form name="modFrm" id="modFrm" action="Member_ModProc.jsp" method="get">
	
		<table>
			<caption>
				<img src="../img/member/logo.png" alt="" width ="250">
			</caption>
			<tbody>
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
					<td>이름</td>
					<td>
						<input type="text" name="uName" id="uName" size="15"
						   value="<%=uName%>">
					</td>
					<td>이름을 적어주세요.</td>
				</tr>
				<tr>
					<td class="req">핸드폰</td>
					<td>
						<input type="text" name="uPhone" id="uPhone" size="15"
						 value="<%=uPhone%>">
					</td>
					<td>(-제외)</td>
				</tr>
				<tr>
					<td class="req">Email</td>
					<td>
						<input type="text" name="uEmail" id="uName" size="15"
						 value="<%=uEmail%>">
					</td>
					<td>이메일을 적어주세요.</td>
				</tr>
				<tr>
					<td>주소</td>
						<td>
							<input type="text" name="address1" id="address1" size="20" 
							class="uAddr" readonly placeholder="우편번호">
							<button type="button" id="uAddress">우편번호찾기</button>
						</td>
					</tr>
				<tr>
					<td></td>
					<td>
						<input type="text" class="uAddr" id="address2" name="address2" size="20">
					</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input type="text" id="address3" name="address3" size="30"  placeholder="상세주소">
					</td>
				</tr>			
				<tr>
					<td colspan="3" style="border-bottom: 2px solid #ddd;"></td>
				</tr>
				<tr>
					<td class="req">상호명</td>
					<td>
						<input type="text" name="store_Name" id="store_Name" size="15"
						 value="<%=store_Name%>">
					</td>
					<td>선생님만!!</td>
				</tr>
				<tr>
					<td class="req">SNS</td>
					<td>
						<input type="text" name="m_Sns" id="m_Sns" size="15"
						 value="<%=m_Sns%>">
					</td>
					<td>선생님만!!</td>
				</tr>
				<tr>
					<td colspan="3" style="border-bottom: 2px solid #ddd;"></td>
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
	
	
	<script src="script/script.js"></script>    
</body>
</html>   

<!-- ////////////////  로그인 상태 끝  ////////////////// -->

<% } else { %>

	<script>
		alert("비정상적인 접속입니다.\n"
				 +"메인페이지로 이동합니다."); 
		           // 현재 메인페이지는 없기 때문에 로그인페이지로 이동
		location.href="../index.jsp"; 
	
	</script>

<% } %>

	<script>
	/////////////////    카카오API      /////////////////
	window.onload = function(){
	    document.getElementById("uAddress").addEventListener("click", function(){ //주소입력칸을 클릭하면
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
   /////////////////    카카오API      /////////////////
	</script>



