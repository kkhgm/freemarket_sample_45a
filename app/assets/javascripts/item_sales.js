$(function(){
	var html =
	`<div class="contents__shipping_box_method">
		<h4>配送の方法<span>必須</span></h4>
		<select class="contents__shipping_box_method_input">
			<option>---</option>
			<option>未定</option>
			<option>クロネコヤマト</option>
			<option>ゆうパック</option>
			<option>ゆうメール</option>
		</select>
	<div>`;

	$("#item_shipping_charge").on("change", function(){
		$(".contents__shipping_box_method").remove();
		var select = $("#item_shipping_charge").val();
		if(select == 1 || select == 2){
		$(".contents__shipping_box_sub").append(html)
		}
	})
})