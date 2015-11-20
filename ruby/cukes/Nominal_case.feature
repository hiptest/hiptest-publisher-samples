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
      | en | Ready | uid:f94d6011-9eb6-446e-902a-f0151071b28e |
      | fr | Pret | uid:16fd8164-fafa-4cf3-9a05-4130872cff7c |

  Scenario Outline: Messages are based on language
    When I start the coffee machine "<lang>"
    Then message "<ready_message>" should be displayed

    Examples:
      | lang | ready_message | hiptest-uid |
      | en | Ready | uid:9140d6a7-36b7-4f1c-ba7b-02b0e5129849 |
      | fr | Pret | uid:7b4f480f-2195-4ada-9c35-0ac7817db642 |

  Scenario: No messages are displayed when machine is shut down (uid:5ad7cd4e-ada0-4472-8df4-df9aeeb2d70c)
    Given the coffee machine is started
    When I shutdown the coffee machine
    Then message "" should be displayed
