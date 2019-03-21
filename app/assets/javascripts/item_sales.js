document.addEventListener('turbolinks:load', function() {
  $(function(){
    function buildChild(){
      var html =`<select class="item-contents__item-about_box_condition_input" id="child" name="item[item_categories_attributes][0][category_id]"></select>`
      return html;}

    function buildGrandChild(){
      var html =`<select class="item-contents__item-about_box_condition_input" id="grand_child" name="item[item_categories_attributes][0][category_id]"></select>`
      return html;}

    function buildOption(cateChild){
      var html = `<option value="${cateChild.id}">${cateChild.name}</option>`
      return html;}

    $("#item_shipping_charge").on("change", function(){
      var select = $("#item_shipping_charge").val();
      if(select == "送料込み" || select == "着払い"){
      $(".item-contents__shipping_box_method").show()
      }else{
        $(".item-contents__shipping_box_method").hide();
      }
    })

    // 親カテゴリ選択時子カテゴリの表示を行う
    $("#parent").on("change", function(){
    $('#child').remove();
    $('#grand_child').remove();
      var val = $("#parent").val();

      $.ajax({
        type: 'GET',
        url: '/items/catesearch',
        data: { id: val },
        dataType: 'json'
      })
      .done(function(cateChilds) {
          // セレクトフォームの作成
          var html = buildChild();
          $('.item-contents__item-about_box_category').append(html)
          //オプションタグへの投入
          cateChilds.forEach(function(cateChild){
          var option = buildOption(cateChild);
          $('#child').append(option);
          })
           $("#child").on("change", function(){
           $('#grand_child').remove();
           var val = $("#child").val();

          $.ajax({
            type: 'GET',
            url: '/items/catesearch',
            data: { id: val },
            dataType: 'json'
          })
          .done(function(cateGrandChildren) {
            // セレクトフォームの作成
            var html = buildGrandChild();
            $('.item-contents__item-about_box_category').append(html)
            //オプションタグへの投入
            cateGrandChildren.forEach(function(cateGrandChild){
            var option = buildOption(cateGrandChild);
            $('#grand_child').append(option)
            })
          })
        });
      });
    })
  });
});
