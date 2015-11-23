describe('Coffee machine - Hiptest publisher sample', function () {
  beforeEach(function () {
    this.actionwords = Object.create(Actionwords);
    this.actionwords.sut = CoffeeMachine();
  });

  describe('Simple use', function () {
    function simpleUse (lang, ready_message) {
      // Given I start the coffee machine "<lang>"
      this.actionwords.iStartTheCoffeeMachine(lang);
      // When I take a coffee
      this.actionwords.iTakeACoffee();
      // Then coffee should be served
      this.actionwords.coffeeShouldBeServed();
    }

    it('English (uid:9ddc1729-0ea0-40d9-9348-dc1af6328843)', function () {
      simpleUse.apply(this, ['en', 'Ready']);
    });

    it('French (uid:b2ad0241-1dbf-4bde-abf7-192b00c0d7a4)', function () {
      simpleUse.apply(this, ['fr', 'Pret']);
    });
  });


  it('Full grounds does not block coffee (uid:0ae88e38-c64c-4116-8a3e-66b11dc5f475)', function () {
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

  it('Water runs away (uid:83bdb7a4-e845-484d-961a-c521eca436f4)', function () {
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

  it('Beans run out (uid:b4b81e5f-931c-436e-a84a-fabf841c95aa)', function () {
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

  it('No messages are displayed when machine is shut down (uid:bc7c5f52-4cfa-49c8-a596-1b045d60565d)', function () {
    // Given the coffee machine is started
    this.actionwords.theCoffeeMachineIsStarted();
    // When I shutdown the coffee machine
    this.actionwords.iShutdownTheCoffeeMachine();
    // Then message "" should be displayed
    this.actionwords.messageMessageShouldBeDisplayed();
  });

  describe('Messages are based on language', function () {
    function messagesAreBasedOnLanguage (lang, ready_message) {
      // When I start the coffee machine "<lang>"
      this.actionwords.iStartTheCoffeeMachine(lang);
      // Then message "<ready_message>" should be displayed
      this.actionwords.messageMessageShouldBeDisplayed(ready_message);
    }

    it('English (uid:95bf5746-82c0-4f3f-9fba-01616cd9a6e0)', function () {
      messagesAreBasedOnLanguage.apply(this, ['en', 'Ready']);
    });

    it('French (uid:a2be1026-0a37-47b8-98b9-f223f40ef469)', function () {
      messagesAreBasedOnLanguage.apply(this, ['fr', 'Pret']);
    });
  });
});
