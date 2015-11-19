Feature: Error messages
        As a coffee lover
        I would like to have a coffee
        But the machine is bothering me with errors messages

    Scenario: Water runs away (uid:9cf850d1-b76f-4b70-a881-5af6c572fe8a)
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

    Scenario: Beans run out (uid:bc6a5fe9-6a6c-448a-a8f7-68515a1020ee)
        Given the coffee machine is started
        When thirty eight coffees are taken without filling beans
        Then coffee should be served
        And message "Fill beans" should be displayed
        When I take "2" coffees
        Then coffee should be served
        And message "Fill beans" should be displayed
        When I take a coffee
        Then coffee should not be served
