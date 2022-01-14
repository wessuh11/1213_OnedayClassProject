//################## 온라인 #################
//########### 갤러리게시판(추천) 시작 ##############
$(function(){

    let contentArray = [
	["", "", "",]
	];

    let galleryListArea = "";   // 갤러리 리스트 각 table 항목을 저장할 변수

    for (let i = 0; i < contentArray.length; i++) {
        galleryListArea += "<table class='goodsTbl'>";
        galleryListArea += "<tbody>";

        for (let j = 0; j < contentArray[i].length; j++) {

            if (j != 4)  galleryListArea += "<tr>"; 

            if (j == 0) {
                galleryListArea += "<td><a href='ClassRead.jsp'><img src='/Proj_OnedayClass/fileupload/classfileupload/thumbnail/"+ contentArray[i][j] +"' alt='이미지' width='320'></a></td>";
            } else if (j == 1) {
                galleryListArea += "<td class='goodsName'>"+contentArray[i][j]+"</td>";
            } else if (j == 2) {
                galleryListArea += "<td class='goodsDesc'>"+contentArray[i][j]+"</td>";
            } 
            if (j != 3)  galleryListArea += "</tr>";             
        }

        galleryListArea += "</tbody></table>";  
        
    }
    console.log(galleryListArea);
    $("#galleryListArea").html(galleryListArea);
});
//########### 갤러리게시판(추천) 끝 ###############

//########### 갤러리게시판(일반) 시작 ##############
$(function(){

    let contentArray2 = [
	["31.png", "클래스이름", "카테고리",]
	];
    
let galleryListArea2 = "";   // 갤러리 리스트 각 table 항목을 저장할 변수

for (let i = 0; i < contentArray2.length; i++) {
    galleryListArea2 += "<table class='goodsTbl2'>";
    galleryListArea2 += "<tbody>";

    for (let j = 0; j < contentArray2[i].length; j++) {

        if (j != 4)  galleryListArea2 += "<tr>"; 

        if (j == 0) {
            galleryListArea2 += "<td><a href='ClassRead.jsp'><img src='/Proj_OnedayClass/fileupload/classfileupload/thumbnail/"+ contentArray2[i][j] +"' alt='이미지' width='320'></a></td>";
        } else if (j == 1) {
            galleryListArea2 += "<td class='goodsName2'>"+contentArray2[i][j]+"</td>";
        } else if (j == 2) {
            galleryListArea2 += "<td class='goodsDesc2'>"+contentArray2[i][j]+"</td>";
        } 
        if (j != 3)  galleryListArea2 += "</tr>";             
    }

    galleryListArea2 += "</tbody></table>";  
    
}
console.log(galleryListArea2);
$("#galleryListArea2").html(galleryListArea2);

});
//########### 갤러리게시판(일반) 끝 ##############
//################## 온라인 끝#################
//############### 갤러리게시판.js 종료 ################

//################## 오프라인 시작#################
//########### 갤러리게시판(추천) 시작 ##############
$(function(){
    let contentArray3 = [
	["31.png", "클래스이름", "카테고리",]
	];

    let galleryListArea3 = "";   // 갤러리 리스트 각 table 항목을 저장할 변수

    for (let i = 0; i < contentArray3.length; i++) {
        galleryListArea3 += "<table class='goodsTbl3'>";
        galleryListArea3 += "<tbody>";

        for (let j = 0; j < contentArray3[i].length; j++) {

            if (j != 4)  galleryListArea3 += "<tr>"; 

            if (j == 0) {
                galleryListArea3 += "<td><a href='ClassRead.jsp'><img src='/Proj_OnedayClass/fileupload/classfileupload/thumbnail/"+ contentArray3[i][j] +"' alt='이미지' width='320'></a></td>";
            } else if (j == 1) {
                galleryListArea3 += "<td class='goodsName3'>"+contentArray3[i][j]+"</td>";
            } else if (j == 2) {
                galleryListArea3 += "<td class='goodsDesc3'>"+contentArray3[i][j]+"</td>";
            } 
            if (j != 3)  galleryListArea3 += "</tr>";             
        }

        galleryListArea3 += "</tbody></table>";  
        
    }
    console.log(galleryListArea3);
    $("#galleryListArea3").html(galleryListArea3);
});
//########### 갤러리게시판(추천) 끝 ###############

//########### 갤러리게시판(일반) 시작 ##############
$(function(){
    let contentArray4 = [
	["31.png", "클래스이름", "카테고리",]
	];
    
let galleryListArea4 = "";   // 갤러리 리스트 각 table 항목을 저장할 변수

for (let i = 0; i < contentArray4.length; i++) {
    galleryListArea4 += "<table class='goodsTbl4'>";
    galleryListArea4 += "<tbody>";

    for (let j = 0; j < contentArray4[i].length; j++) {

        if (j != 4)  galleryListArea4 += "<tr>"; 

        if (j == 0) {
            galleryListArea4 += "<td><a href='ClassRead.jsp'><img src='/Proj_OnedayClass/fileupload/classfileupload/thumbnail/"+ contentArray4[i][j] +"' alt='이미지' width='320'></a></td>";
        } else if (j == 1) {
            galleryListArea4 += "<td class='goodsName4'>"+contentArray4[i][j]+"</td>";
        } else if (j == 2) {
            galleryListArea4 += "<td class='goodsDesc4'>"+contentArray4[i][j]+"</td>";
        } 
        if (j != 3)  galleryListArea4 += "</tr>";             
    }

    galleryListArea4 += "</tbody></table>";  
    
}
console.log(galleryListArea4);
$("#galleryListArea4").html(galleryListArea4);

});