Feature: Water runs away

  Scenario: Water runs away (uid:993fe0f5-1f98-4b01-bb3a-aafc503f4713)
    Given Start the coffee machine "en"
    Given Take coffees "30"
    Given Fill beans
    Given Empty coffee grounds
    Given Take coffees "20"
    Given Fill beans
    Given Empty coffee grounds
    Given Assert displayed message "Fill tank"
    Given Fill beans
    Given Take a coffee
    Given Assert coffee served
    Given Take coffees "9"
    Given Take a coffee
    Given Assert no coffee is served
    Given Assert displayed message "Fill tank"
    Given Fill water tank
    Given Empty coffee grounds
    Given Assert displayed message "Ready"
