package com.coffeemachine;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertFalse;
import static junit.framework.Assert.assertTrue;

public class Actionwords {
    public CoffeeMachine sut = new CoffeeMachine();

    public void iStartTheCoffeeMachine() {
        iStartTheCoffeeMachine("en");
    }

    public void iStartTheCoffeeMachine(String lang) {
        sut.start(lang);
    }

    public void iShutdownTheCoffeeMachine() {
        sut.stop();
    }

    public void messageMessageShouldBeDisplayed(String message) {
        assertEquals(sut.message(), message);
    }

    public void coffeeShouldBeServed() {
        assertTrue(sut.coffeeServed);
    }

    public void coffeeShouldNotBeServed() {
        assertFalse(sut.coffeeServed);
    }

    public void iTakeACoffee() {
        sut.takeCoffee();
    }

    public void iEmptyTheCoffeeGrounds() {
        sut.emptyGrounds();
    }

    public void iFillTheBeansTank() {
        sut.fillBeans();
    }

    public void iFillTheWaterTank() {
        sut.fillTank();
    }

    public void iTakeCoffeeNumberCoffees(int coffeeNumber) {
        while ((coffeeNumber > 0)) {
            iTakeACoffee();
            coffeeNumber = coffeeNumber - 1;
        }
    }

    public void theCoffeeMachineIsStarted() {
        iStartTheCoffeeMachine();
    }

    public void fiftyCoffeesHaveBeenTakenWithoutFillingTheTank() {
        iTakeCoffeeNumberCoffees(30);
        iFillTheBeansTank();
        iEmptyTheCoffeeGrounds();
        iTakeCoffeeNumberCoffees(20);
        iFillTheBeansTank();
        iEmptyTheCoffeeGrounds();
    }

    public void thirtyEightCoffeesAreTakenWithoutFillingBeans() {
        iTakeCoffeeNumberCoffees(37);
        iEmptyTheCoffeeGrounds();
        iFillTheWaterTank();
        iTakeACoffee();
    }
}