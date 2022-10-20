$(function(){
    // header scroll
    var $header = $('header');
    var $nav = $('nav');

    var $window = $(window);
    var pageOffsetTop = 30;
    
    $window.on('scroll', function(){ //스크롤시
        var scrolled = $window.scrollTop() >= pageOffsetTop;
        $header.toggleClass('down', scrolled);
        $nav.toggleClass('nav_down', scrolled);
    });
	
	//up 버튼
	$(".moveTopBtn").onclick = () => {
  		window.scrollTo({ top: 0, behavior: "smooth" });  
	}
	


    //roll banner
    var scrollBarMax = 160;
    var scrollMax = 510;
	
	//마우스 스크롤 시, 가로배너, 스크롤 바 이동
	$('.roll_banner').mousewheel(function(event, delta) {
        var $wheelRollBannerIn = $(this).children('.roll_banner_in');
        var $wheelScrollBarIn = $(this).prev().children('.scroll_bar_in');
        
        var posR = parseInt($wheelRollBannerIn.css("left").replace('px', '')) ;
        var posS = parseInt($wheelScrollBarIn.css("left").replace('px', '')) ;
        
        if (event.originalEvent.wheelDelta > 0 || event.originalEvent.detail < 0) {
            // scroll up
            if(posR<=-(scrollMax)){
                $wheelRollBannerIn.css("left",-(scrollMax)+'px');
                $wheelScrollBarIn.css("left",160+'px');
            }else{
                $wheelRollBannerIn.css("left",(posR-30)+'px')
                $wheelScrollBarIn.css("left",(posS+9)+'px')
            }
        }
        else {
            // scroll down
            if(posR>=0){
                $wheelRollBannerIn.css("left",0+'px');
                $wheelScrollBarIn.css("left",0+'px');
            }else{
                $wheelRollBannerIn.css("left",(posR+30)+'px')
                $wheelScrollBarIn.css("left",(posS-9)+'px')
            }
        }
        event.preventDefault();
    });

	
	//스크롤 바 드래그 기능
    $('.scroll_bar_in').draggable({
        containment : 'parent', // 부모요소 안에 종속
        drag:function(){
            var pos = $(this).position().left;
            var leftPos = (pos-475)*(scrollMax/scrollBarMax);
            //$rollBannerIn.css("left",-leftPos+'px')
            $(this).parent().next().children('.roll_banner_in').css("left",-leftPos+'px');
        }
    });


	//스크롤 바 클릭 시 바와 가로배너 이동
    $('.scroll_bar').click(function(e){
	    var parentOffset = $(this).parent().offset();
	    var relX = e.pageX - parentOffset.left-475;
	    if(relX<80){
	        $(this).children('.scroll_bar_in').css("left",0+'px')
	        $(this).next().children('.roll_banner_in').css("left",-0+'px')
	    }else if(relX>240){
	        $(this).children('.scroll_bar_in').css("left",160+'px')
	        $(this).next().children('.roll_banner_in').css("left",-160*(scrollMax/scrollBarMax)+'px')
	    }else{
	        $(this).children('.scroll_bar_in').css("left",(relX-80)+'px')
	        $(this).next().children('.roll_banner_in').css("left",-(relX-80)*(scrollMax/scrollBarMax)+'px')
	    }
    });

});

//side bt _ up
function moveTopBtn(){
	window.scrollTo({ top: 0, behavior: "smooth" });  
}