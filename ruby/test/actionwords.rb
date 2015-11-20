# encoding: UTF-8
require_relative '../src/coffee_machine'


module Actionwords
  def sut
    @sut ||= CoffeeMachine.new
  end

  def i_start_the_coffee_machine(lang = 'en')
    sut.start(lang)
  end

  def i_shutdown_the_coffee_machine
    sut.stop
  end

  def message_message_should_be_displayed(message)
    assert_equal(sut.message, message)
  end

  def coffee_should_be_served
    assert(sut.coffee_served)
  end

  def coffee_should_not_be_served
    refute(sut.coffee_served)
  end

  def i_take_a_coffee
    sut.take_coffee
  end

  def i_empty_the_coffee_grounds
    sut.empty_grounds
  end

  def i_fill_the_beans_tank
    sut.fill_beans
  end

  def i_fill_the_water_tank
    sut.fill_tank
  end

  def i_take_coffee_number_coffees(coffee_number = 10)
    while (coffee_number > 0)
      i_take_a_coffee
      coffee_number = coffee_number - 1
    end
  end

  def the_coffee_machine_is_started
    i_start_the_coffee_machine
  end

  def fifty_coffees_have_been_taken_without_filling_the_tank
    i_take_coffee_number_coffees(30)
    i_fill_the_beans_tank
    i_empty_the_coffee_grounds
    i_take_coffee_number_coffees(20)
    i_fill_the_beans_tank
    i_empty_the_coffee_grounds
  end

  def thirty_eight_coffees_are_taken_without_filling_beans
    i_take_coffee_number_coffees(37)
    i_empty_the_coffee_grounds
    i_fill_the_water_tank
    i_take_a_coffee
  end
end
