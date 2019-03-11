$(function(){
  $("#item_shipping_charge").on("change", function(){
    var select = $("#item_shipping_charge").val();
    if(select == "送料込み" || select == "着払い"){
    $(".item-contents__shipping_box_method").show()
    }else{
      $(".item-contents__shipping_box_method").hide();
    }
  })
})
