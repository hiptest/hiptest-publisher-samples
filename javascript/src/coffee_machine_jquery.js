(function ($) {
  var coffeeMachine = CoffeeMachine();

  function sendEvent(category, type, value) {
    var trackerName = ga.getAll()[0].get('name');
    ga(trackerName + '.send', 'event', category, type, value);
  }

  coffeeMachine.addListener('message', function (msg) {
    sendEvent('display', 'message', msg)
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
    sendEvent('Button', 'click', 'On/off');

    if (coffeeMachine.get('started')) {
      coffeeMachine.stop();
    } else {
      coffeeMachine.start($('select#lang').val());
    }
  });

  $('#getCoffee').click(function () {
    sendEvent('Button', 'click', 'Coffee');

    coffeeMachine.takeCoffee();
  });

  $('#emptyGround').click(function () {
    sendEvent('Button', 'click', 'Grounds');

    coffeeMachine.emptyGrounds();
  });

  $('#fillWater').click(function () {
    sendEvent('Button', 'click', 'Water');


    coffeeMachine.fillTank();
  });

  $('#fillBeans').click(function () {
    sendEvent('Button', 'click', 'Beans');


    coffeeMachine.fillBeans();
  });
})(jQuery);
