/**
 * 
 */


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
    $("#call").on('click',function (){
        alert("010-1234-2322");
    });
    $("#call2").on('click',function (){
        alert("010-1234-2322");
    });
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
        if($(this).find(".after_btn").css("opacity") === "0") {
            $(this).find(".after_btn").css({
                "opacity": "1",

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