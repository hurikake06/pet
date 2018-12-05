// スライド風画面用に画面を作成するためのライブラリ
//
//= require_self

function getViewportOffset($e) {
  var $window = $(window),
    scrollLeft = $window.scrollLeft(),
    scrollTop = $window.scrollTop(),
    offset = {top:$e.offsetTop,left:$e.offsetLeft},
    rect1 = { x1: scrollLeft, y1: scrollTop, x2: scrollLeft + $window.width(), y2: scrollTop + $window.height() },
    rect2 = { x1: offset.left, y1: offset.top, x2: offset.left + $e.offsetWidth, y2: offset.top + $e.offsetHeight };

  return {
    left: offset.left - scrollLeft,
    top: offset.top - scrollTop,
    insideViewport: rect1.x1 < rect2.x2 && rect1.x2 > rect2.x1 && rect1.y1 < rect2.y2 && rect1.y2 > rect2.y1
  };
}

var slides;
var slide_current;
var slide_current_index = 0;
var slide_top_timing_d = 0.4;
var slide_top_timing;

function nextPage(){
  if(!$('html').is(':animated')){
    var next = (slide_current_index + 1) % slides.length;
    var pos = slides[next].offsetTop + slides[next].offsetHeight/2 - $(window).height()/2;
    if(next == 0) pos = 0;
    $("html,body").animate({scrollTop:pos});
  }
}

function prevPage(){
  if(!$('html').is(':animated')){
    var next = (slide_current_index - 1 + slides.length) % slides.length;
    var pos = slides[next].offsetTop + slides[next].offsetHeight/2 - $(window).height()/2;
    if(next == 0) pos = 0;
    $("html,body").animate({scrollTop:pos});
  }
}

$(function(){
  slides = $("#slides > .slide");
  slide_current = $("#slides > .active")[0];
  document.addEventListener("mousewheel", function(e) {
      if(e.deltaY > 0){
        nextPage();
      }else{
        prevPage();
      }
      e.preventDefault();
  });
  $(window).scroll(function() {
    slide_top_timing = $(window).height() * slide_top_timing_d;
    console.log("scroll");

    var temp_current = null;
    for(var i = 0;i < slides.length; i++ ){
      if(getViewportOffset(slides[i]).top < slide_top_timing){
        temp_current = slides[i];
        slide_current_index = i;
      }
    }

    if(temp_current != null){
      if(temp_current != slide_current){
        console.log("change slide");
        slide_current.setAttribute("class", "slide disable");
        temp_current.setAttribute("class", "slide active");
        slide_current = temp_current;
      }
    }
  });
});
