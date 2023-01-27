/**
 * 
 */
/*          캘린더 시작          */
var today = new Date();
function buildCalendar() {
    var row = null
    var cnt = 0;
    var calendarTable = document.getElementById("calendar");
    var calendarTableTittle = document.getElementById("calendarTitle");
    calendarTableTittle.innerHTML = today.getFullYear() + "년" + (today.getMonth() + 1) + "월";

    /*첫날과 마지막날 구하기*/
    //년도 , 달 , 0-> 하루전날 , -1 -> 이틀전
    var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
    var lastDate = new Date(today.getFullYear(), today.getMonth() +1, 0);



    /*테이블 초기화*/
    while (calendarTable.rows.length > 2) {
        calendarTable.deleteRow(calendarTable.rows.length - 1);
    }


    row = calendarTable.insertRow();
    // 공백넣기 ( 요일 전까지 insertcell를 통한 공백값넣기)
    for (i = 0; i < firstDate.getDay(); i++) {
        cell = row.insertCell();
        cnt += 1;
    }

    // 달력에 마지막 날까지 값넣기
    for(i=1;i<=lastDate.getDate();i++){
        cell = row.insertCell();
        cnt+=1;

        cell.setAttribute('id',i);
        cell.innerHTML = i;
        $(cell).css({
            "color":"gray"
        });
        cell.align = "center";

        if (cnt % 7 == 1) {

            $(cell).css({
                "color":"#F79DC2"
            });
        }

        if (cnt % 7 == 0){

            $(cell).css({
                "color":"skyblue"
            });
            row = calendar.insertRow();
        }
        cell.onclick = function(){

            clickedYear = today.getFullYear();
            clickedMonth = ( 1 + today.getMonth() );
            clickedDate = this.getAttribute('id');

            clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;
            clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
            clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;
            console.log(clickedYMD)
            $(this).css({
               "background":"#00DBAF",
                "color":"white"
            });

//            opener.document.getElementById("date").value = clickedYMD;
//             self.close();
        }


    }

    if(cnt % 7 != 0){
        for(i = 0; i < 7 - (cnt % 7); i++){
            cell = row.insertCell();
        }
    }
}
function prevCalendar(){
    today = new Date (today.getFullYear(), today.getMonth()-1, today.getDate());
    buildCalendar();
}
function nextCalendar(){
    today = new Date (today.getFullYear(), today.getMonth()+1, today.getDate());
    buildCalendar();
}
/*          캘린더 종료          */

$(function(){

    const rate=5;
    const max=5;
    const percent= rate/max*100;
    $(".score_wrap").find(".foreground").css("width",percent+"%");



});



