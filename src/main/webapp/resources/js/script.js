$(function(){
    // header scroll
    var $header = $('header');
    var $nav = $('nav');

    var $window = $(window);
    var pageOffsetTop = 200;
    
    $window.on('scroll', function(){ //스크롤시
        var scrolled = $window.scrollTop() >= pageOffsetTop;
        $header.toggleClass('down', scrolled);
        $nav.toggleClass('nav_down', scrolled);
    });


    //roll banner
    var widthSize =1510;
    var $rollBanner = $('.roll_banner');
    var $rollBannerIn = $('.roll_banner_in');

    var $scrollBar = $('.scroll_bar');
    var $scrollBarIn = $('.scroll_bar_in');
    var scrollBarMax = 160;
    var scrollMax = 510;

    // $rollBanner.mousewheel(function(event, delta) {
    //     // this.scrollLeft -= (delta * 30);
    //     var scrollLeft = this.scrollLeft
    //     scrollLeft -= (delta * 30);
    //     event.preventDefault();
    //     $rollBannerIn.css("left",-scrollLeft+'px')
    //     var scrollW= this.scrollLeft*(scrollBarMax/scrollMax);
    //     $scrollBarIn.css("left",scrollW+"px");
    // });

    $scrollBarIn.draggable({
        containment : 'parent', // 부모요소 안에 종속
        drag:function(){
            var pos = $(this).position().left;
            var leftPos = (pos-475)*(scrollMax/scrollBarMax);
            $rollBannerIn.css("left",-leftPos+'px')
        }
    });


});