# encoding: UTF-8

require 'minitest/autorun'
require_relative 'actionwords'

class TestCoffeeMachineHiptestPublisherSample < MiniTest::Unit::TestCase
  include Actionwords

  def simple_use(lang, ready_message)
    # Given I start the coffee machine "<lang>"
    i_start_the_coffee_machine(lang)
    # When I take a coffee
    i_take_a_coffee
    # Then coffee should be served
    coffee_should_be_served
  end

  def test_Simple_use_english_uid70bd316f778e4c4db0d3b6b02fd94bfb
    simple_use('en', 'Ready')
  end

  def test_Simple_use_french_uid9a2daa7e092e4f51885518372996c7f3
    simple_use('fr', 'Pret')
  end


  def test_Full_grounds_does_not_block_coffee_uid34b48113ba1148c782717dbedcbac71f
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When I take "29" coffees
    i_take_coffee_number_coffees(29)
    # Then message "Ready" should be displayed
    message_message_should_be_displayed("Ready")
    # When I take a coffee
    i_take_a_coffee
    # Then coffee should be served
    coffee_should_be_served
    # And message "Empty grounds" should be displayed
    message_message_should_be_displayed("Empty grounds")
    # When I fill the water tank
    i_fill_the_water_tank
    # And I fill the beans tank
    i_fill_the_beans_tank
    # And I take "20" coffees
    i_take_coffee_number_coffees(20)
    # Then coffee should be served
    coffee_should_be_served
    # And message "Empty grounds" should be displayed
    message_message_should_be_displayed("Empty grounds")
  end

  def test_Water_runs_away_uidb5bce658f38446b486c30cc74694013e
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When fifty coffees have been taken without filling the tank
    fifty_coffees_have_been_taken_without_filling_the_tank
    # Then message "Fill tank" should be displayed
    message_message_should_be_displayed("Fill tank")
    # When I take a coffee
    i_take_a_coffee
    # Then coffee should be served
    coffee_should_be_served
    # When I take "10" coffees
    i_take_coffee_number_coffees(10)
    # Then coffee should not be served
    coffee_should_not_be_served
    # And message "Fill tank" should be displayed
    message_message_should_be_displayed("Fill tank")
    # When I fill the water tank
    i_fill_the_water_tank
    # Then message "Ready" should be displayed
    message_message_should_be_displayed("Ready")
  end

  def test_Beans_run_out_uid1c7b3ec4bc8f4723a50deeef11c476d3
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When thirty eight coffees are taken without filling beans
    thirty_eight_coffees_are_taken_without_filling_beans
    # Then coffee should be served
    coffee_should_be_served
    # And message "Fill beans" should be displayed
    message_message_should_be_displayed("Fill beans")
    # When I take "2" coffees
    i_take_coffee_number_coffees(2)
    # Then coffee should be served
    coffee_should_be_served
    # And message "Fill beans" should be displayed
    message_message_should_be_displayed("Fill beans")
    # When I take a coffee
    i_take_a_coffee
    # Then coffee should not be served
    coffee_should_not_be_served
  end

  def test_No_messages_are_displayed_when_machine_is_shut_down_uid7cdba6eb9c0947fe8eb14834e5dad3b2
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When I shutdown the coffee machine
    i_shutdown_the_coffee_machine
    # Then message "" should be displayed
    message_message_should_be_displayed("")
  end

  def messages_are_based_on_language(lang, ready_message)
    # When I start the coffee machine "<lang>"
    i_start_the_coffee_machine(lang)
    # Then message "<ready_message>" should be displayed
    message_message_should_be_displayed(ready_message)
  end

  def test_Messages_are_based_on_language_english_uidcb698f1ea38c4feb9087e8fa7e971aee
    messages_are_based_on_language('en', 'Ready')
  end

  def test_Messages_are_based_on_language_french_uid4dddcafb9a9a49eab84f762039b96ef4
    messages_are_based_on_language('fr', 'Pret')
  end
end