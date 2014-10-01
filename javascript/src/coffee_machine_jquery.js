(function ($) {
  var coffeeMachine = CoffeeMachine();

  coffeeMachine.addListener('message', function (msg) {
    $('#message').html(msg);
  });

  coffeeMachine.addListener('tank', function (tank) {
    $('#tank').css({height: (tank * 5) + 'px'})
  });

  coffeeMachine.addListener('beans', function (beans) {
    $('#beans').css({height: (beans * 7.5) + 'px'})
  });

  coffeeMachine.addListener('grounds', function (grounds) {
    $('#grounds').css({height: (grounds * 5) + 'px'})
  });

  coffeeMachine.addListener('coffeeServed', function (served) {
    if (served) {
      $('#coffee').addClass('served');
    } else {
      $('#coffee').removeClass('served');
    }
  });

  $('#onOff').click(function () {
    if (coffeeMachine.get('started')) {
      coffeeMachine.stop();
    } else {
      coffeeMachine.start($('select#lang').val());
    }
  });

  $('#getCoffee').click(function () {
    coffeeMachine.takeCoffee();
  });

  $('#emptyGround').click(function () {
    coffeeMachine.emptyGrounds();
  });

  $('#fillWater').click(function () {
    coffeeMachine.fillTank();
  });

  $('#fillBeans').click(function () {
    coffeeMachine.fillBeans();
  });
})(jQuery);