$(document).ready(function(){
    var location1 = document.querySelector("#space").offsetTop;
    var location2 = document.querySelector("#box").offsetTop;
    var location3 = document.querySelector("#caution").offsetTop;
    var location4 = document.querySelector("#position").offsetTop;
    var location5 = document.querySelector("#QA").offsetTop;
    var location6 = document.querySelector("#review").offsetTop;
    var location7 = document.querySelector("#footer").offsetTop;

   $("#li_space").on('click',function (){
       window.scrollTo({top:location1-150, behavior:'smooth'});
       $(this).find("a").css({
           "background-color": "#00DBAF",
           "color": "white",
           "border-radius": "21px 21px 21px 21px",
           "z-index": "1"
       });
   });
    $("#li_box").on('click',function (){
        window.scrollTo({top:location2-150, behavior:'smooth'});
        $(this).find("a").css({
            "background-color": "#00DBAF",
            "color": "white",
            "border-radius": "21px 21px 21px 21px",
            "z-index": "1"
        });
    });
    $("#li_caution").on('click',function (){
        window.scrollTo({top:location3-150, behavior:'smooth'});
        $(this).find("a").css({
            "background-color": "#00DBAF",
            "color": "white",
            "border-radius": "21px 21px 21px 21px",
            "z-index": "1"
        });
    });
    $("#li_map").on('click',function (){
        window.scrollTo({top:location4-150, behavior:'smooth'});
        $(this).find("a").css({
            "background-color": "#00DBAF",
            "color": "white",
            "border-radius": "21px 21px 21px 21px",
            "z-index": "1"
        });
    });
    $("#li_QA").on('click',function (){
        window.scrollTo({top:location5-150, behavior:'smooth'});
        $(this).find("a").css({
            "background-color": "#00DBAF",
            "color": "white",
            "border-radius": "21px 21px 21px 21px",
            "z-index": "1"
        });
    });
    $("#li_review").on('click',function (){
        window.scrollTo({top:location6-150, behavior:'smooth'});
        $(this).find("a").css({
            "background-color": "#00DBAF",
            "color": "white",
            "border-radius": "21px 21px 21px 21px",
            "z-index": "1"
        });
    });

    $(".call_li").on('click',function (){
        var now_t= (($(window).height()-$(".modal-overlay").outerHeight())/2+$(window).scrollTop())+"px";
        var now_l= (($(window).width()-$(".modal-overlay").outerWidth())/2+$(window).scrollLeft())+"px";
        $("#modal_call").css({
            "display": "flex",

        });
        $(".modal-window").css({

            "top":now_t,
            "left":now_l

        });
    });

    $(".QA_btn").on('click',function (){
        var now_t= (($(window).height()-$(".modal-overlay").outerHeight())/2+$(window).scrollTop())+"px";
        var now_l= (($(window).width()-$(".modal-overlay").outerWidth())/2+$(window).scrollLeft())+"px";
        $("#modal_QA").css({
            "display": "flex",

        });
        $(".modal-window").css({

            "top":now_t,
            "left":now_l

        });
    });

    const modal = document.getElementById("modal_call")
    modal.addEventListener("click",e =>{
        const evTarget =e.target
        if(evTarget.classList.contains("modal-overlay")){
            modal.style.display="none"
        }
    } )
    window.addEventListener("keyup", e => {
        if(modal.style.display==="flex" && e.key==="Escape"){
            modal.style.display="none"
        }
    })
    $(".close-area").on('click',function (){

        $(".modal-overlay").css({
            "display": "none"
        });
    });
    $(".confirm_btn").on('click',function (){

        $(".modal-overlay").css({
            "display": "none"
        });
    });
    const modal_QA = document.getElementById("modal_QA")
    modal_QA.addEventListener("click",e =>{
        const evTarget =e.target
        if(evTarget.classList.contains("modal-overlay")){
            modal_QA.style.display="none"
        }
    } )
    window.addEventListener("keyup", e => {
        if(modal_QA.style.display==="flex" && e.key==="Escape"){
            modal_QA.style.display="none"
        }
    })

    $(".op_box").on('click',function (){

        $(".after_btn").css({
            "opacity": "0"

        });
        $(".o_price").find("span").css({
            "color":"gray"

        });
        $(".op_box").find("th").css({
            "color":"gray"

        });
        
        $("#calendar").show();
        buildCalendar()
        if($(this).find(".after_btn").css("opacity") === "0") {
            $(this).find(".after_btn").css({
                "opacity": "1"

            });

            $(this).find(".o_price").find("span").css({
                "color":"#00DBAF"
            });
            $(this).find("th").css({
                "color":"black"
            });
        }
        else{
            $(this).css({
                "opacity": "0"

            });
        }
    });




    $(window).scroll(function() {
        $('#space').each(function (i) {
            var bottom_of_window = $(window).scrollTop() ;
            if (bottom_of_window >= location1-200) {
                $("#li_space").find("a").css({
                    "background-color": "#00DBAF",
                    "color": "white",
                    "border-radius": "21px 21px 21px 21px",
                    "z-index": "1"
                });
            }
            if(location2-200<=bottom_of_window||bottom_of_window < location1-200){
                $("#li_space").find("a").css({
                    "background-color": "white",
                    "color": "#00DBAF",
                    "border-radius": "21px 21px 21px 21px",
                    "z-index": "1"
                });

            }
            if (bottom_of_window >= location2-200) {
                $("#li_box").find("a").css({
                    "background-color": "#00DBAF",
                    "color": "white",
                    "border-radius": "21px 21px 21px 21px",
                    "z-index": "1"
                });
            }
            if(location3-200<=bottom_of_window||bottom_of_window < location2-200){
                $("#li_box").find("a").css({
                    "background-color": "white",
                    "color": "#00DBAF",
                    "border-radius": "21px 21px 21px 21px",
                    "z-index": "1"
                });

            }
            if (bottom_of_window >= location3-200) {
                $("#li_caution").find("a").css({
                    "background-color": "#00DBAF",
                    "color": "white",
                    "border-radius": "21px 21px 21px 21px",
                    "z-index": "1"
                });
            }
            if(location4-200<=bottom_of_window||bottom_of_window < location3-200){
                $("#li_caution").find("a").css({
                    "background-color": "white",
                    "color": "#00DBAF",
                    "border-radius": "21px 21px 21px 21px",
                    "z-index": "1"
                });

            }
            if (bottom_of_window >= location4-200) {
                $("#li_map").find("a").css({
                    "background-color": "#00DBAF",
                    "color": "white",
                    "border-radius": "21px 21px 21px 21px",
                    "z-index": "1"
                });
            }
            if(location5-200<=bottom_of_window||bottom_of_window < location4-200){
                $("#li_map").find("a").css({
                    "background-color": "white",
                    "color": "#00DBAF",
                    "border-radius": "21px 21px 21px 21px",
                    "z-index": "1"
                });

            }
            if (bottom_of_window >= location5-200) {
                $("#li_QA").find("a").css({
                    "background-color": "#00DBAF",
                    "color": "white",
                    "border-radius": "21px 21px 21px 21px",
                    "z-index": "1"
                });
            }
            if(location6-200<=bottom_of_window||bottom_of_window < location5-200){
                $("#li_QA").find("a").css({
                    "background-color": "white",
                    "color": "#00DBAF",
                    "border-radius": "21px 21px 21px 21px",
                    "z-index": "1"
                });

            }
            if (bottom_of_window >= location6-200) {
                $("#li_review").find("a").css({
                    "background-color": "#00DBAF",
                    "color": "white",
                    "border-radius": "21px 21px 21px 21px",
                    "z-index": "1"
                });
            }
            if(location7-200<=bottom_of_window||bottom_of_window < location6-200){
                $("#li_review").find("a").css({
                    "background-color": "white",
                    "color": "#00DBAF",
                    "border-radius": "21px 21px 21px 21px",
                    "z-index": "1"
                });

            }


        });
    });
});