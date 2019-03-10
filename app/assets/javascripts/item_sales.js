$(function(){
  $("#item_shipping_charge").on("change", function(){
    var select = $("#item_shipping_charge").val();
    if(select == 1 || select == 2){
    $(".item-contents__shipping_box_method").show()
    }else{
      $(".item-contents__shipping_box_method").hide();
    }
  })
})
