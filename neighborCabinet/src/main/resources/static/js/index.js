/**
 * 
 */

$(document).ready(function(){
    $(window).scroll(function(){
        $('.s3').each(function(i){
            var bottom_of_element = $(this).offset().top + $(this).outerHeight() /2;
            var bottom_of_window = $(window).scrollTop() + $(window).height();

            if( bottom_of_window > bottom_of_element ){
                $(this).animate({'opacity':'1','margin-left':'50px'},1200);
            }

        });
        $('.s3_2').each(function(i) {
            var bottom_of_element = $(this).offset().top + $(this).outerHeight() / 2;
            var bottom_of_window = $(window).scrollTop() + $(window).height();

            if (bottom_of_window > bottom_of_element) {
                $(this).animate({'opacity': '1', 'margin-right': '50px'}, 1200);
            }
        });
        $('.s4_5_inner').each(function(i) {
            var bottom_of_element = $(this).offset().top + $(this).outerHeight() / 2;
            var bottom_of_window = $(window).scrollTop() + $(window).height();

            if (bottom_of_window > bottom_of_element) {
                $(this).animate({'opacity': '1'}, 1200);
            }
        });
    });
});