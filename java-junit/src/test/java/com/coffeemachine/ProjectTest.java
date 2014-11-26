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

    public void testSimpleUseEnglish() {
      simpleUse("en", "Ready");
    }

    public void testSimpleUseFrench() {
      simpleUse("fr", "Pret");
    }


    // Simple scenario showing that after 50 coffees, the "Fill tank" message is displayed but it is still possible to have coffee until the tank is fully empty.
    public void testWaterRunsAway() {
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
    // Simple scenario showing that after 38 coffees, the message "Fill beans" is displayed but it is possible to two coffees until there is no more beans.
    public void testBeansRunOut() {
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
    // You kept getting coffee even if the "Empty grounds" message is displayed. That said it's not a fantastic idea, you'll get ground everywhere when you'll decide to empty it.
    public void testFullGroundsDoesNotBlockCoffee() {
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
}
