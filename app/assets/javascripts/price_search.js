$(function(){
	$("#price").on("change", function(){
		var priceval = $("#price").val();
		if(priceval == 1){
			$(".price_min").val(300);
			$(".price_max").val(1000);
		}else if(priceval == 2){
			$(".price_min").val(1000);
			$(".price_max").val(5000);
		}else if(priceval == 3){
			$(".price_min").val(5000);
			$(".price_max").val(10000);
		}else if(priceval == 4){
			$(".price_min").val(10000);
			$(".price_max").val(30000);
		}else if(priceval == 5){
			$(".price_min").val(30000);
			$(".price_max").val(50000);
		}else if(priceval == 6){
			$(".price_min").val(50000);
			$(".price_max").val("");
		}
	});
});
