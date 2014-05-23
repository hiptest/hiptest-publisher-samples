# encoding: UTF-8

from coffee_machine import CoffeeMachine

class Actionwords:
    def __init__(self, test):
        self.sut = CoffeeMachine()
        self.test = test

    def start_the_coffee_machine(self):
        self.sut.start()

    def shutdown_coffee_machine(self):
        self.sut.stop()

    def assert_displayed_message(self, message):
        self.test.assertEqual(self.sut.message, message)

    def assert_coffee_served(self):
        self.test.assertTrue(self.sut.coffee_served)

    def assert_no_coffee_is_served(self):
        self.test.assertFalse(self.sut.coffee_served)

    def take_a_coffee(self):
        self.sut.take_coffee()

    def empty_coffee_grounds(self):
        self.sut.empty_grounds()

    def fill_beans(self):
        self.sut.fill_beans()

    def fill_water_tank(self):
        self.sut.fill_tank()

    def take_coffees(self, coffee_number = 10):
        while (coffee_number > 0):
            self.take_a_coffee()
            coffee_number = coffee_number - 1
