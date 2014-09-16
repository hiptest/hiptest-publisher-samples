class CoffeeMachine:
    def __init__(self):
        self.started = False

        # Yes it's a magic machine :)
        self.fill_tank()
        self.fill_beans()
        self.empty_grounds()

        self._last_coffee_success = False

    def start(self, lang = 'en'):
        self.started = True
        self.lang = lang

    def stop(self):
        self.started = False

    @property
    def messages(self):
        i18n = {
            'en': {
                'tank': 'Fill tank',
                'beans': 'Fill beans',
                'grounds': 'Empty grounds',
                'ready': 'Ready'
            },
            'fr': {
                'tank': 'Remplir reservoir',
                'beans': 'Ajouter grains',
                'grounds': 'Vider marc',
                'ready': 'Pret'
            }
        }

        return i18n[self.lang]

    @property
    def message(self):
        if not self.started:
              return ""

        if self.tank_content <= 10:
            return self.messages['tank']

        if self.beans_content < 3:
            return self.messages['beans']

        if self.grounds_content >= 30:
            return self.messages['grounds']

        return self.messages['ready']

    @property
    def coffee_served(self):
      return self._last_coffee_success

    def take_coffee(self):
        if (self.tank_content == 0 or self.beans_content == 0):
            self._last_coffee_success = False
        else:
            self._last_coffee_success = True

            self.tank_content -= 1
            self.beans_content -= 1
            self.grounds_content += 1


    def fill_tank(self):
        self.tank_content = 60

    def fill_beans(self):
        self.beans_content = 40

    def empty_grounds(self):
        self.grounds_content = 0

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