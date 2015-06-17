Feature: Full grounds does not block coffee

  Scenario: Full grounds does not block coffee (uid:3388c535-e092-4c67-a66a-7dbf975e7cb2)
    Given Start the coffee machine "en"
    Given Take coffees "29"
    Given Assert displayed message "Ready"
    Given Take a coffee
    Given Assert coffee served
    Given Assert displayed message "Empty grounds"
    Given Fill water tank
    Given Fill beans
    Given Take coffees "20"
    Given Assert coffee served
    Given Assert displayed message "Empty grounds"
