describe('Coffee machine - Hiptest publisher sample', function () {
  beforeEach(function () {
    this.actionwords = Object.create(Actionwords);
    this.actionwords.sut = CoffeeMachine();
  });

  describe('Simple use', function () {
    function simpleUse (lang, ready_message) {
      this.actionwords.assertDisplayedMessage();
      this.actionwords.startTheCoffeeMachine(lang);
      this.actionwords.assertDisplayedMessage(ready_message);
      this.actionwords.takeACoffee();
      this.actionwords.assertCoffeeServed();
      this.actionwords.shutdownCoffeeMachine();
      this.actionwords.assertDisplayedMessage();
    }

    it('English (uid:9ddc1729-0ea0-40d9-9348-dc1af6328843)', function () {
      simpleUse.apply(this, ['en', 'Ready']);
    });

    it('French (uid:b2ad0241-1dbf-4bde-abf7-192b00c0d7a4)', function () {
      simpleUse.apply(this, ['fr', 'Pret']);
    });
  });


  it('Full grounds does not block coffee (uid:0ae88e38-c64c-4116-8a3e-66b11dc5f475)', function () {
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

  it('Water runs away (uid:83bdb7a4-e845-484d-961a-c521eca436f4)', function () {
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

  it('Beans run out (uid:b4b81e5f-931c-436e-a84a-fabf841c95aa)', function () {
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
});
