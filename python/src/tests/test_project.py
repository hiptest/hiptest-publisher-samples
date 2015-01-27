# encoding: UTF-8
import unittest
from actionwords import Actionwords

class TestCoffeeMachineHiptestPublisherSample(unittest.TestCase):
    def setUp(self):
        self.actionwords = Actionwords(self)

    def simple_use(self, lang, ready_message):
        self.actionwords.assert_displayed_message(message = "")
        self.actionwords.start_the_coffee_machine(lang = lang)
        self.actionwords.assert_displayed_message(message = ready_message)
        self.actionwords.take_a_coffee()
        self.actionwords.assert_coffee_served()
        self.actionwords.shutdown_coffee_machine()
        self.actionwords.assert_displayed_message(message = "")

    def test_Simple_use_english_uidee2c11cc6be74a99b299224211e99599(self):
        self.simple_use(lang = 'en', ready_message = 'Ready')

    def test_Simple_use_french_uid0a4254827cf44384b65e4238522882d8(self):
        self.simple_use(lang = 'fr', ready_message = 'Pret')



    def test_Full_grounds_does_not_block_coffee_uidb8381c5e8daa48a182be24b62e50f03c(self):
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

    def test_Water_runs_away_uid8ed010823ca84a4a929a8d4885662bdc(self):
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

    def test_Beans_run_out_uid7ffe0b44fc2e4e20b7a95274447188d3(self):
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
