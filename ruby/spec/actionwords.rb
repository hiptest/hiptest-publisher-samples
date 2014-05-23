# encoding: UTF-8
require_relative '../src/coffee_machine'


module Actionwords
  def sut
    @sut ||= CoffeeMachine.new
  end

  def start_the_coffee_machine
    sut.start
  end

  def shutdown_coffee_machine
    sut.stop
  end

  def assert_displayed_message(message)
    sut.message.should eq(message)
  end

  def assert_coffee_served
    sut.coffee_served.should be_true
  end

  def assert_no_coffee_is_served
    sut.coffee_served.should be_false
  end

  def take_a_coffee
    sut.take_coffee
  end

  def empty_coffee_grounds
    sut.empty_grounds
  end

  def fill_beans
    sut.fill_beans
  end

  def fill_water_tank
    sut.fill_tank
  end

  def take_coffees(coffee_number = 10)
    while (coffee_number > 0)
      take_a_coffee
      coffee_number = coffee_number - 1
    end
  end
end