$(function(){

	$("#item_shipping_charge").on("change", function(){
		// $(".contents__shipping_box_method").remove();
		var select = $("#item_shipping_charge").val();
		if(select == 1 || select == 2){
		$(".contents__shipping_box_method").show()
		}else{
			$(".contents__shipping_box_method").hide();
		}
	})
})