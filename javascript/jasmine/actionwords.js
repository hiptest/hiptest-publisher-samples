var Actionwords = {
  coffeeShouldNotBeServed: function () {
    expect(this.sut.get('coffeeServed')).toBeFalsy();
  },

  iFillTheWaterTank: function () {
    this.sut.fillTank();
  },

  iEmptyTheCoffeeGrounds: function () {
    this.sut.emptyGrounds();
  },

  iFillTheBeansTank: function () {
    this.sut.fillBeans();
  },

  iShutdownTheCoffeeMachine: function () {
    this.sut.stop();

  },

  iTakeCoffeeNumberCoffees: function (coffee_number) {
    while ((coffee_number > 0)) {
      this.iTakeACoffee();
      coffee_number = coffee_number - 1;
    }
  },

  iTakeACoffee: function () {
    this.sut.takeCoffee();
  },

  coffeeShouldBeServed: function () {
    expect(this.sut.get('coffeeServed')).toBeTruthy();
  },

  iStartTheCoffeeMachine: function (lang) {
    this.sut.start(lang);
  },

  messageMessageShouldBeDisplayed: function (message) {
    expect(this.sut.get('message')).toEqual(message || "");
  },

  theCoffeeMachineIsStarted: function () {
    this.iStartTheCoffeeMachine();
  },

  fiftyCoffeesHaveBeenTakenWithoutFillingTheTank: function () {
    this.iTakeCoffeeNumberCoffees(30);
    this.iFillTheBeansTank();
    this.iEmptyTheCoffeeGrounds();
    this.iTakeCoffeeNumberCoffees(20);
    this.iFillTheBeansTank();
    this.iEmptyTheCoffeeGrounds();
  },

  thirtyEightCoffeesAreTakenWithoutFillingBeans: function () {
    this.iTakeCoffeeNumberCoffees(37);
    this.iEmptyTheCoffeeGrounds();
    this.iFillTheWaterTank();
    this.iTakeACoffee();
  }
}