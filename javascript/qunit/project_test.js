(function () {
  module('Coffee machine - Hiptest publisher sample', {
    setup: function () {
      this.actionwords = Object.create(Actionwords);
    }
  });

  function simpleUse (aws, lang, ready_message) {
    aws.assertDisplayedMessage();
    aws.startTheCoffeeMachine(lang);
    aws.assertDisplayedMessage(ready_message);
    aws.takeACoffee();
    aws.assertCoffeeServed();
    aws.shutdownCoffeeMachine();
    aws.assertDisplayedMessage();
  }

  test('Simple use: English (uid:6617621c-6e93-4b66-9b48-cda962025bfc)', function () {
    simpleUse(this.actionwords, 'en', 'Ready');
  });

  test('Simple use: French (uid:597940b5-9739-4f52-bc15-0a8f2d09921b)', function () {
    simpleUse(this.actionwords, 'fr', 'Pret');
  });


  test('Full grounds does not block coffee (uid:393737bf-81f2-423e-a59c-de11deb6c80c)', function () {
    this.actionwords.startTheCoffeeMachine();
    this.actionwords.takeCoffees(29);
    this.actionwords.assertDisplayedMessage("Ready");
    this.actionwords.takeACoffee();
    this.actionwords.assertCoffeeServed();
    this.actionwords.assertDisplayedMessage("Empty grounds");
    this.actionwords.fillWaterTank();
    this.actionwords.fillBeans();
    this.actionwords.takeCoffees(20);
    this.actionwords.assertCoffeeServed();
    this.actionwords.assertDisplayedMessage("Empty grounds");
  });

  test('Water runs away (uid:3bbac854-fad6-444d-9a59-0faadbba2f55)', function () {
    this.actionwords.startTheCoffeeMachine();
    this.actionwords.takeCoffees(30);
    this.actionwords.fillBeans();
    this.actionwords.emptyCoffeeGrounds();
    this.actionwords.takeCoffees(20);
    this.actionwords.fillBeans();
    this.actionwords.emptyCoffeeGrounds();
    this.actionwords.assertDisplayedMessage("Fill tank");
    this.actionwords.fillBeans();
    this.actionwords.takeACoffee();
    this.actionwords.assertCoffeeServed();
    this.actionwords.takeCoffees(9);
    this.actionwords.takeACoffee();
    this.actionwords.assertNoCoffeeIsServed();
    this.actionwords.assertDisplayedMessage("Fill tank");
    this.actionwords.fillWaterTank();
    this.actionwords.emptyCoffeeGrounds();
    this.actionwords.assertDisplayedMessage("Ready");
  });

  test('Beans run out (uid:c3df3d32-e883-496a-aeec-0e7cb9ca363a)', function () {
    this.actionwords.startTheCoffeeMachine();
    this.actionwords.assertDisplayedMessage("Ready");
    this.actionwords.takeCoffees(37);
    this.actionwords.emptyCoffeeGrounds();
    this.actionwords.fillWaterTank();
    this.actionwords.assertDisplayedMessage("Ready");
    this.actionwords.takeACoffee();
    this.actionwords.assertCoffeeServed();
    this.actionwords.assertDisplayedMessage("Fill beans");
    this.actionwords.takeACoffee();
    this.actionwords.takeACoffee();
    this.actionwords.assertCoffeeServed();
    this.actionwords.assertDisplayedMessage("Fill beans");
    this.actionwords.takeACoffee();
    this.actionwords.assertNoCoffeeIsServed();
  });
})();
