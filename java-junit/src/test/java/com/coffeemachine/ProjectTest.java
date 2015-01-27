package com.coffeemachine;

import junit.framework.TestCase;

public class ProjectTest extends TestCase {

  public Actionwords actionwords = new Actionwords();
    public void simpleUse(String lang, String readyMessage) {
        actionwords.assertDisplayedMessage("");
        actionwords.startTheCoffeeMachine(lang);
        actionwords.assertDisplayedMessage(readyMessage);
        actionwords.takeACoffee();
        actionwords.assertCoffeeServed();
        actionwords.shutdownCoffeeMachine();
        actionwords.assertDisplayedMessage("");
    }

    public void testSimpleUseEnglishUid72159d85483d4de6b34cf72d99e2501f() {
      simpleUse("en", "Ready");
    }

    public void testSimpleUseFrenchUid7ef427bad71a4685af0d512a32ad3dc0() {
      simpleUse("fr", "Pret");
    }



    public void testFullGroundsDoesNotBlockCoffeeUidf18f2e0d3bd44a10ac8536713305773c() {
        actionwords.startTheCoffeeMachine();
        actionwords.takeCoffees(29);
        actionwords.assertDisplayedMessage("Ready");
        actionwords.takeACoffee();
        actionwords.assertCoffeeServed();
        actionwords.assertDisplayedMessage("Empty grounds");
        actionwords.fillWaterTank();
        actionwords.fillBeans();
        actionwords.takeCoffees(20);
        actionwords.assertCoffeeServed();
        actionwords.assertDisplayedMessage("Empty grounds");
    }

    public void testWaterRunsAwayUidfdf9a09710604b619e5312ef147339e5() {
        actionwords.startTheCoffeeMachine();
        actionwords.takeCoffees(30);
        actionwords.fillBeans();
        actionwords.emptyCoffeeGrounds();
        actionwords.takeCoffees(20);
        actionwords.fillBeans();
        actionwords.emptyCoffeeGrounds();
        actionwords.assertDisplayedMessage("Fill tank");
        actionwords.fillBeans();
        actionwords.takeACoffee();
        actionwords.assertCoffeeServed();
        actionwords.takeCoffees(9);
        actionwords.takeACoffee();
        actionwords.assertNoCoffeeIsServed();
        actionwords.assertDisplayedMessage("Fill tank");
        actionwords.fillWaterTank();
        actionwords.emptyCoffeeGrounds();
        actionwords.assertDisplayedMessage("Ready");
    }

    public void testBeansRunOutUid6974201f5e554eeaa0ee69c1955a95f5() {
        actionwords.startTheCoffeeMachine();
        actionwords.assertDisplayedMessage("Ready");
        actionwords.takeCoffees(37);
        actionwords.emptyCoffeeGrounds();
        actionwords.fillWaterTank();
        actionwords.assertDisplayedMessage("Ready");
        actionwords.takeACoffee();
        actionwords.assertCoffeeServed();
        actionwords.assertDisplayedMessage("Fill beans");
        actionwords.takeACoffee();
        actionwords.takeACoffee();
        actionwords.assertCoffeeServed();
        actionwords.assertDisplayedMessage("Fill beans");
        actionwords.takeACoffee();
        actionwords.assertNoCoffeeIsServed();
    }
}