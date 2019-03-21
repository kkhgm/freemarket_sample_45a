$(document).on('turbolinks:load', function() {
  Payjp.setPublicKey('pk_test_d507f4cfda667e8ad1647d90');
  var form = $("#change-form");
  var number = document.querySelector('input[name="number"]'),
      cvc = document.querySelector('input[name="cvc"]'),
      exp_month = document.querySelector('select[name="exp_month"]'),
      exp_year = document.querySelector('select[name="exp_year"]');

  document.querySelector('.fill').addEventListener('click', function(e) {
    e.preventDefault();
    number.value = '4242424242424242';
    cvc.value = '123';
    exp_month.value = '12';
    exp_year.value = '2020';
  });

  document.querySelector('.submit').addEventListener('click', function(e) {
    e.preventDefault();
    var card = {
      number: number.value,
      cvc: cvc.value,
      exp_month: exp_month.value,
      exp_year: exp_year.value
    }
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        document.getElementById('result').innerText = 'Token = ' + response.id;
        form.find('button').prop('disabled', false);
      }
      else {
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");

        var token = response.id;

        form.append($('<input type="hidden" name="payjp_token" class="payjp-token" />').val(token));
        form.get(0).submit();
      }
    });
  });
});
