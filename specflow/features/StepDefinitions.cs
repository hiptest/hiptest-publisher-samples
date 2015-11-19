namespace Hiptest.Publisher.Samples {

    [Binding]
    public class StepDefinitions {

        [Given(@"^I start the coffee machine \"(.*)\"$")]
        public void IStartTheCoffeeMachine(null lang) {
            IStartTheCoffeeMachine(null lang);
        }


        [Given(@"^I shutdown the coffee machine$")]
        public void IShutdownTheCoffeeMachine() {
            IShutdownTheCoffeeMachine();
        }


        [Given(@"^message \"(.*)\" should be displayed$")]
        public void MessageMessageShouldBeDisplayed(string message) {
            MessageMessageShouldBeDisplayed(string message);
        }


        [Given(@"^coffee should be served$")]
        public void CoffeeShouldBeServed() {
            CoffeeShouldBeServed();
        }


        [Given(@"^coffee should not be served$")]
        public void CoffeeShouldNotBeServed() {
            CoffeeShouldNotBeServed();
        }


        [Given(@"^I take a coffee$")]
        public void ITakeACoffee() {
            ITakeACoffee();
        }


        [Given(@"^I empty the coffee grounds$")]
        public void IEmptyTheCoffeeGrounds() {
            IEmptyTheCoffeeGrounds();
        }


        [Given(@"^I fill the beans tank$")]
        public void IFillTheBeansTank() {
            IFillTheBeansTank();
        }


        [Given(@"^I fill the water tank$")]
        public void IFillTheWaterTank() {
            IFillTheWaterTank();
        }


        [Given(@"^I take \"(.*)\" coffees$")]
        public void ITakeCoffeeNumberCoffees(int coffeeNumber) {
            ITakeCoffeeNumberCoffees(int coffeeNumber);
        }


        [Given(@"^the coffee machine is started$")]
        public void TheCoffeeMachineIsStarted() {
            TheCoffeeMachineIsStarted();
        }


        [Given(@"^fifty coffees have been taken without filling the tank$")]
        public void FiftyCoffeesHaveBeenTakenWithoutFillingTheTank() {
            FiftyCoffeesHaveBeenTakenWithoutFillingTheTank();
        }


        [Given(@"^thirty eight coffees are taken without filling beans$")]
        public void ThirtyEightCoffeesAreTakenWithoutFillingBeans() {
            ThirtyEightCoffeesAreTakenWithoutFillingBeans();
        }
    }
}