Feature: Weird specs
    As a lazy coffee user
    I can ignore the message displayed by the machine
    So I can have coffee and let other people have to clean after me

  Scenario: Full grounds does not block coffee (uid:3388c535-e092-4c67-a66a-7dbf975e7cb2)
    Given the coffee machine is started
    When I take "29" coffees
    Then message "Ready" should be displayed
    When I take a coffee
    Then coffee should be served
    And message "Empty grounds" should be displayed
    When I fill the water tank
    And I fill the beans tank
    And I take "20" coffees
    Then coffee should be served
    And message "Empty grounds" should be displayed
