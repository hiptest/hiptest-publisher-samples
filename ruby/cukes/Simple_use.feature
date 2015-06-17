Feature: Simple use

  Scenario Outline: Simple use
    Given Assert displayed message ""
    Given Start the coffee machine "<lang>"
    Given Assert displayed message "<ready_message>"
    Given Take a coffee
    Given Assert coffee served
    Given Shutdown coffee machine
    Given Assert displayed message ""

    Examples:
      | lang | ready_message | hiptest-uid |
      | en | Ready | uid:f94d6011-9eb6-446e-902a-f0151071b28e |
      | fr | Pret | uid:16fd8164-fafa-4cf3-9a05-4130872cff7c |
