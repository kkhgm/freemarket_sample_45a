$(function(){
	var html =
	`<div>contents__shipping_box_method
		<h4>配送の方法<span>必須</span></h4>
		<select class="contents__shipping_box_method_input">
			<option>---</option>
			<option>未定</option>
			<option>クロネコヤマト</option>
			<option>ゆうパック</option>
			<option>ゆうメール</option>
		</select>
	<div>`

	$(".contents__shipping_box_charge_input").change(function(){
		console.log(1);
		$(".contents__shipping_box").append(html)
	})
})