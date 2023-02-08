/**
 * 
 */
var hours_R=""; // 시간 받아온값
var boxtype="";
$(function(){



});

/*          캘린더 시작          */
var today = new Date();
var date = new Date();
var realMonth =date.getMonth()+1;
var realToday=date.getDate();

var selectedCell;
var selectedColor=null;
var selectedYear=null;
var selectedMonth=null;
var selectedDate=null;

function getToday(c_day){
    let date = c_day;
    let year = c_day.getFullYear();
    let month = ("0" + (1 + c_day.getMonth())).slice(-2);
    let day = ("0" + c_day.getDate()).slice(-2);

    return year + "-" + month + "-" + day;
}

//이번 달인지 확인하는 함수
function thisMonth(todayMonth,dateMonth){
    if(todayMonth*1===dateMonth*1)
        return 0;
    else
        return 1;
}
// 시간,가격 Text 초기화 함수
function selectedTimeAndTotalPriceTextInit(){
    resTimeForm = document.getElementById("selectedTime");
    useTimeForm = document.getElementById("totalPrice");
    resTimeForm.value = "";
    useTimeForm.value = "";
    selectedFirstTime = 24*1;
    selectedFinalTime = 0*1;
}

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

    nowMonth = today.getMonth()+1;
    //이번달이면 0, 다음달이면 1 리턴
    monthEquals = thisMonth(nowMonth, realMonth);

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
        noCount =0;


        cell = row.insertCell();
        cnt+=1;

        cell.setAttribute('id',i);
        cell.innerHTML = i;

        if( nowMonth === realMonth &&i< realToday*1){
            noCount +=1;

        } else if (nowMonth> realMonth && i>realToday*1){
            noCount+=1;
        }else if (nowMonth> realMonth*1+1){
            noCount+=1;
        }
        cell.align = "center";
        $(cell).css({
            "color":"gray"
        });

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
        if(noCount===1){
            $(cell).css({
                "color":"white",
                "background":"lightgrey",
                "opacity":"0.4",
                "cursor" :"default"
            });
        }
        else {
            cell.onclick = function () {

                selectedTimeAndTotalPriceTextInit();

                clickedYear = today.getFullYear();
                clickedMonth = (1 + today.getMonth());
                clickedDate = this.getAttribute('id');
                today.setDate(clickedDate);


                clickedDate_text = clickedDate >= 10 ? clickedDate : '0' + clickedDate;
                clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
                clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate_text;
                if (selectedCell != null && selectedColor === "skyblue") {
                    $(selectedCell).css({
                        "background": "#F9FAFB",
                        "color": "skyblue"
                    });
                } else if (selectedCell != null && selectedColor === "rgb(247, 157, 194)") {
                    $(selectedCell).css({
                        "background": "#F9FAFB",
                        "color": "rgb(247, 157, 194)"
                    });

                } else {
                    $(selectedCell).css({
                        "background": "#F9FAFB",
                        "color": "gray"
                    });

                }
                selectedCell = this;
                selectedColor = selectedCell.style.color;

                $(this).css({
                    "background": "#00DBAF",
                    "color": "white"

                });
                timeTableMaker(clickedYear, clickedMonth, clickedDate_text);
                $("#timeTable,#available").show();

            }
        }

    }
    if(cnt % 7 != 0){
        for(i = 0; i < 7 - (cnt % 7); i++){
            cell = row.insertCell();
        }
    }
}
function prevCalendar(){
    console.log(today.getMonth());
    console.log(realMonth);
    if(today.getMonth()<realMonth){
        alert("예약은 금일기준으로 당일부터 30일 이후까지 가능합니다")
        return false;
    }
    today = new Date (today.getFullYear(), today.getMonth()-1, today.getDate());
    buildCalendar();
}
function nextCalendar(){
    if(today.getMonth()+1===realMonth+1){
        alert("예약은 금일기준으로 당일부터 30일 이후까지 가능합니다")
        return false;
    }
    console.log(today.getMonth());
    today = new Date (today.getFullYear(),today.getMonth()+1, today.getDate());
    console.log(today.getMonth());
    buildCalendar();
}



/*          캘린더 종료          */




function timetableInit(start,end,arr) {

    for(k=start*1; k<=end*1; k++){
        if(hours_R.charAt(k) ==='1') continue;
        $(arr[k]).css({
            "color":"gray",
            "background-color": "rgb(215, 255, 241)",
            "opacity":"0.4"
        });
    }
}

