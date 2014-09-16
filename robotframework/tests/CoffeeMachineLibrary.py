from coffee_machine import CoffeeMachine

class CoffeeMachineLibrary(object):
    def __init__(self):
        self.sut = CoffeeMachine()

    def start_the_coffee_machine(self, lang = 'en'):
        self.sut.start(lang)

    def shutdown_coffee_machine(self):
        self.sut.stop()

    def assert_displayed_message(self, message = ''):
        if self.sut.message != message:
            raise AssertionError('%s != %s' % (self.sut.message, message))

    def assert_coffee_served(self):
        if not self.sut.coffee_served:
            raise AssertionError('No coffee served')

    def assert_no_coffee_is_served(self):
        if self.sut.coffee_served:
            raise AssertionError('A coffee is served')

    def take_a_coffee(self):
        self.sut.take_coffee()

    def empty_coffee_grounds(self):
        self.sut.empty_grounds()

    def fill_beans(self):
        self.sut.fill_beans()

    def fill_water_tank(self):
        self.sut.fill_tank()

    def take_coffees(self, coffee_number = 10):
        coffee_number = int(coffee_number)
        while (coffee_number > 0):
            self.take_a_coffee()
            coffee_number = coffee_number - 1