<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="pack_ClassBbs.ClassBean, java.util.Vector"%>
<jsp:useBean id="bMgr" class="pack_ClassBbs.ClassMgr" scope="page" />

<%
request.setCharacterEncoding("UTF-8");

int totalRecord = 0; // 전체 데이터 수(DB에 저장된 row 개수)
int numPerPage = 9; // 페이지당 출력하는 데이터 수(=게시글 숫자)
int pagePerBlock = 5; // 블럭당 표시되는 페이지 수의 개수
int totalPage = 0; // 전체 페이지 수
int totalBlock = 0; // 전체 블록수

/*
totalRecord=> 200     전체레코드
numPerPage => 10
pagePerBlock => 5
totalPage => 20
totalBlock => 4  (20/5 => 4)
*/

int nowPage = 1; // 현재 (사용자가 보고 있는) 페이지 번호
int nowBlock = 1; // 현재 (사용자가 보고 있는) 블럭

int start = 0; // DB에서 데이터를 불러올 때 시작하는 인덱스 번호
int end = 9; // 시작하는 인덱스 번호부터 반환하는(=출력하는) 데이터 개수 
// select * from T/N where... order by ... limit start, end;

int listSize = 0; // 1페이지에서 보여주는 데이터 수
//출력할 데이터의 개수 = 데이터 1개는 가로줄 1개

String uId = (String) session.getAttribute("idKey");
String uName = (String) session.getAttribute("nameKey");
String uLevel = (String) session.getAttribute("levelKey");

//str1= 관리자, str2는 강사
String str1 = "3";
String str2 = "2";

//온&오프 클래스 유무
String on = "N";
String off = "Y";

String cCategory1 = "1";
String cCategory2 = "2";
String cCategory3 = "3";
String cCategory4 = "4";
String cCategory5 = "5";
String cCategory6 = "6";
String cCategory7 = "7";

String cCategorySel = ""; // DB의 카테고리

/*
if (request.getParameter("cCategory") != null) {
	cCategorySel = request.getParameter("cCategory");
	//카테고리 선택값이 없다면 전체 페이지 출력?
}
*/

if (request.getParameter("nowPage") != null) {
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
	start = (nowPage * numPerPage) - numPerPage;
	end = numPerPage;
	//카테고리 선택값이 있다면 해당 카테고리에 대한 게시물만 출력
}

totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);


Vector<ClassBean> vList = null;
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>온라인 클래스</title>
<link rel="stylesheet"
	href="/Proj_OnedayClass/style/classbbs/onshop.css">
