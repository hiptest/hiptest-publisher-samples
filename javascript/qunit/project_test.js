(function () {
  module('Coffee machine - Hiptest publisher sample', {
    setup: function () {
      this.actionwords = Object.create(Actionwords);
      this.actionwords.sut = CoffeeMachine();
    }
  });

  function simpleUse (lang, ready_message) {
    // Given I start the coffee machine "<lang>"
    this.actionwords.iStartTheCoffeeMachine(lang);
    // When I take a coffee
    this.actionwords.iTakeACoffee();
    // Then coffee should be served
    this.actionwords.coffeeShouldBeServed();
  }

  test('Simple use: English (uid:6617621c-6e93-4b66-9b48-cda962025bfc)', function () {
    simpleUse.apply(this, ['en', 'Ready']);
  });

  test('Simple use: French (uid:597940b5-9739-4f52-bc15-0a8f2d09921b)', function () {
    simpleUse.apply(this, ['fr', 'Pret']);
  });


  test('Full grounds does not block coffee (uid:393737bf-81f2-423e-a59c-de11deb6c80c)', function () {
    // Given the coffee machine is started
    this.actionwords.theCoffeeMachineIsStarted();
    // When I take "29" coffees
    this.actionwords.iTakeCoffeeNumberCoffees(29);
    // Then message "Ready" should be displayed
    this.actionwords.messageMessageShouldBeDisplayed("Ready");
    // When I take a coffee
    this.actionwords.iTakeACoffee();
    // Then coffee should be served
    this.actionwords.coffeeShouldBeServed();
    // And message "Empty grounds" should be displayed
    this.actionwords.messageMessageShouldBeDisplayed("Empty grounds");
    // When I fill the water tank
    this.actionwords.iFillTheWaterTank();
    // And I fill the beans tank
    this.actionwords.iFillTheBeansTank();
    // And I take "20" coffees
    this.actionwords.iTakeCoffeeNumberCoffees(20);
    // Then coffee should be served
    this.actionwords.coffeeShouldBeServed();
    // And message "Empty grounds" should be displayed
    this.actionwords.messageMessageShouldBeDisplayed("Empty grounds");
  });

  test('Water runs away (uid:3bbac854-fad6-444d-9a59-0faadbba2f55)', function () {
    // Given the coffee machine is started
    this.actionwords.theCoffeeMachineIsStarted();
    // When fifty coffees have been taken without filling the tank
    this.actionwords.fiftyCoffeesHaveBeenTakenWithoutFillingTheTank();
    // Then message "Fill tank" should be displayed
    this.actionwords.messageMessageShouldBeDisplayed("Fill tank");
    // When I take a coffee
    this.actionwords.iTakeACoffee();
    // Then coffee should be served
    this.actionwords.coffeeShouldBeServed();
    // When I take "10" coffees
    this.actionwords.iTakeCoffeeNumberCoffees(10);
    // Then coffee should not be served
    this.actionwords.coffeeShouldNotBeServed();
    // And message "Fill tank" should be displayed
    this.actionwords.messageMessageShouldBeDisplayed("Fill tank");
    // When I fill the water tank
    this.actionwords.iFillTheWaterTank();
    // Then message "Ready" should be displayed
    this.actionwords.messageMessageShouldBeDisplayed("Ready");
  });

  test('Beans run out (uid:c3df3d32-e883-496a-aeec-0e7cb9ca363a)', function () {
    // Given the coffee machine is started
    this.actionwords.theCoffeeMachineIsStarted();
    // When thirty eight coffees are taken without filling beans
    this.actionwords.thirtyEightCoffeesAreTakenWithoutFillingBeans();
    // Then coffee should be served
    this.actionwords.coffeeShouldBeServed();
    // And message "Fill beans" should be displayed
    this.actionwords.messageMessageShouldBeDisplayed("Fill beans");
    // When I take "2" coffees
    this.actionwords.iTakeCoffeeNumberCoffees(2);
    // Then coffee should be served
    this.actionwords.coffeeShouldBeServed();
    // And message "Fill beans" should be displayed
    this.actionwords.messageMessageShouldBeDisplayed("Fill beans");
    // When I take a coffee
    this.actionwords.iTakeACoffee();
    // Then coffee should not be served
    this.actionwords.coffeeShouldNotBeServed();
  });

  function messagesAreBasedOnLanguage (lang, ready_message) {
    // When I start the coffee machine "<lang>"
    this.actionwords.iStartTheCoffeeMachine(lang);
    // Then message "<ready_message>" should be displayed
    this.actionwords.messageMessageShouldBeDisplayed(ready_message);
  }

  test('Messages are based on language: English (uid:22759344-4f50-4f05-b0c7-bb6775b2bdb4)', function () {
    messagesAreBasedOnLanguage.apply(this, ['en', 'Ready']);
  });

  test('Messages are based on language: French (uid:c6049f15-75ee-43b1-97c4-5815a88324ce)', function () {
    messagesAreBasedOnLanguage.apply(this, ['fr', 'Pret']);
  });


  test('No messages are displayed when machine is shut down (uid:e9d93b85-30d5-4ce1-a85a-eb1b41992598)', function () {
    // Given the coffee machine is started
    this.actionwords.theCoffeeMachineIsStarted();
    // When I shutdown the coffee machine
    this.actionwords.iShutdownTheCoffeeMachine();
    // Then message "" should be displayed
    this.actionwords.messageMessageShouldBeDisplayed();
  });
})();
