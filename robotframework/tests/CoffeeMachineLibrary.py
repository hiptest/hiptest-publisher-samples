from coffee_machine import CoffeeMachine

class CoffeeMachineLibrary(object):
    def __init__(self):
        self.sut = CoffeeMachine()

    def i_start_the_coffee_machine(self, lang = 'en'):
        self.sut.start(lang)

    def i_shutdown_the_coffee_machine(self):
        self.sut.stop()

    def message_message_should_be_displayed(self, message = ''):
        if self.sut.message != message:
            raise AssertionError('%s != %s' % (self.sut.message, message))

    def coffee_should_be_served(self):
        if not self.sut.coffee_served:
            raise AssertionError('No coffee served')

    def coffee_should_not_be_served(self):
        if self.sut.coffee_served:
            raise AssertionError('A coffee is served')

    def i_take_a_coffee(self):
        self.sut.take_coffee()

    def i_empty_the_coffee_grounds(self):
        self.sut.empty_grounds()

    def i_fill_the_beans_tank(self):
        self.sut.fill_beans()

    def i_fill_the_water_tank(self):
        self.sut.fill_tank()

    def i_take_coffee_number_coffees(self, coffee_number = 10):
        coffee_number = int(coffee_number)
        while (coffee_number > 0):
            self.i_take_a_coffee()
            coffee_number = coffee_number - 1