</head>
<body>
	<div id="wrap">
		<%@include file="../include/Header.jsp"%>
		<nav id="gnb">
			<ul class="flex-container">
				<li><a href="/Proj_OnedayClass/Index.jsp">Home</a></li>
				<li><a href="#">About</a></li>
				<li class="active"><a
					href="/Proj_OnedayClass/classbbs/ClassOnList.jsp">Online</a></li>
				<li><a href="/Proj_OnedayClass/classbbs/ClassOffList.jsp">Offline</a></li>
			</ul>
		</nav>
		
		<!-- 카테고리 시작-->
		<div id="category">
			<ul id="tagList" class="cCategorySel">
				<li class="devTagList" value="1"
					<%if (cCategorySel.equals("1"))out.print("selected");%>>핸드메이드</li>
				<!-- 1번 카테고리 전체출력.. -->
				<li class="devTagList" value="2"
					<%if (cCategorySel.equals("2"))out.print("selected");%>>쿠킹</li>
				<!-- 2번 카테고리 전체출력.. -->
				<li class="devTagList" value="3"
					<%if (cCategorySel.equals("3"))out.print("selected");%>>드로잉</li>
				<!-- 3번 카테고리 전체출력.. -->
				<li class="devTagList" value="4"
					<%if (cCategorySel.equals("4"))out.print("selected");%>>음악</li>
				<!-- 4번 카테고리 전체출력.. -->
				<li class="devTagList" value="5"
					<%if (cCategorySel.equals("5"))out.print("selected");%>>요가·필라테스</li>
				<!-- 5번 카테고리 전체출력.. -->
				<li class="devTagList" value="6"
					<%if (cCategorySel.equals("6"))out.print("selected");%>>레져·스포츠</li>
				<!-- 6번 카테고리 전체출력.. -->
				<li class="devTagList" value="7"
					<%if (cCategorySel.equals("7"))out.print("selected");%>>반려동물</li>
				<!-- 7번 카테고리 전체출력.. -->
				<li class="devTagList" value="8"
					<%if (cCategorySel.equals("8"))out.print("selected");%>>자기계발</li>
				<!-- 8번 카테고리 전체출력.. -->
			</ul>
			
			<input type="hidden" id="pKeyField" value="<%=cCategorySel%>">
		</div>
		<!-- div#category -->
		<!-- 카테고리 종료-->

		<!-- 온라인 게시판 시작 -->
		<div id="Gallerybbs">
			
			<!-- 추천리스트 갤러리 시작 -->
			<div id="goodsPart" class="flex-container">
				<h2>★ 오늘의 원데이 추천 클래스 ★</h2>
				<span>HOME | Online</span>
			</div>
			<!-- div#goodsPart 끝 -->

			<!-- main#galleryListArea 추천 게시물 시작 -->
			<main id="galleryListArea">
				<table id="goodsTbl">
					<%
					vList = bMgr.getBoardList(cCategorySel, start, end);
					listSize = vList.size();
					%>
					<tbody class=" flex-container">

						<%
						if (vList.isEmpty()) {
						%>
						<tr>
							<td colspan="6"><%="게시물이 없습니다."%></td>
						</tr>
						<%
						} else {

						for (int i = 0; i < listSize; i++) {
							ClassBean bean = vList.get(i);
							
							int cNum = bean.getcNum();
							//게시글 넘버
							String cThumbName = bean.getcThumbName();
							//게시글 썸네일
							String cCategory = bean.getcCategory();
							//카테고리
							String cTitle = bean.getcTitle();
							//제목
							int cStatus = bean.getcStatus();
							//글 속성, 공개 비공개 여부
							String cOnoff = bean.getcOnoff();
							//클래스 on(N), off(Y) 여부
							int cLikes = bean.getcLikes();
							//좋아요
							
							if (cStatus == 2 && on.equals(cOnoff)) {
								//if (cStatus == 2 && off.equals(cOnoff)) {
						%>
						<tr class="prnTr" onclick="read('<%=cNum%>', '<%=nowPage%>')">
							<td><a href="#"> <img
									src="/Proj_OnedayClass/fileupload/classfileupload/<%=cThumbName%>"
									alt='이미지' width='310'></a></td>
							<!-- 상품이미지 -->
							<td class='goodsName'>
								<%
								if (cCategory1.equals(cCategory)) {
									cCategory = "핸드 메이드";
								} else if (cCategory2.equals(cCategory)) {
									cCategory = "쿠킹";
								} else if (cCategory3.equals(cCategory)) {
									cCategory = "드로잉";
								} else if (cCategory4.equals(cCategory)) {
									cCategory = "음악";
								} else if (cCategory5.equals(cCategory)) {
									cCategory = "요가·필라테스";
								} else if (cCategory6.equals(cCategory)) {
									cCategory = "레져·스포츠";
								} else if (cCategory7.equals(cCategory)) {
									cCategory = "반려동물";
								} else {
									cCategory = "자기계발";
								}
								%><%=cCategory%>
							</td>
							<!-- cCategory -->
							<td class='goodsDesc'><%=cTitle%></td>
							<!-- cTitle -->
						</tr>
						<%
						}
						}
						}
						%>
					</tbody>
				</table>
				<!-- table.goodsTbl 상품출력용 테이블 -->
				
			</main>
			<!-- main#galleryListArea 끝-->
			<!-- 추천리스트 갤러리 끝 -->

			<!-- 일반리스트 갤러리 시작 -->
			<!-- 최신순, 리뷰순 -->
			<div id="allclass" class="flex-container">
				<h3>★ 온라인 클래스 ★</h3>
			</div>
			<!-- div#allclass 최신순, 리뷰순 끝-->

			<div id="BasicList">
				<!-- main#galleryListArea 시작 -->
				<main id="galleryListArea2">
					<table class='goodsTbl2'>
						<%
						vList = bMgr.getBoardList2(cCategorySel, start, end);
						listSize = vList.size();
						%>
						<tbody>
							<%
							if (vList.isEmpty()) {
							%>
							<tr>
								<td colspan="6"><%="게시물이 없습니다."%></td>
							</tr>
							<%
							} else {
							%>
							<%
							for (int i = 0; i < listSize; i += 3) {
							%>
							<tr>
								<%
								for (int j = 0; j < 3; j++) {

									ClassBean bean = vList.get(i + j);

									int cNum = bean.getcNum();
									//게시글 넘버
									String cThumbName = bean.getcThumbName();
									String cCategory = bean.getcCategory();
									//카테고리
									String cTitle = bean.getcTitle();
									//제목
									int cStatus = bean.getcStatus();
									//글 속성, 공개 비공개 여부
									String cOnoff = bean.getcOnoff();
									//클래스 on(N), off(Y) 여부

									if (cStatus == 2 && on.equals(cOnoff)) {
										//if (cStatus == 2 && off.equals(cOnoff)) {
								%>
								<td onclick="read('<%=cNum%>', '<%=nowPage%>')">
									<!-- 1 -->
									<div>
										<a href="#"> <img
											src="/Proj_OnedayClass/fileupload/classfileupload/<%=cThumbName%>"
											alt='이미지' width='310'>
										</a>
									</div>

									<div>
										<%
										if (cCategory1.equals(cCategory)) {
											cCategory = "핸드 메이드";
										} else if (cCategory2.equals(cCategory)) {
											cCategory = "쿠킹";
										} else if (cCategory3.equals(cCategory)) {
											cCategory = "드로잉";
										} else if (cCategory4.equals(cCategory)) {
											cCategory = "음악";
										} else if (cCategory5.equals(cCategory)) {
											cCategory = "요가·필라테스";
										} else if (cCategory6.equals(cCategory)) {
											cCategory = "레져·스포츠";
										} else if (cCategory7.equals(cCategory)) {
											cCategory = "반려동물";
										} else {
											cCategory = "자기계발";
										}
										%>
										<%=cCategory%>
									</div>

									<div>
										<%=cTitle%>
									</div>
								</td>
								<%
								}
								%>
							<%
							if ((i + j) == (listSize - 1)) {
								i += j;

								break;
							}
							}
							%>
							</tr>
							<%
							}
							}
							%>

						</tbody>
					
					</table>
					<!-- table.goodsTbl 상품출력용 테이블 -->

				</main>
				<!-- main#galleryListArea 끝-->
			</div>
			<!-- main#galleryListArea 종료 -->
		</div>
		<!-- div#BasicList -->
		<!-- 일반리스트 갤러리 종료 -->

		<%@include file="../include/Footer.jsp"%>
	</div>

	<script src="/Proj_OnedayClass/script/jquery-3.6.0.min.js"></script>
	<!-- <script src="/Proj_OnedayClass/script/classbbs.js"></script>  -->
	<!-- <script src="/Proj_OnedayClass/script/onoffshop.js"></script>-->
</body>
</html>