var price_R = 0; // 받은시간

var startTime = 0;
var endTime = 24;

//선택된 시간중 가장 빠른/늦은 시간;
var selectedFirstTime = 24*1; // 처음 고른 시간
var selectedFinalTime = -1*1; // 나중에 고른 시간
var selectedTimecell=null;
var useTime=0; //이용시간



//  시간 테이블

function timeTableMaker(sY,sM, sD){
    selectedYear=sY;
    selectedMonth=sM;
    selectedDate=sD;
    month=sM;
    date = sD;
    var timeTable= document.getElementById("timeTable");


    while(timeTable.rows.length>0){
        timeTable.deleteRow(timeTable.rows.length-1);
    }

    let cnt_t = 0;
    let cellTimearr=[];
    cnt_selected=0 // 시간 선택횟수
    $.ajax({
        type:"post",
        url:"/place/placeDetailView/showDate",
        data:{"date_click":getToday(today),
            "pNo":$("#QA_confirm").val()*1,
        "boxtype":boxtype },
        dataType : "json",
        success:function (map){

            hours_R=map.hours;


            for(i=0;i<endTime - startTime;i++){
                noCount_t=0;
                cellTime= startTime*1 + i;
                cellStartTimeText = cellTime + ":00";
                cellEndTimeText = (cellTime + 1) + ":00";
                inputCellText = cellStartTimeText + " ~ " +  cellEndTimeText;
                if(cnt_t%3==0) {
                    row = timeTable.insertRow();
                }
                cell = row.insertCell();
                cell.setAttribute('id',cellTime);
                cell.innerHTML=inputCellText;
                insertTime();
                cellTimearr[cellTime*1]=cell;
                cnt_t+=1;
                //클릭 이벤트

                if(noCount_t===0) {
                    cell.onclick = function () {
                        $("#timeInfo,#sumPrice").show();
                        cnt_selected += 1;
                        //가격표, 시간 보여주기
                        cellTime =this.getAttribute('id');

                        clickCell=this;

                        clickTime(cellTimearr)

                        showTimePriceText();

                    }
                }
            }

        }
    })



}
function insertTime(){
    if(hours_R.charAt(cellTime)==='0')
        $(cell).css({
            "color":"gray",
            "background-color": "rgb(215, 255, 241)"
        });
    else{
        noCount_t=1;
        $(cell).css({

            "color":"gray",
            "background-color": "lightgray",
            "border":"solid 1px gray",
            "opacity": "1",
            "cursor":"default"
        });
    }
}
function clickTime(cellTimearr){

// 시간테이블 3번이상 골랐을경우
    if (cnt_selected === 3) {
        timetableInit(startTime * 1, endTime * 1, cellTimearr);

        selectedFirstTime = cellTime*1
        selectedFinalTime = cellTime*1
        selectedTimeCell = null;
    }
    if (selectedTimecell != null) {
        if (selectedFirstTime * 1 < cellTime * 1) {

            for (k = selectedFirstTime * 1 + 1; k <= cellTime * 1; k++) {
                if(hours_R.charAt(k)=== '1'){
                    timetableInit(startTime * 1, endTime * 1, cellTimearr);
                    selectedTimeAndTotalPriceTextInit();
                    return;
                }
                $(cellTimearr[k]).css({
                    "color": "white",
                    "background-color": "#00DBAF",
                    "opacity": "1"
                });

            }
        }
        else {
            timetableInit(startTime * 1, endTime * 1, cellTimearr);

            $(clickCell).css({
                "color": "white",
                "background-color": "#00DBAF",
                "opacity": "1"
            });
            cnt_selected = 1;
            console.log(1234);
            selectedFirstTime = 24*1;
            selectedFinalTime = 0*1;
        }
    }
    else {

        $(clickCell).css({
            "color": "white",
            "background-color": "#00DBAF",
            "opacity": "1"
        });
    }
    selectedTimecell = clickCell;

}

