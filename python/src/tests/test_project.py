# encoding: UTF-8
import unittest
from actionwords import Actionwords

class TestCoffeeMachineHiptestPublisherSample(unittest.TestCase):
    def setUp(self):
        self.actionwords = Actionwords(self)

    def simple_use(self, lang, ready_message):
        # Given I start the coffee machine "<lang>"
        self.actionwords.i_start_the_coffee_machine(lang = lang)
        # When I take a coffee
        self.actionwords.i_take_a_coffee()
        # Then coffee should be served
        self.actionwords.coffee_should_be_served()

    def test_Simple_use_english_uidee2c11cc6be74a99b299224211e99599(self):
        self.simple_use(lang = 'en', ready_message = 'Ready')

    def test_Simple_use_french_uid0a4254827cf44384b65e4238522882d8(self):
        self.simple_use(lang = 'fr', ready_message = 'Pret')



    def test_Full_grounds_does_not_block_coffee_uidb8381c5e8daa48a182be24b62e50f03c(self):
        # Given the coffee machine is started
        self.actionwords.the_coffee_machine_is_started()
        # When I take "29" coffees
        self.actionwords.i_take_coffee_number_coffees(coffee_number = 29)
        # Then message "Ready" should be displayed
        self.actionwords.message_message_should_be_displayed(message = "Ready")
        # When I take a coffee
        self.actionwords.i_take_a_coffee()
        # Then coffee should be served
        self.actionwords.coffee_should_be_served()
        # And message "Empty grounds" should be displayed
        self.actionwords.message_message_should_be_displayed(message = "Empty grounds")
        # When I fill the water tank
        self.actionwords.i_fill_the_water_tank()
        # And I fill the beans tank
        self.actionwords.i_fill_the_beans_tank()
        # And I take "20" coffees
        self.actionwords.i_take_coffee_number_coffees(coffee_number = 20)
        # Then coffee should be served
        self.actionwords.coffee_should_be_served()
        # And message "Empty grounds" should be displayed
        self.actionwords.message_message_should_be_displayed(message = "Empty grounds")

    def test_Water_runs_away_uid8ed010823ca84a4a929a8d4885662bdc(self):
        # Given the coffee machine is started
        self.actionwords.the_coffee_machine_is_started()
        # When fifty coffees have been taken without filling the tank
        self.actionwords.fifty_coffees_have_been_taken_without_filling_the_tank()
        # Then message "Fill tank" should be displayed
        self.actionwords.message_message_should_be_displayed(message = "Fill tank")
        # When I take a coffee
        self.actionwords.i_take_a_coffee()
        # Then coffee should be served
        self.actionwords.coffee_should_be_served()
        # When I take "10" coffees
        self.actionwords.i_take_coffee_number_coffees(coffee_number = 10)
        # Then coffee should not be served
        self.actionwords.coffee_should_not_be_served()
        # And message "Fill tank" should be displayed
        self.actionwords.message_message_should_be_displayed(message = "Fill tank")
        # When I fill the water tank
        self.actionwords.i_fill_the_water_tank()
        # Then message "Ready" should be displayed
        self.actionwords.message_message_should_be_displayed(message = "Ready")

    def test_Beans_run_out_uid7ffe0b44fc2e4e20b7a95274447188d3(self):
        # Given the coffee machine is started
        self.actionwords.the_coffee_machine_is_started()
        # When thirty eight coffees are taken without filling beans
        self.actionwords.thirty_eight_coffees_are_taken_without_filling_beans()
        # Then coffee should be served
        self.actionwords.coffee_should_be_served()
        # And message "Fill beans" should be displayed
        self.actionwords.message_message_should_be_displayed(message = "Fill beans")
        # When I take "2" coffees
        self.actionwords.i_take_coffee_number_coffees(coffee_number = 2)
        # Then coffee should be served
        self.actionwords.coffee_should_be_served()
        # And message "Fill beans" should be displayed
        self.actionwords.message_message_should_be_displayed(message = "Fill beans")
        # When I take a coffee
        self.actionwords.i_take_a_coffee()
        # Then coffee should not be served
        self.actionwords.coffee_should_not_be_served()

    def messages_are_based_on_language(self, lang, ready_message):
        # When I start the coffee machine "<lang>"
        self.actionwords.i_start_the_coffee_machine(lang = lang)
        # Then message "<ready_message>" should be displayed
        self.actionwords.message_message_should_be_displayed(message = ready_message)

    def test_Messages_are_based_on_language_english_uid53ca39b81649491781dee8a538e34137(self):
        self.messages_are_based_on_language(lang = 'en', ready_message = 'Ready')

    def test_Messages_are_based_on_language_french_uid40229798f8ee4ca7a52baf076fc282d9(self):
        self.messages_are_based_on_language(lang = 'fr', ready_message = 'Pret')



    def test_No_messages_are_displayed_when_machine_is_shut_down_uid07b20d8c545d43a78882f8ccc3488402(self):
        # Given the coffee machine is started
        self.actionwords.the_coffee_machine_is_started()
        # When I shutdown the coffee machine
        self.actionwords.i_shutdown_the_coffee_machine()
        # Then message "" should be displayed
        self.actionwords.message_message_should_be_displayed(message = "")
