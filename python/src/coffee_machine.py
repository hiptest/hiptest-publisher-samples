class CoffeeMachine:
    def __init__(self):
        self.started = False

        # Yes it's a magic machine :)
        self.fill_tank()
        self.fill_beans()
        self.empty_grounds()

        self._last_coffee_success = False

    def start(self):
        self.started = True

    def stop(self):
        self.started = False

    @property
    def message(self):
        if not self.started:
              return ""

        if self.tank_content <= 10:
            return "Fill tank"

        if self.beans_content < 3:
            return "Fill beans"

        if self.grounds_content >= 30:
            return "Empty grounds"

        return "Ready"

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