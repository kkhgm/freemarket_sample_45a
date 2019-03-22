document.addEventListener('turbolinks:load', function() {
  $(function() {
    $(".item-contents__price_box_list_top_right_input").on('keyup', function(e){
      e.preventDefault();
      var count = $(this).val();
      if(count >= 300){
        var cut = count * 0.1
  	  var cutMoney = Math.floor(cut);
  	  $(".item-contents__price_box_list_sales").text("¥" + cutMoney);
  	  var salesMoney = count - cutMoney
  	  $(".item-contents__price_box_list_sales_under").text("¥" + salesMoney);
      } else {
        $(".item-contents__price_box_list_sales").text("-");
  	  $(".item-contents__price_box_list_sales_under").text("-");
      }
    });
  });
});
