# encoding: UTF-8

require_relative 'actionwords'
World(Actionwords)

Given /^I start the coffee machine "(.*)"$/ do |lang|
  i_start_the_coffee_machine(lang)
end

When /^I shutdown the coffee machine$/ do
  i_shutdown_the_coffee_machine
end

Then /^message "(.*)" should be displayed$/ do |message|
  message_message_should_be_displayed(message)
end

Then /^coffee should be served$/ do
  coffee_should_be_served
end

Then /^coffee should not be served$/ do
  coffee_should_not_be_served
end

When /^I take a coffee$/ do
  i_take_a_coffee
end

Given /^I empty the coffee grounds$/ do
  i_empty_the_coffee_grounds
end

And /^I fill the beans tank$/ do
  i_fill_the_beans_tank
end

When /^I fill the water tank$/ do
  i_fill_the_water_tank
end

When /^I take "(.*)" coffees$/ do |coffee_number|
  i_take_coffee_number_coffees(coffee_number)
end

Given /^the coffee machine is started$/ do
  the_coffee_machine_is_started
end

When /^fifty coffees have been taken without filling the tank$/ do
  fifty_coffees_have_been_taken_without_filling_the_tank
end

When /^thirty eight coffees are taken without filling beans$/ do
  thirty_eight_coffees_are_taken_without_filling_beans
end
