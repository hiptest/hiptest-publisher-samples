Feature: Nominal case
        As a coffee lover
        I can get coffee from the machine
        So I can enjoy the rest of the day

    Scenario Outline: Simple use
        Given I start the coffee machine "<lang>"
        When I take a coffee
        Then coffee should be served

        Examples:
            | lang | ready_message | hiptest-uid |
            | en | Ready | uid:06989fd3-7d6d-4ed2-bb47-292b139485cb |
            | fr | Pret | uid:014b7607-9052-46df-9f9f-eb51b6aa890e |

    Scenario Outline: Messages are based on language
        When I start the coffee machine "<lang>"
        Then message "<ready_message>" should be displayed

        Examples:
            | lang | ready_message | hiptest-uid |
            | en | Ready | uid:9bbbcd2f-799f-4eaa-b13b-0483bda592b3 |
            | fr | Pret | uid:8ebae7c5-6ee1-4dda-9f95-4373aaddb203 |

    Scenario: No messages are displayed when machine is shut down (uid:74648221-04bb-4b9d-ad83-6ad524c2b91b)
        Given the coffee machine is started
        When I shutdown the coffee machine
        Then message "" should be displayed
