package com.testng.coffeemachine;

import org.testng.annotations.*;

public class ProjectTest {

    public Actionwords actionwords;

    @BeforeMethod
    public void setUp() {
        actionwords = new Actionwords();
    }
    public void simpleUse(String lang, String readyMessage) {
        actionwords.assertDisplayedMessage("");
        actionwords.startTheCoffeeMachine(lang);
        actionwords.assertDisplayedMessage(readyMessage);
        actionwords.takeACoffee();
        actionwords.assertCoffeeServed();
        actionwords.shutdownCoffeeMachine();
        actionwords.assertDisplayedMessage("");
    }

    @Test
    public void simpleUseEnglishUid858d270d51854e2b82ba5ddfe219fe42() {
      simpleUse("en", "Ready");
    }

    @Test
    public void simpleUseFrenchUid373898f68647419d80deea6c3ccfb894() {
      simpleUse("fr", "Pret");
    }



    @Test
    public void fullGroundsDoesNotBlockCoffeeUide06952a328e34918899bb408596cac6c() {
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

    @Test
    public void waterRunsAwayUid1cae567daeb34449b10c3457fbcf2661() {
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

    @Test
    public void beansRunOutUid186d320e413b4ac697b47860ece64da9() {
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