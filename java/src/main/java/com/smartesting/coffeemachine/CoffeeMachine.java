package com.smartesting.coffeemachine;

public class CoffeeMachine
{
    private boolean started = false;
    private boolean coffeeServed = false;
    private int tankContent;
    private int beansContent;
    private int groundsContent;

    public CoffeeMachine() {
        fillTank();
        fillBeans();
        emptyGrounds();
    }

    public void start() {
        started = true;
    }

    public void stop() {
        started = false;
    }

    public String message() {
        if (!started) return "";
        if (tankContent <= 10) return "Fill tank";
        if (beansContent < 3) return "Fill beans";
        if (groundsContent >= 30) return "Empty grounds";
        return "Ready";
    }

    public void takeCoffee() {
        if (tankContent == 0 || beansContent == 0) {
            coffeeServed = false;
        } else {
            coffeeServed = true;
            tankContent -= 1;
            beansContent -= 1;
            groundsContent += 1;
        }
    }

    private void fillTank() {
        tankContent = 60;
    }

    private void fillBeans() {
        beansContent = 40;
    }


    private void emptyGrounds() {
        groundsContent = 0;
    }
}
