# encoding: UTF-8

require 'minitest/autorun'
require_relative 'actionwords'

class TestCoffeeMachineHiptestPublisherSample < MiniTest::Unit::TestCase
  include Actionwords

  def simple_use(lang, ready_message)
    assert_displayed_message("")
    start_the_coffee_machine(lang)
    assert_displayed_message(ready_message)
    take_a_coffee
    assert_coffee_served
    shutdown_coffee_machine
    assert_displayed_message("")
  end

  def test_Simple_use_english_uid70bd316f778e4c4db0d3b6b02fd94bfb
    simple_use('en', 'Ready')
  end

  def test_Simple_use_french_uid9a2daa7e092e4f51885518372996c7f3
    simple_use('fr', 'Pret')
  end


  def test_Full_grounds_does_not_block_coffee_uid34b48113ba1148c782717dbedcbac71f
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

  def test_Water_runs_away_uidb5bce658f38446b486c30cc74694013e
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

  def test_Beans_run_out_uid1c7b3ec4bc8f4723a50deeef11c476d3
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
end