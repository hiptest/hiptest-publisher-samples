# encoding: UTF-8
require 'spec_helper'
require_relative 'actionwords'

describe 'CoffeeMachineHiptestPublisherSample' do
  include Actionwords

  context "Simple use" do
    def simple_use(lang, ready_message)
      assert_displayed_message("")
      start_the_coffee_machine(lang)
      assert_displayed_message(ready_message)
      take_a_coffee
      assert_coffee_served
      shutdown_coffee_machine
      assert_displayed_message("")
    end

    it "English (uid:367ab985-2090-4051-a8c0-5859a98f597a)" do
      simple_use('en', 'Ready')
    end

    it "French (uid:79ab98fc-a5b2-45af-afd5-c2f0be90648d)" do
      simple_use('fr', 'Pret')
    end
  end

  it "Full grounds does not block coffee (uid:268fb815-e51b-4bbf-9ac0-319c0262adea)" do
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

  it "Water runs away (uid:a2a3fd8a-9662-4c4d-a505-6857c811b32e)" do
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

  it "Beans run out (uid:09f21a05-c841-4798-b5c6-c2f8f53d4b7b)" do
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