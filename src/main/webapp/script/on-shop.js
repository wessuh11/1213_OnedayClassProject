//################## 온라인 #################
//########### 갤러리게시판(추천) 시작 ##############
$(function(){

    let contentArray = [

        ["2.png", "클래스이름", 
        "카테고리",]
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
//########### 갤러리게시판(추천) 끝 ###############

//########### 갤러리게시판(일반) 시작 ##############
let contentArray2 = [
    
    ["2.png", "클래스이름", 
    "카테고리",]
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
//########### 갤러리게시판(일반) 끝 ##############
//################## 온라인 끝#################
//############### 갤러리게시판.js 종료 ################

    function fnNumComma(param) {
        let num = Number(param);
        return num.toLocaleString();
    }

});