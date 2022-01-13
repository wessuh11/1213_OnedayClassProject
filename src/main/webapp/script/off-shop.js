
//################## 오프라인 시작#################
//########### 갤러리게시판(추천) 시작 ##############
$(function(){
    let contentArray3 = [
        
        ["4.png", "클래스이름",
        "카테고리",
        ],
        
        ["5.png", "클래스이름",
        "카테고리", 
        ],
        
        ["6.png", "클래스이름", 
        "카테고리",]
        ];

    let galleryListArea3 = "";   // 갤러리 리스트 각 table 항목을 저장할 변수

    for (let i = 0; i < contentArray3.length; i++) {
        galleryListArea3 += "<table class='goodsTbl3'>";
        galleryListArea3 += "<tbody>";

        for (let j = 0; j < contentArray3[i].length; j++) {

            if (j != 4)  galleryListArea3 += "<tr>"; 

            if (j == 0) {
                galleryListArea3 += "<td><a href='ClassRead.jsp'><img src='/Proj_OnedayClass/img/shop/"+ contentArray3[i][j] +"' alt='이미지' width='320'></a></td>";
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
//########### 갤러리게시판(추천) 끝 ###############

//########### 갤러리게시판(일반) 시작 ##############
let contentArray4 = [
    ["1.png", "클래스이름",
    "카테고리",
    ],
    
    ["2.png", "클래스이름",
    "카테고리", 
    ],

    ["3.png", "클래스이름",
    "카테고리", 
    ],

    ["4.png", "클래스이름",
    "카테고리", 
    ],

    ["5.png", "클래스이름",
    "카테고리", 
    ],
    
    ["6.png", "클래스이름", 
    "카테고리",]
    ];
    
let galleryListArea4 = "";   // 갤러리 리스트 각 table 항목을 저장할 변수

for (let i = 0; i < contentArray4.length; i++) {
    galleryListArea4 += "<table class='goodsTbl4'>";
    galleryListArea4 += "<tbody>";

    for (let j = 0; j < contentArray4[i].length; j++) {

        if (j != 4)  galleryListArea4 += "<tr>"; 

        if (j == 0) {
            galleryListArea4 += "<td><a href='ClassRead.jsp'><img src='/Proj_OnedayClass/img/shop/"+ contentArray4[i][j] +"' alt='이미지' width='320'></a></td>";
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
//########### 갤러리게시판(일반) 끝 ##############
//################## 오프라인 끝#################

//############### 갤러리게시판.js 종료 ################

        function fnNumComma(param) {
            let num = Number(param);
            return num.toLocaleString();
        }
    
});