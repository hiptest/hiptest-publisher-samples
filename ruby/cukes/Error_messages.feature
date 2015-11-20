Feature: Error messages
    As a coffee lover
    I would like to have a coffee
    But the machine is bothering me with errors messages

  Scenario: Water runs away (uid:993fe0f5-1f98-4b01-bb3a-aafc503f4713)
    Given the coffee machine is started
    When fifty coffees have been taken without filling the tank
    Then message "Fill tank" should be displayed
    When I take a coffee
    Then coffee should be served
    When I take "10" coffees
    Then coffee should not be served
    And message "Fill tank" should be displayed
    When I fill the water tank
    Then message "Ready" should be displayed

  Scenario: Beans run out (uid:4409893f-64ec-44ad-9298-dab944251dc3)
    Given the coffee machine is started
    When thirty eight coffees are taken without filling beans
    Then coffee should be served
    And message "Fill beans" should be displayed
    When I take "2" coffees
    Then coffee should be served
    And message "Fill beans" should be displayed
    When I take a coffee
    Then coffee should not be served
