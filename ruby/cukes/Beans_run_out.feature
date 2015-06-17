Feature: Beans run out

  Scenario: Beans run out (uid:4409893f-64ec-44ad-9298-dab944251dc3)
    Given Start the coffee machine "en"
    Given Assert displayed message "Ready"
    Given Take coffees "37"
    Given Empty coffee grounds
    Given Fill water tank
    Given Assert displayed message "Ready"
    Given Take a coffee
    Given Assert coffee served
    Given Assert displayed message "Fill beans"
    Given Take a coffee
    Given Take a coffee
    Given Assert coffee served
    Given Assert displayed message "Fill beans"
    Given Take a coffee
    Given Assert no coffee is served
