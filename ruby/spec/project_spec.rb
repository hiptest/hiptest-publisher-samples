# encoding: UTF-8
require 'spec_helper'
require_relative 'actionwords'

describe 'CoffeeMachineHiptestPublisherSample' do
  include Actionwords

  context "Simple use" do
    def simple_use(lang, ready_message)
      # Given I start the coffee machine "<lang>"
      i_start_the_coffee_machine(lang)
      # When I take a coffee
      i_take_a_coffee
      # Then coffee should be served
      coffee_should_be_served
    end

    it "English (uid:367ab985-2090-4051-a8c0-5859a98f597a)" do
      simple_use('en', 'Ready')
    end

    it "French (uid:79ab98fc-a5b2-45af-afd5-c2f0be90648d)" do
      simple_use('fr', 'Pret')
    end
  end

  it "Full grounds does not block coffee (uid:268fb815-e51b-4bbf-9ac0-319c0262adea)" do
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

  it "Water runs away (uid:a2a3fd8a-9662-4c4d-a505-6857c811b32e)" do
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

  it "Beans run out (uid:09f21a05-c841-4798-b5c6-c2f8f53d4b7b)" do
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

  context "Messages are based on language" do
    def messages_are_based_on_language(lang, ready_message)
      # When I start the coffee machine "<lang>"
      i_start_the_coffee_machine(lang)
      # Then message "<ready_message>" should be displayed
      message_message_should_be_displayed(ready_message)
    end

    it "English (uid:c5922e82-0ba6-4094-9572-7cd5134129c9)" do
      messages_are_based_on_language('en', 'Ready')
    end

    it "French (uid:eeb2239b-6a5a-4c0a-9877-d3388a12d83e)" do
      messages_are_based_on_language('fr', 'Pret')
    end
  end

  it "No messages are displayed when machine is shut down (uid:9674a4b2-c6f2-4c82-9d8e-f4515fff395e)" do
    # Given the coffee machine is started
    the_coffee_machine_is_started
    # When I shutdown the coffee machine
    i_shutdown_the_coffee_machine
    # Then message "" should be displayed
    message_message_should_be_displayed("")
  end
end