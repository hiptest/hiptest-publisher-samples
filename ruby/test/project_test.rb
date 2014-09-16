# encoding: UTF-8

require 'minitest/autorun'
require_relative 'actionwords'

class TestCoffeeMachineZestPublisherSample < MiniTest::Unit::TestCase
  include Actionwords

  def simple_use(lang, ready_message)
    # Well, sometimes, you just get a coffee.
    assert_displayed_message("")
    start_the_coffee_machine(lang)
    assert_displayed_message(ready_message)
    take_a_coffee
    assert_coffee_served
    shutdown_coffee_machine
    assert_displayed_message("")
  end

  def test_Simple_use_english
    simple_use('en', 'Ready')
  end

  def test_Simple_use_french
    simple_use('fr', 'Pret')
  end


  def test_Water_runs_away
    # Simple scenario showing that after 50 coffees, the "Fill tank" message is displayed but it is still possible to have coffee until the tank is fully empty.
    start_the_coffee_machine
    take_coffees(30)
    fill_beans
    empty_coffee_grounds
    take_coffees(20)
    fill_beans
    empty_coffee_grounds
    assert_displayed_message("Fill tank")
    fill_beans
    take_a_coffee
    assert_coffee_served
    take_coffees(9)
    take_a_coffee
    assert_no_coffee_is_served
    assert_displayed_message("Fill tank")
    fill_water_tank
    empty_coffee_grounds
    assert_displayed_message("Ready")
  end

  def test_Beans_run_out
    # Simple scenario showing that after 38 coffees, the message "Fill beans" is displayed but it is possible to two coffees until there is no more beans.
    start_the_coffee_machine
    assert_displayed_message("Ready")
    take_coffees(37)
    empty_coffee_grounds
    fill_water_tank
    assert_displayed_message("Ready")
    take_a_coffee
    assert_coffee_served
    assert_displayed_message("Fill beans")
    take_a_coffee
    take_a_coffee
    assert_coffee_served
    assert_displayed_message("Fill beans")
    take_a_coffee
    assert_no_coffee_is_served
  end

  def test_Full_grounds_does_not_block_coffee
    # You kept getting coffee even if the "Empty grounds" message is displayed. That said it's not a fantastic idea, you'll get ground everywhere when you'll decide to empty it.
    start_the_coffee_machine
    take_coffees(29)
    assert_displayed_message("Ready")
    take_a_coffee
    assert_coffee_served
    assert_displayed_message("Empty grounds")
    fill_water_tank
    fill_beans
    take_coffees(20)
    assert_coffee_served
    assert_displayed_message("Empty grounds")
  end
end