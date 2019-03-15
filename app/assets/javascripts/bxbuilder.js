
$(document).ready(function(){
  $('.contents__top__image-box').bxSlider({
    auto: true,           // 自動スライド
    speed: 1000,          // スライドするスピード
    moveSlides: 1,        // 移動するスライド数
    pause: 3000,          // 自動スライドの待ち時間
    maxSlides: 1,         // 一度に表示させる最大数     // 各スライドの幅
	  randomStart: true,    // 最初に表示するスライドをランダムに設定
    pagerType: 'full',
    // nextSelector: ".contents__top_next-btn",
    // prevSslector: ".contents__top_prev-btn",
    // nextText: icon "fas", "chevron-right",
    // prevText: icon "fas", "chevron-left"
  });
});

// $(function(){
//   $(".bx-prev").attr("id", "prev-btn");
//   $(".bx-next").attr("id", "next-btn");
// })
