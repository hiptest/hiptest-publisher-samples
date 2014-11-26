package com.testng.coffeemachine;

import java.util.HashMap;
import java.util.Map;

public class CoffeeMachine {

    private boolean started = false;
    public boolean coffeeServed = false;
    private int tankContent;
    private int beansContent;
    private int groundsContent;
    private String lang;

    public CoffeeMachine() {
        fillTank();
        fillBeans();
        emptyGrounds();
    }

    public void start(String lang) {
        started = true;
        this.lang = lang;
    }

    public void stop() {
        started = false;
    }

    public String message() {
        if(!started) return "";
        if (tankContent <= 10) return i18n("tank");
        if (beansContent < 3) return i18n("beans");
        if (groundsContent >= 30) return i18n("grounds");
        return i18n("ready");
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

    public void fillTank() {
        tankContent = 60;
    }

    public void fillBeans() {
        beansContent = 40;
    }

    public void emptyGrounds() {
        groundsContent = 0;
    }

    private String i18n(String key) {
        Map<String,String> map = new HashMap<String, String>();
        if (lang.equals("fr")) {
            map.put("tank", "Remplir reservoir");
            map.put("beans", "Ajouter grains");
            map.put("grounds", "Vider marc");
            map.put("ready", "Pret");
        } else {
            map.put("tank", "Fill tank");
            map.put("beans", "Fill beans");
            map.put("grounds", "Empty grounds");
            map.put("ready", "Ready");
        }
        return map.get(key);
    }

}
