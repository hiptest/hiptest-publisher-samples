Feature: Error messages


    Scenario: Water runs away (uid:ae4016f6-9b4d-4ad7-aeba-32f710a9b6ab)
        * Start the coffee machine "en"
        * Take coffees "30"
        * Fill beans
        * Empty coffee grounds
        * Take coffees "20"
        * Fill beans
        * Empty coffee grounds
        * Assert displayed message "Fill tank"
        * Fill beans
        * Take a coffee
        * Assert coffee served
        * Take coffees "9"
        * Take a coffee
        * Assert no coffee is served
        * Assert displayed message "Fill tank"
        * Fill water tank
        * Empty coffee grounds
        * Assert displayed message "Ready"

    Scenario: Beans run out (uid:f92ba764-a84d-4779-b8ab-585148497b89)
        * Start the coffee machine "en"
        * Assert displayed message "Ready"
        * Take coffees "37"
        * Empty coffee grounds
        * Fill water tank
        * Assert displayed message "Ready"
        * Take a coffee
        * Assert coffee served
        * Assert displayed message "Fill beans"
        * Take a coffee
        * Take a coffee
        * Assert coffee served
        * Assert displayed message "Fill beans"
        * Take a coffee
        * Assert no coffee is served
