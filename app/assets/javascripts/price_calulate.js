$(function() {
	$(".contents__price_box_list_top_right_input").on('keyup', function(e){
		e.preventDefault();
		var count = $(this).val();
		if(count >= 300){
			var cut = count * 0.1
			var cutMoney = Math.floor(cut);
			$(".contents__price_box_list_sales").text("¥" + cutMoney);
			var salesMoney = count - cutMoney
			$(".contents__price_box_list_sales_under").text("¥" + salesMoney);
		} else {
			$(".contents__price_box_list_sales").text("-");
			$(".contents__price_box_list_sales_under").text("-");
		}
	});
});