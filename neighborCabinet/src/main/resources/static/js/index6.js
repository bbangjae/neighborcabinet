/**
 * 
 */
 
 window.addEventListener("wheel", function(e){
    e.preventDefault();
},{passive : false});

var mHtml = $("html");
var page = 1;

$(window).on("wheel", function(e) {
    if(page>=1&&page<=5) {


        if (mHtml.is(":animated")) return;
        if (e.originalEvent.deltaY > 0) {
            if (page == 5) return;
            page++;
        } else if (e.originalEvent.deltaY < 0) {
            if (page == 1) return;
            page--;
        }
        var posTop = (page - 1) * $(window).height();
        mHtml.animate({scrollTop: posTop});
    }
    else{
        window.scroll({
            behavior:'smooth'
        })
    }
})