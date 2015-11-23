package com.testng.coffeemachine;

import org.testng.annotations.*;

public class ProjectTest {

    public Actionwords actionwords;

    @BeforeMethod
    public void setUp() {
        actionwords = new Actionwords();
    }
    public void simpleUse(String lang, String readyMessage) {
        // Given I start the coffee machine "<lang>"
        actionwords.iStartTheCoffeeMachine(lang);
        // When I take a coffee
        actionwords.iTakeACoffee();
        // Then coffee should be served
        actionwords.coffeeShouldBeServed();
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
        // Given the coffee machine is started
        actionwords.theCoffeeMachineIsStarted();
        // When I take "29" coffees
        actionwords.iTakeCoffeeNumberCoffees(29);
        // Then message "Ready" should be displayed
        actionwords.messageMessageShouldBeDisplayed("Ready");
        // When I take a coffee
        actionwords.iTakeACoffee();
        // Then coffee should be served
        actionwords.coffeeShouldBeServed();
        // And message "Empty grounds" should be displayed
        actionwords.messageMessageShouldBeDisplayed("Empty grounds");
        // When I fill the water tank
        actionwords.iFillTheWaterTank();
        // And I fill the beans tank
        actionwords.iFillTheBeansTank();
        // And I take "20" coffees
        actionwords.iTakeCoffeeNumberCoffees(20);
        // Then coffee should be served
        actionwords.coffeeShouldBeServed();
        // And message "Empty grounds" should be displayed
        actionwords.messageMessageShouldBeDisplayed("Empty grounds");
    }

    @Test
    public void waterRunsAwayUid1cae567daeb34449b10c3457fbcf2661() {
        // Given the coffee machine is started
        actionwords.theCoffeeMachineIsStarted();
        // When fifty coffees have been taken without filling the tank
        actionwords.fiftyCoffeesHaveBeenTakenWithoutFillingTheTank();
        // Then message "Fill tank" should be displayed
        actionwords.messageMessageShouldBeDisplayed("Fill tank");
        // When I take a coffee
        actionwords.iTakeACoffee();
        // Then coffee should be served
        actionwords.coffeeShouldBeServed();
        // When I take "10" coffees
        actionwords.iTakeCoffeeNumberCoffees(10);
        // Then coffee should not be served
        actionwords.coffeeShouldNotBeServed();
        // And message "Fill tank" should be displayed
        actionwords.messageMessageShouldBeDisplayed("Fill tank");
        // When I fill the water tank
        actionwords.iFillTheWaterTank();
        // Then message "Ready" should be displayed
        actionwords.messageMessageShouldBeDisplayed("Ready");
    }

    @Test
    public void beansRunOutUid186d320e413b4ac697b47860ece64da9() {
        // Given the coffee machine is started
        actionwords.theCoffeeMachineIsStarted();
        // When thirty eight coffees are taken without filling beans
        actionwords.thirtyEightCoffeesAreTakenWithoutFillingBeans();
        // Then coffee should be served
        actionwords.coffeeShouldBeServed();
        // And message "Fill beans" should be displayed
        actionwords.messageMessageShouldBeDisplayed("Fill beans");
        // When I take "2" coffees
        actionwords.iTakeCoffeeNumberCoffees(2);
        // Then coffee should be served
        actionwords.coffeeShouldBeServed();
        // And message "Fill beans" should be displayed
        actionwords.messageMessageShouldBeDisplayed("Fill beans");
        // When I take a coffee
        actionwords.iTakeACoffee();
        // Then coffee should not be served
        actionwords.coffeeShouldNotBeServed();
    }

    @Test
    public void noMessagesAreDisplayedWhenMachineIsShutDownUid78707faf2f21450cb3acbb543192fdf4() {
        // Given the coffee machine is started
        actionwords.theCoffeeMachineIsStarted();
        // When I shutdown the coffee machine
        actionwords.iShutdownTheCoffeeMachine();
        // Then message "" should be displayed
        actionwords.messageMessageShouldBeDisplayed("");
    }
    public void messagesAreBasedOnLanguage(String lang, String readyMessage) {
        // When I start the coffee machine "<lang>"
        actionwords.iStartTheCoffeeMachine(lang);
        // Then message "<ready_message>" should be displayed
        actionwords.messageMessageShouldBeDisplayed(readyMessage);
    }

    @Test
    public void messagesAreBasedOnLanguageEnglishUid4575ba395fa046e69637570f4f935bc2() {
        messagesAreBasedOnLanguage("en", "Ready");
    }

    @Test
    public void messagesAreBasedOnLanguageFrenchUide2d71302d9064848b6e2af29c7e5117c() {
        messagesAreBasedOnLanguage("fr", "Pret");
    }
}