package com.coffeemachine;

import junit.framework.TestCase;

public class ProjectTest extends TestCase {

    public Actionwords actionwords = new Actionwords();
    public void simpleUse(String lang, String readyMessage) {
        // Given I start the coffee machine "<lang>"
        actionwords.iStartTheCoffeeMachine(lang);
        // When I take a coffee
        actionwords.iTakeACoffee();
        // Then coffee should be served
        actionwords.coffeeShouldBeServed();
    }

    public void testSimpleUseEnglishUid72159d85483d4de6b34cf72d99e2501f() {
        simpleUse("en", "Ready");
    }

    public void testSimpleUseFrenchUid7ef427bad71a4685af0d512a32ad3dc0() {
        simpleUse("fr", "Pret");
    }



    public void testFullGroundsDoesNotBlockCoffeeUidf18f2e0d3bd44a10ac8536713305773c() {
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

    public void testWaterRunsAwayUidfdf9a09710604b619e5312ef147339e5() {
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

    public void testBeansRunOutUid6974201f5e554eeaa0ee69c1955a95f5() {
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
    public void messagesAreBasedOnLanguage(String lang, String readyMessage) {
        // When I start the coffee machine "<lang>"
        actionwords.iStartTheCoffeeMachine(lang);
        // Then message "<ready_message>" should be displayed
        actionwords.messageMessageShouldBeDisplayed(readyMessage);
    }

    public void testMessagesAreBasedOnLanguageEnglishUidcd9aed377f6a4c49aec4208bd2a23bbd() {
        messagesAreBasedOnLanguage("en", "Ready");
    }

    public void testMessagesAreBasedOnLanguageFrenchUidf7f6e5b2eb014d56ba39e325012aaa28() {
        messagesAreBasedOnLanguage("fr", "Pret");
    }



    public void testNoMessagesAreDisplayedWhenMachineIsShutDownUidb9908e9be49c4759ba69f98a9869eaca() {
        // Given the coffee machine is started
        actionwords.theCoffeeMachineIsStarted();
        // When I shutdown the coffee machine
        actionwords.iShutdownTheCoffeeMachine();
        // Then message "" should be displayed
        actionwords.messageMessageShouldBeDisplayed("");
    }
}