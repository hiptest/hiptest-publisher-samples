# encoding: UTF-8
import unittest
from actionwords import Actionwords

class TestCoffeeMachineZestPublisherSample(unittest.TestCase):
    def setUp(self):
        self.actionwords = Actionwords(self)

    def simple_use(self, lang, ready_message):
        # Well, sometimes, you just get a coffee.
        self.actionwords.assert_displayed_message(message = "")
        self.actionwords.start_the_coffee_machine(lang = lang)
        self.actionwords.assert_displayed_message(message = ready_message)
        self.actionwords.take_a_coffee()
        self.actionwords.assert_coffee_served()
        self.actionwords.shutdown_coffee_machine()
        self.actionwords.assert_displayed_message(message = "")

    def test_Simple_use_english(self):
        self.simple_use(lang = 'en', ready_message = 'Ready')

    def test_Simple_use_french(self):
        self.simple_use(lang = 'fr', ready_message = 'Pret')



    def test_Water_runs_away(self):
        # Simple scenario showing that after 50 coffees, the "Fill tank" message is displayed but it is still possible to have coffee until the tank is fully empty.
        self.actionwords.start_the_coffee_machine()
        self.actionwords.take_coffees(coffee_number = 30)
        self.actionwords.fill_beans()
        self.actionwords.empty_coffee_grounds()
        self.actionwords.take_coffees(coffee_number = 20)
        self.actionwords.fill_beans()
        self.actionwords.empty_coffee_grounds()
        self.actionwords.assert_displayed_message(message = "Fill tank")
        self.actionwords.fill_beans()
        self.actionwords.take_a_coffee()
        self.actionwords.assert_coffee_served()
        self.actionwords.take_coffees(coffee_number = 9)
        self.actionwords.take_a_coffee()
        self.actionwords.assert_no_coffee_is_served()
        self.actionwords.assert_displayed_message(message = "Fill tank")
        self.actionwords.fill_water_tank()
        self.actionwords.empty_coffee_grounds()
        self.actionwords.assert_displayed_message(message = "Ready")

    def test_Beans_run_out(self):
        # Simple scenario showing that after 38 coffees, the message "Fill beans" is displayed but it is possible to two coffees until there is no more beans.
        self.actionwords.start_the_coffee_machine()
        self.actionwords.assert_displayed_message(message = "Ready")
        self.actionwords.take_coffees(coffee_number = 37)
        self.actionwords.empty_coffee_grounds()
        self.actionwords.fill_water_tank()
        self.actionwords.assert_displayed_message(message = "Ready")
        self.actionwords.take_a_coffee()
        self.actionwords.assert_coffee_served()
        self.actionwords.assert_displayed_message(message = "Fill beans")
        self.actionwords.take_a_coffee()
        self.actionwords.take_a_coffee()
        self.actionwords.assert_coffee_served()
        self.actionwords.assert_displayed_message(message = "Fill beans")
        self.actionwords.take_a_coffee()
        self.actionwords.assert_no_coffee_is_served()

    def test_Full_grounds_does_not_block_coffee(self):
        # You kept getting coffee even if the "Empty grounds" message is displayed. That said it's not a fantastic idea, you'll get ground everywhere when you'll decide to empty it.
        self.actionwords.start_the_coffee_machine()
        self.actionwords.take_coffees(coffee_number = 29)
        self.actionwords.assert_displayed_message(message = "Ready")
        self.actionwords.take_a_coffee()
        self.actionwords.assert_coffee_served()
        self.actionwords.assert_displayed_message(message = "Empty grounds")
        self.actionwords.fill_water_tank()
        self.actionwords.fill_beans()
        self.actionwords.take_coffees(coffee_number = 20)
        self.actionwords.assert_coffee_served()
        self.actionwords.assert_displayed_message(message = "Empty grounds")
