Feature: Scenarios


    Scenario Outline: Simple use
        * Assert displayed message ""
        * Start the coffee machine "<lang>"
        * Assert displayed message "<ready_message>"
        * Take a coffee
        * Assert coffee served
        * Shutdown coffee machine
        * Assert displayed message ""

        Examples:
            | lang | ready_message | hiptest-uid |
            | en | Ready | uid:be213f3d-8bd2-4c37-8ed2-3a494fd92e87 |
            | fr | Pret | uid:98096345-3522-4858-b55c-e02196b18482 |

    Scenario: Full grounds does not block coffee (uid:1d0d17c3-355e-4a6e-b293-ecaa533b21ef)
        * Start the coffee machine "en"
        * Take coffees "29"
        * Assert displayed message "Ready"
        * Take a coffee
        * Assert coffee served
        * Assert displayed message "Empty grounds"
        * Fill water tank
        * Fill beans
        * Take coffees "20"
        * Assert coffee served
        * Assert displayed message "Empty grounds"