//시간 가격 보이는값 변경
function showTimePriceText(){

    if (cellTime*1 < selectedFirstTime*1) {
        selectedFirstTime = cellTime
        selectedFinalTime = cellTime
    }
    if (cellTime*1 > selectedFinalTime*1) {
        selectedFinalTime = cellTime
    }
    // resDate =selectedYear+"년 "+selectedMonth+"월"+selectedDate+"일";
    resTime = selectedYear + "년 " + selectedMonth + "월" + selectedDate + "일" + " " + selectedFirstTime + ":00 ~" + (selectedFinalTime * 1 + 1) + ":00";
    // resDateForm =document.getElementById("selectedDate");
    resTimeForm = document.getElementById("selectedTime");
    // resDateForm.value=resDate;
    resTimeForm.value = resTime;
    console.log(selectedFirstTime+"호출후"+selectedFinalTime);
    useTime = (selectedFinalTime*1 + 1) - selectedFirstTime*1;
    useTimeForm = document.getElementById("totalPrice");
    useTimeForm.value = "￦"+(useTime * price_R).toLocaleString()+"원";
}



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
        var now_t= (($(window).height()-$("#modal_call").outerHeight())/2+$(window).scrollTop())+"px";
        var now_l= (($(window).width()-$("#modal_call").outerWidth())/2+$(window).scrollLeft())+"px";
        $("#modal_call").css({
            "display": "flex",

        });
        $(".modal-window").css({

            "top":now_t,
            "left":now_l

        });
    });

    $(".QA_btn").on('click',function (){
        var now_t= (($(window).height()-$("#modal_QA").outerHeight())/2+$(window).scrollTop())+"px";
        var now_l= (($(window).width()-$("#modal_QA").outerWidth())/2+$(window).scrollLeft())+"px";
        $("#modal_QA").css({
            "display": "flex",

        });
        $(".modal-window").css({

            "top":now_t,
            "left":now_l

        });
    });

    const modal_call = document.getElementById("modal_call")
    modal_call.addEventListener("click",e =>{
        const evTarget =e.target
        if(evTarget.classList.contains("modal-overlay")){
            modal_call.style.display="none"
        }
    } )
    window.addEventListener("keyup", e => {
        if(modal_call.style.display==="flex" && e.key==="Escape"){
            modal_call.style.display="none"
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
    $("#reserve_btn").on('click',function(){

        let obj = {
            "pNo": $("#QA_confirm").val(),
            "date_text":$("#selectedTime").val(),
            "total_price":$("#totalPrice").val(),
            "date_click":getToday(today),
            "selectedFirstTime": selectedFirstTime,
            "selectedFinalTime": selectedFinalTime,
            "hours": hours_R,
            "bt":boxtype
            }
        $.ajax({
            type:"post",
            url:"/place/placeDetailView/Reserve",
            data:obj,
            dataType:"json",
            success:function(result){
                location.href = "/rental/payment/"+result.no;
            }
        })
    });
    $("#QA_confirm").on('click',function (){
        var pNo =$("#QA_confirm").val();
        // QA DB 저장

        $.ajax({
            type:"post",
            url:"/place/placeDetailView/QA",
            data:{"text":$("#qa_text").val(),
                   pNo},
            success:function(result){
                if(result == 1) {
                    location.href = "/place/placeDetailView/"+pNo
                    $(".modal-overlay").css({
                        "display": "none"
                    });
                }
                else{
                    $(".modal-overlay").css({
                        "display": "none"
                    });
                }
            }
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


    $(".op_box").on('click',function () {

        $(".after_btn").css({
            "opacity": "0"

        });
        $(".o_type").css({
            "color": "gray"

        });
        $(".o_price").css({
            "color": "gray"

        });
        $(".box_container").hide();


        $(this).find(".box_container").show();

        if($(this).find(".after_btn").css("opacity") === "0") {
            $(this).find(".after_btn").css({
                "opacity": "1"

            });

            $(this).find(".o_type").css({
                "color":"black"
            });
            $(this).find(".o_price").css({
                "color":"#00DBAF"
            });
        }
        else{
            $(this).css({
                "opacity": "0"

            });
        }

    });
    $(".box_title").on('click',function(){
        $("#calendar,#timeTable,#timeInfo,#sumPrice,#available").hide();
        price_R=($(this).find(".o_price").attr("value"))*1;
        $(".box_detail").css({
            "background-color":"white",
            "color":"#00DBAF"
        });
    });

    $(".box_detail").on('click',function(){
        $("#calendar,#timeTable,#timeInfo,#sumPrice,#available").hide();
        $("#calendar").show();
        boxtype=$(this).attr("value");
        $(".box_detail").css({
            "background-color":"white",
            "color":"#00DBAF"
        });
        $(this).css({
           "background-color":"#00DBAF",
            "color":"white"
        });
        buildCalendar()
    });




    $(window).scroll(function() {
        $('#space').each(function () {
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


$(function() {

    initMap();

});


