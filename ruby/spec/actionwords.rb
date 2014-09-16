# encoding: UTF-8
require_relative '../src/coffee_machine'


module Actionwords
  def sut
    @sut ||= CoffeeMachine.new
  end

  def start_the_coffee_machine(lang = 'en')
    sut.start(lang)
  end

  def shutdown_coffee_machine
    sut.stop
  end

  def assert_displayed_message(message)
    expect(sut.message).to eq(message)
  end

  def assert_coffee_served
    expect(sut.coffee_served).to be_truthy
  end

  def assert_no_coffee_is_served
    expect(sut.coffee_served).to be_falsey
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