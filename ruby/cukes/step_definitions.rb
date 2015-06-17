# encoding: UTF-8

require_relative 'actionwords'
World(Actionwords)

Given /^Assert no coffee is served$/ do
  assert_no_coffee_is_served
end

Given /^Fill water tank$/ do
  fill_water_tank
end

Given /^Empty coffee grounds$/ do
  empty_coffee_grounds
end

Given /^Fill beans$/ do
  fill_beans
end

Given /^Shutdown coffee machine$/ do
  shutdown_coffee_machine
end

Given /^Take coffees "(.*)"$/ do |coffee_number|
  take_coffees(coffee_number)
end

Given /^Take a coffee$/ do
  take_a_coffee
end

Given /^Assert coffee served$/ do
  assert_coffee_served
end

Given /^Start the coffee machine "(.*)"$/ do |lang|
  start_the_coffee_machine(lang)
end

Given /^Assert displayed message "(.*)"$/ do |message|
  assert_displayed_message(message)
end
